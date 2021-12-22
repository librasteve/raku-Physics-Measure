unit module Physics::Measure:ver<1.0.4>:auth<Steve Roe (p6steve@furnival.net)>;
use Physics::Unit;
use Physics::Error;

#This module needs the export label :ALL to load postfix operators
# use Physics::Measure;      ...10s first-, 1.2s pre- compiled 
# use Physics::Measure :ALL; ...13s first-, 2.8s pre- compiled 

#This module uses Type Variables such as ::T,::($s) 
#viz. http://www.jnthn.net/papers/2008-yapc-eu-raku6types.pdf

#Conceptually 'Length = 12.5 ±0.05 m' && Length = 12.5nm ±[1.25nm|1.25|10%]   (FIXME v2 will implement errors)
#viz. https://www.mathsisfun.com/measure/error-measurement.html

######## Constants & Definitions ########

my $db = 0;					#debug

#our $round-val = 0.00000000000000001;  (eg. this is 17 decimal places ~ the limit of Num precision)
our $round-val = Nil;       #default off - so uses the precision of Error to control value rounding

constant \isa-length = 'Distance' | 'Breadth' | 'Width' | 'Height' | 'Depth';

my regex number {
	\S+                     #grab chars
	<?{ +"$/" ~~ Real }>    #assert coerces via '+' to Real
}

##### Passthrough of Physics::Unit::GetUnit #####

#| design intent is for Measure (.new) to encapsulate Physics::Unit
#| objective is to eliminate 'use lozenges' and to shorten 'use list'
#| occasionally need this for eg. instantiate 'J' to autoreduce 'kg m^2/s^2'

sub GetMeaUnit( $u ) is export {
    GetUnit( $u )
}

########## Classes & Methods ##########

class Time { ... }
class Dimensionless { ... }

class Measure is export {
    #Parent class for physical quantities with value, units & error(wip)
    #Builds child classes such as Distance, Mass, Power, etc. 

    has	Real  $.value is rw;
    has Unit  $.units is rw;
    has Error $.error is rw;

	#### Constructors ####
    multi method new( :$value, :$units, :$error ) {		say "new from attrs" if $db;
        self.bless( :$value, units => GetUnit($units), error => Error.new(:$error, :$value) )
    }
    multi method new( ::T: Measure:D $m ) {				say "new from Measure" if $db;
        my $value = $m.value;
        my $units = $m.units;
        my $error = $m.error.absolute with $m.error;
        ::T.new( :$value, :$units, :$error )
    }
    multi method new( Str:D $string ) {					say "new from Str" if $db;
        my ( $value, $units, $error ) = Measure.defn-extract( $string );
        $units = GetUnit( $units );
        my $type = $units.type( :just1 ) || 'Measure';
        ::($type).new( :$value, :$units, :$error )
    }
    multi method new( Duration:D $d ) {				    say "new from Duration" if $db;
        my $value = +"$d";                              #extract value of Duration in s
        Time.new( :$value, units => GetUnit('s') )      #error => Any
    }
    method clone( ::T: ) {							    say "cloning " ~ T.^name if $db;
        T.new: self
    }
    method TWEAK {
        $!error.bind-mea-value: $!value with $!error;
    }

    #### Class Methods ####
    #baby Grammar for initial extraction of definition from Str (value/unit/error)
    method defn-extract( Measure:U: Str:D $s ) {
        #handle eg. <45°30′30″>
        #<°> is U+00B0 <′> is U+2032 <″> is U+2033
        if $s ~~ /(\d*)\°(\d*)\′(\d*)\″?/ {
            my $deg where 0 <= * < 360 = $0 % 360;
            my $min where 0 <= * <  60 = $1 // 0;
            my $sec where 0 <= * <  60 = $2 // 0;
            my $v = ( ($deg * 3600) + ($min * 60) + $sec ) / 3600;

            say "extracting «$s»: v is $deg°$min′$sec″, u is degrees, e is Any" if $db;
            return($v, 'degrees', Any)
        }

        #handle hh:mm:ss
        elsif $s ~~ /('-'?)(\d*)\:(\d*)\:(\d*)/ {
            my $neg = $0 // '';
            my $hrs = $1 //  0;
            my $min where 0 <= * < 60 = $2 // 0;
            my $sec where 0 <= * < 60 = $3 // 0;
            my $v = ( ($hrs * 3600) + ($min * 60) + $sec );
            $v = -$v if $neg eq '-';

            say "extracting «$s»: sign is $neg, v is $hrs:$min:$sec (thus $v), u is seconds, e is Any" if $db;
            return($v, 'seconds', Any)
        }

        #handle generic case
        else {
            $s ~~ /^ ( <number> ) \s* ( <-[±]>* ) \s* ( '±' \s* .* )? $/;
            my $v = +$0;
            my $u = ~$1;
            my $e = $2 // '';
               $e ~~ s/'±'//;

            given $e {
                when /'%'/ {
                    $e ~~ s/'%'//;
                    $e = "$e%" if $e ~~ /<number>/;
                }
                default {
                    $e = +$e if $e ~~ /<number>/;
                }
            }

            say "extracting «$s»: v is «$v», u is «$u», e is «$e» as {$e.^name}" if $db;
            return($v, $u, $e)
        }
    }

