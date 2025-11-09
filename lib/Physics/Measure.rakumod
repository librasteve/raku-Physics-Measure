unit module Physics::Measure:ver<2.0.16>:auth<Steve Roe (librasteve@furnival.net)>;
use Physics::Unit;
use Physics::Error;
use FatRatStr;

INIT $*RAT-OVERFLOW=FatRat;

#This module needs the export label :ALL to load postfix operators

# speed (2020)
# use Physics::Measure;      ...10s first-, 1.2s pre- compiled 
# use Physics::Measure :ALL; ...13s first-, 2.8s pre- compiled 

# speed (2025)
# use Physics::Measure :ALL; ...1.4ss first-, 1.4s pre- compiled

#This module uses Type Variables such as ::T,::($s) 
#viz. http://www.jnthn.net/papers/2008-yapc-eu-raku6types.pdf

#Conceptually 'Length = 12.5 ±0.05 m' && Length = 12.5nm ±[1.25nm|1.25|10%]
#viz. https://www.mathsisfun.com/measure/error-measurement.html

######## Constants & Definitions ########

my $db = 0;					#debug

constant \isa-length = 'Distance' | 'Breadth' | 'Width' | 'Height' | 'Depth';

#our $round-val = 0.00000000000000001;  (eg. this is 17 decimal places ~ the limit of Num precision)
our $round-val = Nil;       #default off - use precision of Error to control value rounding
our $round-sig = False;     #default off - apply 1/round-val to truncate sig dits to left of decimal

my regex number {
	\S+                     #grab chars
	<?{ +"$/" ~~ Real }>    #assert coerces via '+' to Real
}

########## Classes & Methods ##########

class Time { ... }
class Synthetic {...}
class Dimensionless { ... }

class Measure is export {
    #Parent class for physical quantities with value, units & error
    #Builds child classes such as Distance, Mass, Power, etc. 

    has	      $.value is rw;    #drop type Real to allow Math::Vector as value
    has Unit  $.units is rw;
    has Error $.error is rw;

	#### Constructors ####
    multi method new( :v(:$value), :u(:$units), :e(:$error) ) {		say "new from attrs" if $db;
        self.bless( :$value, units => Unit.find($units), error => Error.new(:$error, :$value) )
    }
    multi method new( ::T: Measure:D $m ) {				say "new from Measure" if $db;
        my $value = $m.value;
        my $units = $m.units;
        my $error = $m.error.absolute with $m.error;
        ::T.new( :$value, :$units, :$error )
    }
    multi method new( Str:D $string ) {					say "new from Str" if $db;
        my ( $value, $units, $error ) = Measure.defn-extract( $string );
        $units = Unit.find( $units );

        my $type = $units.type || 'Measure';
        $type = 'Synthetic' if $type ~~ /synthetic/;
        ::($type).new( :$value, :$units, :$error )
    }
    multi method new( Duration:D $d ) {				    say "new from Duration" if $db;
        my $value = +"$d";                              #extract value of Duration in s
        Time.new( :$value, units => Unit.find('s') )      #error => Any
    }
    method clone( ::T: ) {							    say "cloning " ~ T.^name if $db;
        T.new: self
    }
    method TWEAK {
        $!error.bind-mea-value: $!value with $!error;
    }

    #### Class Methods ####

    #| baby "Grammars" for initial extraction of definition from Str (value/unit/error)
    method defn-extract( Measure:U: Str:D $s ) {

        #handle Angles ie. <45°30′30″>
        my regex deg { <[°º]> }     # U+00B0 | U+00BA
        my regex min { <[′']> }     # U+2032 | U+0027
        my regex sec { <[″"]> }     # U+2033 | U+0022

        if $s ~~ /(\d*)<deg>(\d*)<min>(\d*)<sec>?/ {
            my $deg where 0 <= * < 360 = $0 % 360;
            my $min where 0 <= * <  60 = $1 // 0;
            my $sec where 0 <= * <  60 = $2 // 0;
            my $v = ( ($deg * 3600) + ($min * 60) + $sec ) / 3600;

            say "extracting «$s»: v is {$deg}°$min′$sec″, u is degrees, e is Any" if $db;
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
            my $t = $s;    #need writeable container for match
            $t ~~ /^ ( <number> ) \s* ( <-[±~]>* ) \s* [<[±~]> \s* (.*) ]? $/;

            my Real $v = +$0;
            my Str  $u = ~$1;
            my      $e =  $2 // '';

            # upgrade decimal literal (eg. 1.6602e-17) to FatRat (and forget the original Str)
            $v = $0.Str.FatRatStr.FatRat if $v ~~ Num;

            return($v, $u, Any) unless $e;

            $e ~~ s/<[±~]>//;

            given $e {
                when /'%'/ {
                    $e ~~ s/'%'//;
                    $e = "$e%" if $e ~~ /<number>/;
                }
                default {
                    $e = +$e if $e ~~ /<number>/;
                    $e = $e.Str.FatRatStr.FatRat if $e ~~ Num;
                }
            }

            say "extracting «$s»: v is «$v», u is «$u», e is «$e» as {$e.^name}" if $db;
            return($v, $u, $e)
        }
    }

    #| passthrough of Physics::Unit.find top shorten 'use list'
    method unit-find(Measure:U: $u ) {
        Unit.find( $u )
    }

	#### Coercion & Output ####
    method Real      { $.value }

    method Numeric   { $.value }

    sub round-sig(Num() $num --> Num()) {
        return $num if $num == 0;
        my $sig = -log10($round-val).round.Int;
        my $power = floor(log10(abs($num))) - $sig;
        ($num / 10 ** $power).round * 10 ** $power;
    }

    method value-r   {
        if $round-val && $.value < $round-val {
            # use floating point notation with mantissa of rounded significant digits for small Rats
            return( $.value.&round-sig )
        } elsif $round-val && $round-sig && $.value > 1 / $round-val {
            # use floating point notation with mantissa of rounded significant digits for big Rats
            return( $.value.&round-sig )
        } else {
            return( $round-val ?? $.value.round($round-val) !! $.value )
        }
    }

    method Str {
        # use error significant digits to control rounding
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
		my $rebased = $.in($.units.canonical);
		"{$rebased.value-r} {$.units.canonical}"
	}
    method pretty    {
		my $rebased = $.in($.units.canonical);
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

    method multiply( Measure:D $r is copy ) {	    #eg. Distance * Distance => Area 0;
        my $l = self.rebase;
        $r .= rebase;

        my $value = $l.value * $r.value;
        my ( $type, $units ) = $l.units.multiply( $r.units );

        my ( $error, $round ) = $l.add-error-rel( $r, $value );
        $error .= round($round) if $round && $round != 0;

        $type = 'Synthetic' if $type ~~ /synthetic/;
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

        $type = 'Synthetic' if $type ~~ /synthetic/;
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
        my $r = self.rebase;    #ok

        my $value = 1 / $r.value;

        my $numerator = Unit.new: defn => 'unity';

        my ( $type, $units ) = $numerator.divide( $r.units );

        my $round = $r.error.denorm[1] with $r.error;
        my $error = ( $r.error.relative * $value ).round($round) with $r.error;

        $type = 'Synthetic' if $type ~~ /synthetic/;
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

        $type = 'Synthetic' if $type ~~ /synthetic/;
        ::($type).new( :$value, :$units, :$error );
    }
    method sqrt() {
        return self.root( 2 )
    }

    #### Convert & Compare ####

    #| convert units and adjust value
    method in( ::O: $to ) {
		my $ouo = $.units;					        #old unit object
		my $nuo = Unit.find( $to );			        #new unit object

        my $o-type = $ouo.type;
		my $n-type = $nuo.type;

        $o-type = 'Synthetic' if $o-type ~~ /synthetic/;
        $n-type = 'Synthetic' if $n-type ~~ /synthetic/;

        #allow new type to match old eg. Width ~~ Length if synonym
        if not ::($o-type) ~~ ::($n-type) {
            die "cannot convert in to different type $n-type"
        }

        #require exact match if Synthetic
        if $o-type eq 'Synthetic' && $n-type eq 'Synthetic' {
            if not $o-type eq $n-type {
                die "cannot convert in to different Synthetic type $n-type"
            }
        }

		my $value = ($.value + $ouo.offset) * ($ouo.factor / $nuo.factor) - $nuo.offset;
        my $error = self.error.absolute * ($ouo.factor / $nuo.factor) with self.error;

		::($n-type).new( :$value, units => $nuo, :$error )
	}

    # fixme eject / ignore things unless they have SI prefix
    # maybe does this already

    #| adjust prefix to optimize value significance
    #| eg 1000000000m => 1Gm
	method norm {
        my %postfix-to-defn := Unit.postfix-to-defn;

		#try to match via unit defn eg. petahertz
		my $defn := self.units.defn;
		my $postfix-from-defn = %postfix-to-defn.values.grep(/^ $defn $/).first;

		#try to match via unit name eg. Hz
        my $name := self.units.name;
        my $postfix-from-name = %postfix-to-defn.keys.grep(/^ $name $/ ).first;

		#setup some hashes and arrays
        my %prefix-to-factor = Unit.prefix-to-factor;

        my %factor-to-prefix = %prefix-to-factor.kv.reverse;
           %factor-to-prefix{'1'} = '';                    # eg petahertz => peta & hertz#plug gap in factors for vanilla base units

        my @prefixs = %prefix-to-factor.keys;


		#gather initial prefix factor and base unit
		my ( FatRat() $factor, Str $base );

		with $postfix-from-defn {

            # eg petahertz => peta & hertz
			$postfix-from-defn ~~ m|(<@prefixs>)(.*)|;

            # remember to handle no prefix case...
			$factor = $0.so ?? %prefix-to-factor{$0} !! 1;
			$base   = $1.so ?? ~$1 !! $postfix-from-defn;

		} orwith $postfix-from-name {

            $base = %postfix-to-defn{$_};

            if $base eq 'kilogram' {    #special case kg
                $base = 'gram';
                $factor = 1000;
            } else {
                $factor = 1;
            }

		} else {
			warn "Cannot normalize this Unit type (linear SI units and prefixes only), maybe you need to .rebase first";
			return self;
		}

        # finally, do the left or right shift
		my $res = self;

		# either shift-right
		while $res.value.abs >= 1000 {
            last if $factor >= 1e30;
			$factor *= 1000;
			$res = $res.in: qq|{%factor-to-prefix{$factor}}$base|;
		}

		# or shift-left
		while $res.value.abs <= 0.1 {
            last if $factor <= 1e-30;
			$factor /= 1000;
			$res = $res.in: qq|{%factor-to-prefix{$factor}}$base|;
		}

		return $res;
	}

    #| convert into base unit for type
    method rebase {
        return self if self.units.type ~~ /synthetic/;

        return self if self.units.same-unit: self.units.type-to-unit;

        self.in( self.units.type-to-unit );
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

# FIXME - defile for localization override?

class Synthetic          is Measure is export {}

#SI Base Units
class Length             is Measure is export {}
class Mass               is Measure is export {}
class Current            is Measure is export {}
class Temperature        is Measure is export {}
class Substance          is Measure is export {}
class Luminosity         is Measure is export {}

#Derived Units
class Dimensionless      is Measure is export {}
class Currency           is Measure is export {}
class Data               is Measure is export {}
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
class Flow               is Measure is export {}
class SpecificEnergy     is Measure is export {}
class SpecificPower      is Measure is export {}
class SpecificHeat       is Measure is export {}
class Irradiance         is Measure is export {}
class Insolation         is Measure is export {}
class SpectralFluxDensity is Measure is export {}
class ThermalResistance  is Measure is export {}
class ThermalConductance is Measure is export {}

#Synonyms for Length...
class Distance           is Length is export {}
class Breadth            is Length is export {}
class Width              is Length is export {}
class Height             is Length is export {}
class Depth              is Length is export {}

######## Functional Operator Overrides ########

multi prefix:<♎️>    ( Str:D $new )      is export { Measure.new: $new }
multi prefix:<♎️>    ( List:D $new )     is export { Measure.new: $new.join(' ') }  #for ♎️<3 mph>
multi prefix:<♎️>    ( Duration:D $new ) is export { Measure.new: $new }

multi prefix:<libra> ( Str:D $new )      is export { Measure.new: $new }
multi prefix:<libra> ( List:D $new )     is export { Measure.new: $new.join(' ') }
multi prefix:<libra️> ( Duration:D $new ) is export { Measure.new: $new }

multi prefix:<^>     ( Str:D $new )      is export { Measure.new: $new }
multi prefix:<^>     ( List:D $new )     is export { Measure.new: $new.join(' ') }  #for ^<3 mph>
multi prefix:<^>     ( Duration:D $new ) is export { Measure.new: $new }

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

multi infix:<×> ( Measure:D $left, Real:D $right ) is export {
    my $result   = $left.clone;
    my $argument = $right;
    return $result.multiply-const( $argument );
}
multi infix:<×> ( Real:D $left, Measure:D $right ) is export {
    my $result   = $right.clone;
    my $argument = $left;
    return $result.multiply-const( $argument );
}
multi infix:<×> ( Measure:D $left, Measure:D $right ) is export {
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

multi infix:<÷> ( Measure:D $left, Real:D $right ) is equiv( &infix:</> ) is export {
    my $result   = $left.clone;
    my $argument = $right;
    return $result.divide-by-const( $argument );
}
multi infix:<÷> ( Real:D $left, Measure:D $right ) is equiv( &infix:</> ) is export {
    my $result   = $right.clone;
    my $argument = $left;
    my $recip = $result.reciprocal;
    return $recip.multiply-const( $argument );
}
multi infix:<÷> ( Measure:D $left, Measure:D $right ) is export {
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


##### Postfix Operators #####

#`[
Postfix Operators combine the notions of:
1. SI Prefixes e.g. c(centi-), k(kilo-) that make compound units such as cm, km, kg
2. Binary Prefixes e.g. Ki(kibi), Mi(mebi) that make compound units such as Kib, MiB
3. Custom Raku postfix operators e.g. $l = 42cm; operators which work on the preceding value

This code does:
1. Construction and export of the cross product of SI Prefixes (24) with ( SI Base (7) + Derived (21) ) Units (as ~672 postfix operators)
2. Construction and export of the cross product of Binary Prefixes with Binary (2) Units
3. Export of Currency (some prefix, some postfix)
4. Export of some awkward ones explicitly

Now you can simply go 'my $l = 1km;' to construct a new Measure object with value => 1 and units => 'km'
#]

sub do-postfix( Real $v, Str $n ) is export {
    my $u = Unit.new( defn => $n, names => Unit.postfix-to-syns{$n} );
    my $t = $u.type;
    return ::($t).new(value => $v, units => $u);
}

#eg. sub postfix:<m> ( Real:D $x ) is export { do-postfix( $x, 'm' ) }

#| first a few "non-declining singletons"...
sub postfix:<°>         (Real:D $x) is export { do-postfix($x,'°') }
sub postfix:<º>         (Real:D $x) is export { do-postfix($x,'º') }
sub postfix:<°C>        (Real:D $x) is export { do-postfix($x,'°C') }
sub postfix:<ºC>        (Real:D $x) is export { do-postfix($x,'ºC') }
sub postfix:<rad>       (Real:D $x) is export { do-postfix($x,'radian') }
sub postfix:<radian>    (Real:D $x) is export { do-postfix($x,'radian') }
sub postfix:<steradian> (Real:D $x) is export { do-postfix($x,'steradian') }

#| and the top currencies
#| Foreign exchange trading volume—According to a March 2025 breakdown,
#| the most traded currencies are: USD, EUR, JPY, GBP, AUD, CAD, CHF, and CNY
sub prefix:<US$>        (Real:D $x) is export { do-postfix($x,'USD') }
sub prefix:<€>          (Real:D $x) is export { do-postfix($x,'EUR') }  #\ both
sub postfix:<€>         (Real:D $x) is export { do-postfix($x,'EUR') }  #/
sub prefix:<¥>          (Real:D $x) is export { do-postfix($x,'JPY') }
sub prefix:<£>          (Real:D $x) is export { do-postfix($x,'GBP') }
sub prefix:<A$>         (Real:D $x) is export { do-postfix($x,'AUD') }
sub prefix:<C$>         (Real:D $x) is export { do-postfix($x,'CAD') }
sub postfix:<SFr>       (Real:D $x) is export { do-postfix($x,'CHF') }
sub prefix:<CN¥>        (Real:D $x) is export { do-postfix($x,'CNY') }

#| then put in all the prefix-symbol combinations programmatically
#| viz. https://docs.raku.org/language/modules#Exporting_and_selective_importing
my package EXPORT::ALL {
    # regular SI prefixes
	for Unit.postfix-to-defn.keys -> $u {
        OUR::{'&postfix:<' ~ $u ~ '>'} := sub (Real:D $x) { do-postfix($x,"$u") };
	}

    # binary prefixes
    for Unit.binary-to-defn.keys -> $u {
        OUR::{'&postfix:<' ~ $u ~ '>'} := sub (Real:D $x) { do-postfix($x,"$u") };
    }
}


##### Percent (%) & Error (±,~) Operators #####

sub postfix:<%> ( Real:D $x ) is export { do-postfix($x,'percent') }

multi infix:<±> ( Measure:D $m, Real:D $error --> Measure ) is export {
    $m.error = Error.new( :$error, value => $m.value );
    $m.error.bind-mea-value: $m.value;
    return $m
}

#Stringify percent to avoid circular dependency
multi infix:<±> ( Measure:D $m, Str:D() $error --> Measure ) is export {
    $m.error = Error.new( :$error, value => $m.value );
    $m.error.bind-mea-value: $m.value;
    return $m
}

# iOS and Windoze lack a ± key, so alias ~ for error
multi infix:<~> ( Measure:D $m, Real:D $error --> Measure ) is export {
    $m.error = Error.new( :$error, value => $m.value );
    $m.error.bind-mea-value: $m.value;
    return $m
}

#Stringify percent to avoid circular dependency
multi infix:<~> ( Measure:D $m, Str:D() $error --> Measure ) is export {
    $m.error = Error.new( :$error, value => $m.value );
    $m.error.bind-mea-value: $m.value;
    return $m
}

#EOF