	#### Coercion & Output ####
    method Real      { $.value }

    method Numeric   { $.value }

    method value-r   {
        return( $round-val ?? $.value.round($round-val) !! $.value )
    }

    method Str {
        with self.error {
            my ( $error, $round ) = self.error.denorm;
            if $round-val && $round-val > $round {
                $round = $round-val;
                $error = $error.round($round);
            }
            my $value = $round ?? $!value.round($round) !! $!value;
            return "{ $value }{ $.units } ±{ $error }"
        } else {
            return "{ $.value-r }{ $.units }"
        }
    }
    method gist {
        return self.Str
    }
    method canonical {
		my $rebased = $.in( $.units.canonical);
		"{$rebased.value-r} {$.units.canonical}"
	}
    method pretty    {
		my $rebased = $.in( $.units.canonical);
		"{$rebased.value-r} {$.units.pretty}"
	}

	#### Maths Operations ####
	method make-same-unit( $r ) {
        if ! self.units.type eq $r.units.type {
            die "Cannot combine Measures of different Types!"
        }
        if ! self.units.same-unit( $r.units ) {
			say "Converting right hand Measure to combine!" if $db;
			return $r.in( self.units )
		}
		return $r
	}

    method add-error-abs( $r ) {
        with $!error {
            #take larger value as argument for round()
            my $rnd-l = $.error.denorm[1];
            my $rnd-r = $r.error.denorm[1];
            my $round = $rnd-l > $rnd-r ?? $rnd-l !! $rnd-r;

            #take larger value as argument for round()
            $!error.add-abs($r.error);
            $!error.absolute .= round($round);
        } orwith $r.error {
            $!error = $r.error;
            $!error.bind-mea-value: $!value
        }
    }
    method add-error-rel( $r, $combined-value ) {
        my ( $err-abs, $round );
        with $!error {
            $err-abs = $!error.add-rel($r.error) * $combined-value;

            #take larger value as argument for round()
            my $rnd-l = $.error.denorm[1];
            my $rnd-r = $r.error.denorm[1];
            $round = $rnd-l > $rnd-r ?? $rnd-l !! $rnd-r
        } orwith $r.error {
            $err-abs = $r.error.relative * $combined-value;
            $round = $r.error.denorm[1]
        }
        return ( $err-abs, $round )
    }

    method add( $r is copy ) {
		$r = self.make-same-unit( $r );
		self.value += $r.value;
        self.add-error-abs( $r );
		return self
    }
    method add-const(Real:D $r) {
        self.value += $r;
        #abs error is same
        return self
    }

    method subtract( $r is copy ) {
		$r = self.make-same-unit( $r );
		self.value -= $r.value;
        self.add-error-abs( $r );
		return self
    }
    method subtract-const(Real:D $r) {
        self.value -= $r;
        #abs error is same
        return self
    }
    method negate {
        self.value *= -1;
        #abs error is same
        return self
    }

    method multiply( Measure:D $r is copy ) {	    #eg. Distance * Distance => Area
        my $l = self.rebase;
        $r .= rebase;

        my $value = $l.value * $r.value;
        my ( $type, $units ) = $l.units.multiply( $r.units );
        my ( $error, $round ) = $l.add-error-rel( $r, $value );
        $error .= round($round) if $round && $round != 0;

        ::($type).new( :$value, :$units, :$error );
    }
    method multiply-const(Real:D $r) {
        self.value *= $r;
        with self.error {
            my $round = self.error.denorm[1];
            self.error.absolute *= $r;
            self.error.absolute .= round($round);
        }
        return self
    }
    method divide( Measure:D $r is copy ) {			#eg. Distance / Time => Speed
        my $l = self.rebase;
        $r .= rebase;

        my $value = $l.value / $r.value;
        my ( $type, $units ) = $l.units.divide( $r.units );
        my ( $error, $round ) = $l.add-error-rel( $r, $value );
        $error .= round($round) if $round && $round != 0;

        ::($type).new( :$value, :$units, :$error );
    }
    method divide-by-const( Real:D $r ) {
        self.value /= $r;
        with self.error {
            my $round = self.error.denorm[1];
            self.error.absolute /= $r;
            self.error.absolute .= round($round);
        }
        return self
    }
    method reciprocal {								#eg. 1 / Time => Frequency
        my $r = self.rebase;

        my $value = 1 / $r.value;
        my ( $type, $units ) = GetUnit('unity').divide( $r.units );
        my $round = $r.error.denorm[1] with $r.error;
        my $error = ( $r.error.relative * $value ).round($round) with $r.error;

        ::($type).new( :$value, :$units, :$error );
    }
    method power( Int:D $n ) {						#eg. Area ** 2 => Distance
        my $result = self;
        my $factor = self;
        for 2..$n {
            $result .= multiply( $factor );
        }
        return $result
    }
    method root( Int:D $n where 1 <= $n <= 4 ) {
		my $l = self.rebase;

        my $value = $l.value ** ( 1 / $n );
        my ( $type, $units ) = $.units.root-extract( $n );
        my $round = $l.error.denorm[1] / (10 ** $n) with $l.error;
        my $error = ( $l.error.relative / $n * $value ).round($round) with $l.error;

        ::($type).new( :$value, :$units, :$error );
    }
    method sqrt() {
        return self.root( 2 )
    }

    #### Convert & Compare ####

    #| convert units and adjust value
    method in( ::O: $to ) {
		my $ouo = $.units;					        #old unit object
		my $nuo = GetUnit( $to );			        #new unit object

		my $n-type = $nuo.type( :just1 );

        dd $n-type;
        dd ::($n-type);

        dd ::O;

        ::O ~~ /Physics::Measure::(.*)/;

        if $0 ~~ isa-length.any {
            say "yo"
        }

        #allow new type to match old eg. if allomorph
		if not ::($n-type) ~~ ::O {
            die "cannot convert in to different type $n-type"
        }

		my $value = ($.value + $ouo.offset) * ($ouo.factor / $nuo.factor) - $nuo.offset;
        my $error = self.error.absolute * ($ouo.factor / $nuo.factor) with self.error;

		::($n-type).new( :$value, units => $nuo, :$error )
	}

    #| adjust prefix (affix) to optimize value significance
	method norm {
        my %abn = GetAffixByName;

		#try to match via unit defn eg. petahertz
		my $defn = self.units.defn;
		my $afx-defn = %abn.values.grep(/^ $defn $/).first;

		#try to match via unit name eg. Hz
		my $name = self.units.name;
		my $afx-name = %abn.keys.grep(/^ $name $/ ).first;

		#setup some hashes and arrays
		my %pfix2fact = GetPrefixToFactor;
		my %fact2pfix = %pfix2fact.kv.reverse;
           %fact2pfix{'1'} = '';                    #plug gap in factors for vanilla base units
		my @pfixs = %pfix2fact.keys;

		#what is initial prefix factor and base unit?
		my ( $fact, $base );
		if $afx-defn {
			$afx-defn ~~ m|(<@pfixs>)(.*)|;
			$fact = $0.so ?? %pfix2fact{$0} !! 1;   #handle no prefix case
			$base = $1.so ?? ~$1 !! $afx-defn;      #handle no prefix case
		} elsif $base = %abn{$afx-name} {
			$fact = 1;
		} else {
			warn "Cannot normalize this Unit type";
			return self;
		}

		my $res = self;
		# either shift-right
		while $res.value.abs > 1000 {
            last if $fact >= 1e24;
			$fact *= 1000;
			$res = $res.in: qq|{%fact2pfix{$fact}}$base|;
		}
		# or shift-left
		while $res.value.abs < 1 {
            last if $fact <= 1e-24;
			$fact /= 1000;
			$res = $res.in: qq|{%fact2pfix{$fact}}$base|;
		}
		return $res;
	}

    #| convert to base (prototype) unit of type
	method rebase {
		self.in( GetPrototype( self.units.type( :just1 ) ))
	}

    #| compare units
    method cmp( $a: $b ) {
		my ($an, $bn);
        if ! $a.units.type eq $b.units.type {
            die "Cannot cmp two Measures of different Type!"
        }
        if ! $a.units.same-unit( $b.units ) {
			say "Converting right hand Measure to cmp!" if $db;
			$an = $a;
			$bn = $b.in( $a.units )
		} else {
			say "Rebasing Measures for cmp." if $db;
			$an = $a.rebase;
			$bn = $b.rebase;
		}

        my $an-max = my $an-min = $an.value;
        with $an.error {
            $an-max = $an.value + $an.error.absolute;
            $an-min = $an.value - $an.error.absolute;
        }
        my $bn-max = my $bn-min = $bn.value;
        with $bn.error {
            $bn-max = $bn.value + $bn.error.absolute;
            $bn-min = $bn.value - $bn.error.absolute;
        }

        if $an.value == $bn.value {
            return Order::Same
        } elsif $an.value > $bn.value {
            if $an-min > $bn-max {
                return Order::More
            } else {
                return Order::Same
            }
        } elsif $an.value < $bn.value {
            if $an-max < $bn-min {
                return Order::Less
            } else {
                return Order::Same
            }
        }
    }
}

######## Special Measures ########

class Time is Measure is export {
    #Duration ops <+> <-> <mod>

    multi method Duration {				#ie. $d = $t.Duration
		my $nmo = self.in('s');
        return Duration.new( $nmo.value );
    }
    method hms(*%h)  {
        my $abs = $.value.abs;
        my $neg = $.value < 0 ?? '-' !! '';

        my $hrs = ( $abs / 3600 ).floor;
        my $rem = ( $abs - ($hrs * 3600) );
        my $min = ( $rem /   60 ).floor;
        my $sec = ( $rem - ($min *   60) );

        return( $neg, $hrs, $min, $sec )
    }
    method Str {
        if self.units.name eq <s> && self.value.abs >= 60 {
            my ( $neg, $hrs, $min, $sec ) = self.in('s').hms;
            $sec = $round-val ?? $sec.round($round-val) !! $sec;
            $neg ~ sprintf( '%02d:%02d:%02d', $hrs, $min, $sec );
        } else {
            nextsame
        }
    }
}

class Angle is Measure is export {
	method dms(*%h)  {
		my $abs = %h<negate> ?? -$.value !! $.value;

		my $deg = $abs.floor;
		my $rem = ( $abs - $deg ) * 60;
		my $min = $rem.floor;
		my $sec = ( $rem - $min ) * 60;

		if %h<no-secs> {
			return( $deg, $rem )
		} else {
			return( $deg, $min, $sec )
		}
	}
	method Str {
		if self.units.name eq <°> {
			my ( $deg, $min, $sec ) = self.dms;
			$sec = $round-val ?? $sec.round($round-val) !! $sec;
			qq{$deg°$min′$sec″}
		} else {
			nextsame
		}
	}
}

#| override sin/cos/tan for Unit type Angle
#| automatically convert argument to radians
multi sin( Angle:D $a ) is export {
    sin( $a.in('radian').value );
}
multi cos( Angle:D $a ) is export {
    cos( $a.in('radian').value );
}
multi tan( Angle:D $a ) is export {
    tan( $a.in('radian').value );
}

#| override asin/acos/atan accept unitsof arg and return Angle object
multi asin( Numeric:D $x, Str :$units! ) is export {
    my $a = Angle.new( value => asin( $x ), units => 'radians' );
    return $a.in( $units );
}
multi acos( Numeric:D $x, Str :$units! ) is export {
    my $a = Angle.new( value => acos( $x ), units => 'radians' );
    return $a.in( $units );
}
multi atan( Numeric:D $x, Str :$units! ) is export {
    my $a = Angle.new( value => atan( $x ), units => 'radians' );
    return $a.in( $units );
}

######## Child Classes ########

#SI Base Units
class Length             is Measure is export {}
class Mass               is Measure is export {}
class Current            is Measure is export {}
class Temperature        is Measure is export {}
class Substance          is Measure is export {}
class Luminosity         is Measure is export {}

#Derived Units
class Dimensionless      is Measure is export {}
class SolidAngle         is Measure is export {}
class Frequency          is Measure is export {}
class Area               is Measure is export {}
class Volume             is Measure is export {}
class Speed              is Measure is export {}
class AngularSpeed       is Measure is export {}
class Acceleration       is Measure is export {}
class MomentOfInertia    is Measure is export {}
class Momentum           is Measure is export {}
class AngularMomentum    is Measure is export {}
class Force              is Measure is export {}
class Torque             is Measure is export {}
class Impulse            is Measure is export {}
class Pressure           is Measure is export {}
class Density            is Measure is export {}
class Energy             is Measure is export {}
class Power              is Measure is export {}
class Charge             is Measure is export {}
class Potential          is Measure is export {}
class Resistance         is Measure is export {}
class Conductance        is Measure is export {}
class Capacitance        is Measure is export {}
class Inductance         is Measure is export {}
class MagneticFlux       is Measure is export {}
class MagneticField      is Measure is export {}
class LuminousFlux		 is Measure is export {}
class Illuminance		 is Measure is export {}
class Radioactivity		 is Measure is export {}
class Dose               is Measure is export {}
class CatalyticActivity  is Measure is export {}
class FuelConsumption    is Measure is export {}
class FuelEfficiency     is Measure is export {}

#Synonyms for Length...
class Distance           is Length is export {}
class Breadth            is Length is export {}
class Width              is Length is export {}
class Height             is Length is export {}
class Depth              is Length is export {}

######## Functional Operator Overrides ########

multi prefix:<♎️>    ( Str:D $new )      is export { Measure.new: $new }
multi prefix:<♎️>    ( Duration:D $new ) is export { Measure.new: $new }

multi prefix:<libra> ( Str:D $new )      is export { Measure.new: $new }
multi prefix:<libra️> ( Duration:D $new ) is export { Measure.new: $new }

sub infix-prep( $left, $right ) {
    #clone Measure child object (e.g. Distance) as container for result
    #coerce other arg. to Measure child with new unless already isa
    #don't forget to swap sides back e.g.for intransigent operations

    my ( $result, $argument );
    if $left ~~ Measure && $right ~~ Measure {
        $result   = $left.clone;
        $argument = $right;
    } elsif $left ~~ Measure {
        $result   = $left.clone;
        $argument = $left.clone.new: $right;
    } elsif $right ~~ Measure {
        $result   = $right.clone.new: $left;
        $argument = $right.clone;
    }
    return( $result, $argument );
}

multi prefix:<-> ( Measure:D $right) is export {
    my $result = $right.clone;
    return $result.negate;
}

multi infix:<+> ( Measure:D $left, Real:D $right ) is export {
    my $result   = $left.clone;
    my $argument = $right;
    return $result.add-const( $argument );
}
multi infix:<+> ( Real:D $left, Measure:D $right ) is export {
    my $result   = $right.clone;
    my $argument = $left;
    return $result.add-const( $argument );
}
multi infix:<+> ( Measure:D $left, Measure:D $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.add( $argument );
}

multi infix:<-> ( Measure:D $left, Real:D $right ) is export {
    my $result   = $left.clone;
    my $argument = $right;
    return $result.subtract-const( $argument );
}
multi infix:<-> ( Real:D $left, Measure:D $right ) is export {
    my $result   = $right.clone;
    my $argument = $left;
    return $result.subtract-const( $argument );
}
multi infix:<-> ( Measure:D $left, Measure:D $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.subtract( $argument );
}

multi infix:<*> ( Measure:D $left, Real:D $right ) is export {
    my $result   = $left.clone;
    my $argument = $right;
    return $result.multiply-const( $argument );
}
multi infix:<*> ( Real:D $left, Measure:D $right ) is export {
    my $result   = $right.clone;
    my $argument = $left;
    return $result.multiply-const( $argument );
}
multi infix:<*> ( Measure:D $left, Measure:D $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.multiply( $argument );
}

multi infix:</> ( Measure:D $left, Real:D $right ) is equiv( &infix:</> ) is export {
    my $result   = $left.clone;
    my $argument = $right;
    return $result.divide-by-const( $argument );
}
multi infix:</> ( Real:D $left, Measure:D $right ) is equiv( &infix:</> ) is export {
    my $result   = $right.clone;
    my $argument = $left;
    my $recip = $result.reciprocal;
    return $recip.multiply-const( $argument );
}
multi infix:</> ( Measure:D $left, Measure:D $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.divide( $argument );
}

multi infix:<**> ( Measure:D $left, Int:D $right where 2..4 ) is equiv( &infix:<**> ) is export {
    # 2(square),3(cube),4(fourth) e.g. T**4 for Boltzmann constant
    my $result   = $left.clone;
    my $argument = $right;
    return $result.power( $argument );
}
multi infix:<**> ( Measure:D $left, Rat:D $right where (<1/2>,<1/3>,<1/4>).one ) is equiv( &infix:<**> ) is export {
    # 1/2 (sqrt), 1/3 (curt), 1/4 (fort) - NB also method sqrt() defined in Measure Class
    my $result   = $left.clone;
    my $argument = ( 1 / $right ).Int;
    return $result.root( $argument );
}
multi sqrt ( Measure:D $left ) is export {
    return $left.clone.sqrt;
}

multi infix:<cmp> ( Measure:D $a, Measure:D $b ) is equiv( &infix:<cmp> ) is export {
    return $a.cmp( $b );
}
multi infix:<==> ( Measure:D $a, Measure:D $b ) is equiv( &infix:<==> ) is export {
    if $a.cmp( $b) ~~ Same { return True; }
    else { return False; }
}
multi infix:<!=> ( Measure:D $a, Measure:D $b ) is equiv( &infix:<!=> ) is export {
    if $a.cmp( $b) ~~ Same { return False; }
    else { return True; }
}

##### Affix Operators #####

#`[[ 
'Affix Operators' combine the notions of:
1. SI Prefixes e.g. c(centi-), k(kilo-) that make compound units such as cm, km, kg  
2. Raku Postfixes e.g. $l = 42cm; operators which work on the preceding value

We use the term Affix to indicate that both concepts are provided by this code:
1. Construction of the cross product of SI Prefixes (20) with ( SI Base (7) + Derived (20) ) Units
2. Declaration of the resulting ~540 Unit instances and matching Raku Postfix operators

Now you can simply go 'my $l = 1km;' to construct a new Measure object with value => 1 and units => 'km'
#]]

my %affix-by-name = GetAffixByName;
my %affix-syns-by-name = GetAffixSynsByName;

sub do-postfix( Real $v, Str $cn ) is export {
    my $u = Unit.new( defn => $cn, names => %affix-syns-by-name{$cn} );
    my $t = $u.type(:just1);
    return ::($t).new(value => $v, units => $u);
}

#eg. sub postfix:<m> ( Real:D $x ) is export { do-postfix( $x, 'm' ) }

#| first a few "non-declining singletons"...
sub postfix:<°>         (Real:D $x) is export { do-postfix($x,'°') }
sub postfix:<°C>        (Real:D $x) is export { do-postfix($x,'°C') }
sub postfix:<radian>    (Real:D $x) is export { do-postfix($x,'radian') }
sub postfix:<steradian> (Real:D $x) is export { do-postfix($x,'steradian') }

#| then put in all the regular combinations programmatically
#| viz. https://docs.raku.org/language/modules#Exporting_and_selective_importing
my package EXPORT::ALL {
	for %affix-by-name.keys -> $u {
        OUR::{'&postfix:<' ~ $u ~ '>'} := sub (Real:D $x) { do-postfix($x,"$u") };
	}
}

##### Error ± Operators #####
sub postfix:<%> ( Real:D $x --> Str ) is export {
    "$x%"
}
multi infix:<±> ( Measure:D $m, Real:D $error --> Measure ) is export {
    $m.error = Error.new( :$error, value => $m.value );
    $m.error.bind-mea-value: $m.value;
    return $m
}
multi infix:<±> ( Measure:D $m, Str:D $error --> Measure ) is export {
    $m.error = Error.new( :$error, value => $m.value );
    $m.error.bind-mea-value: $m.value;
    return $m
}

#EOF
