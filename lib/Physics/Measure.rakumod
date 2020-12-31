unit module Physics::Measure:ver<1.0.0>:auth<Steve Roe (p6steve@furnival.net)>;
use Physics::Unit;

#This module uses Type Variables such as ::T,::($s) 
#viz. http://www.jnthn.net/papers/2008-yapc-eu-raku6types.pdf

#Length = 12.5 ±0.05 m   (FIXME v2 cover errors)
#viz. https://www.mathsisfun.com/measure/error-measurement.html

##### Passthrough of Physics::Unit #####

#| design intent is for Measure (.new) to encapsulate Physics::Unit
#| objective is to eliminate 'use lozenges' and to shorten 'use list'
#| deprecated - this pass through function is transition support

sub GetMeaUnit( $u ) is export {
	GetUnit( $u )
}

##### Postfix Unit Support #####

sub do-postfix( Real $v, Str $n ) is export {
	my $codes = GetPrefixByCode.keys.join('|');

	$n ~~ m|(<$codes>) (.*)|;
	my $pfix = GetPrefixByCode{$0};
	my $unit = $1;

    my $u = Unit.new( defn => "$pfix$unit", names => "$n" );
    my $t = $u.type( :just1 );
    return ::($t).new(value => $v, units => $u);
} 


######## Constants & Definitions ########

my $db = 0;					#debug

our $round-to;				#optional round for output methods.. Str etc.

constant \isa-length = 'Distance' | 'Breadth' | 'Width' | 'Height' | 'Depth'; 

my regex number is export {
	\S+                     #grab chars
	<?{ +"$/" ~~ Real }>    #assert coerces via '+' to Real
}


########## Classes & Methods ##########

class Dimensionless { ... }

class Measure is export {
    #Parent class for physical quantities with value, units & error(tbd)
    #Builds child classes such as Distance, Mass, Power, etc. 

    has	Real $.value is rw;
    has Unit $.units is rw;

	#### Constructors ####
    multi method new( :$value, :$units ) {			say "new from attrs" if $db;
        self.bless( value => $value, units => GetUnit($units) )
    }
    multi method new( Str:D $s ) {					say "new from Str" if $db;
        my ($v, $u) = Measure.defn-extract( $s );
        my $nuo = GetUnit( $u );
		my $n-type = $nuo.type( just1 => 1 ) || 'Measure';
        ::($n-type).new( value => $v, units => $nuo )
    }
    multi method new( ::T: Real:D $r ) {			say "new from Real" if $db;
		my $s = ~T.^name;
		$s ~~ s/'Physics::Measure::'//;
		$s = 'Length' if $s ~~ isa-length;
		my $u = GetPrototype($s);
        self.bless( value => $r, units => $u )
    }
    multi method new( Duration:D $d ) {				say "new from Duration" if $db;
        self.bless( value => $d.Real, units => GetUnit('s') )
    }
    multi method new( Measure:D $m ) {				say "new from Measure" if $db;
        self.bless( value => $m.value, units => $m.units )
    }
    method clone( ::T: ) {							say "cloning " ~ T.^name if $db;
        T.new: self
    }  

	#### Assignment ####
    multi method assign( Str:D $r ) {				say "assign from Str" if $db;
        my ($v, $u) = Measure.defn-extract( $r );  
		$.value = $v;
		$.units = GetUnit($u);
    }   
    multi method assign( Real:D $r ) {				say "assign from Real" if $db;
        $.value = $r;
    }
    multi method assign( Duration:D $r ) {			say "assign from Duration" if $db;
        $.value = $r.Real;
		$.units = GetUnit('s');
    }
    multi method assign( Measure:D $r ) {			say "assign from Measure" if $db;
        $.value = $r.value;
        $.units = $r.units;
    }

	#### Output ####
    method Real      { $.value }
    method Numeric   { $.value }
	method value-r   { $round-to ?? $.value.round($round-to) !! $.value }
    method Str       { "{$.value-r} {$.units}" }
    method canonical { 
		my $rebased = $.in( $.units.canonical);
		"{$rebased.value-r} {$.units.canonical}" 
	}
    method pretty    { 
		my $rebased = $.in( $.units.canonical);
		"{$rebased.value-r} {$.units.pretty}" 
	}

	#### Class Method ####
	#baby Grammar for initial extraction of definition from Str (value/unit/error)
	method defn-extract( Measure:U: Str:D $s ) {
		#handle degrees-minutes-seconds
		#<°> is U+00B0 <′> is U+2032 <″> is U+2033
		if $s ~~ /(\d*)\°(\d*)\′(\d*)\″?/ {			
			my $deg where 0 <= * < 360 = $0 % 360;
			my $min where 0 <= * <  60 = $1 // 0;
			my $sec where 0 <= * <  60 = $2 // 0;
			my $v = ( ($deg * 3600) + ($min * 60) + $sec ) / 3600;

			say "extracting «$s»: v is $deg°$min′$sec″, u is degrees" if $db;
			return($v, 'degrees')
		}
		#put hh:mm:ss in here ;-)
		#handle generic case
		else {
			$s ~~ /^ ( <number> ) \s* ( <-[±]>* ) $/;  
			my $v = +$0;
			my $u = ~$1;

			say "extracting «$s»: v is «$v», u is «$u»" if $db;
			return($v, $u)
		}
	}

	#### Maths Operations ####
	sub make-same( $l, $r ) {
        if ! $l.units.type eq $r.units.type {
            die "Cannot combine Measures of different Types!"
        }
        if ! $l.units.same-unit( $r.units ) {
			say "Converting right hand Measure to combine!" if $db;
			return $r.in( $l.units )
		}
		return $r
	}

    method add( $r is rw ) {
		my $l = self;
		$r = make-same( $l, $r );
		$l.value += $r.value;
		return $l
    }
    method subtract( $r is rw ) {
		my $l = self;
		$r = make-same( $l, $r );
		$l.value -= $r.value; 
		return $l
    }   
    method negate {
        $.value *= -1;
        return self
    } 

    method multiply( Measure:D $right ) {			#eg. Distance * Distance => Area
        my $l = self.rebase;
		my $r = $right.rebase;

        my $nuo = $l.units.multiply( $r.units );
		my $nmo = ::($nuo.type).new( value => $l.value, units => $nuo );
        $nmo.value *= $r.value;
        return $nmo
    }   
    method multiply-const(Real:D $r) {
        $.value *= $r; 
        return self
    }   
    method divide( Measure:D $right ) {				#eg. Distance / Time => Speed
        my $l = self.rebase;
		my $r = $right.rebase;

        if $l.units.same-unit( $r.units ) {			#eg. Distance / Distance => Real
			return $l.value /= $r.value;
		}

        my $nuo = $l.units.divide( $r.units );
		my $nmo = ::($nuo.type).new( value => $l.value, units => $nuo );
        $nmo.value /= $r.value;
        return $nmo
    }   
    method divide-const( Real:D $right ) {
        $.value /= $right; 
        return self
    }
    method reciprocal {								#eg. 1 / Time => Frequency
		my $nuo = GetUnit( 'unity' );
        my Dimensionless $nmo .= new( value => 1, units => $nuo );
        return $nmo.divide( self )
    } 
    method power( Real:D $n ) {						#eg. Area ** 2 => Distance
        my $result = self;
        my $factor = self;
        for 2..$n {
            $result .= multiply( $factor ); 
        }
        return $result
    } 
    method root( Int:D $n where 1 <= $n <= 4 ) {
		my $l = self.rebase;
        my $nuo = $.units.root-extract( $n );
		my $nmo = ::($nuo.type).new( value => $l.value, units => $nuo );
        $nmo.value = $l.value ** ( 1 / $n );
        return $nmo
    }
    method sqrt() {
        return self.root( 2 )
    }

    #### Convert & Compare ####
    method in( $to ) {					#convert units and adjust value
		my $ouo = $.units;				#aka old unit object
		my $nuo = GetUnit( $to );		#aka new unit object
		my $n-type = $nuo.type( just1 => 1 );

		unless self ~~ ::($n-type) { die "cannot convert in to different type $n-type" }

		my $n-value = ($.value + $ouo.offset) * ($ouo.factor / $nuo.factor) - $nuo.offset;

		::($n-type).new( value => $n-value, units => $nuo )
	}
	method rebase {						#to base (prototype) unit of type
		self.in( GetPrototype( self.units.type ))
	}
    method cmp( $a: $b ) {
		my ($an,$bn);
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
		return $an.value cmp $bn.value
    }
}

######## Special Measures ########

class Time is Measure is export {
    #FIXME v2 compound Time e.g. hh:mm:ss 
    #Duration ops <+> <-> <mod>

    multi method Duration {				#ie. $d = $t.Duration
		my $nmo = self.in('s');
        return Duration.new( $nmo.value );
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
			$sec = $round-to ?? $sec.round($round-to) !! $sec;
			qq{$deg°$min′$sec″}
		} else {
			nextsame
		}
	}
}

#| Override sin/cos/tan for Unit type Angle
#| Automatically convert argument to radians
multi sin( Angle:D $a ) is export {
    sin( $a.in('radian').value );
}
multi cos( Angle:D $a ) is export {
    cos( $a.in('radian').value );
}
multi tan( Angle:D $a ) is export {
    tan( $a.in('radian').value );
}

#| Override asin/acos/atan accept unitsof arg and return Angle object
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
class Solid-Angle        is Measure is export {}
class Frequency          is Measure is export {}
class Area               is Measure is export {}
class Volume             is Measure is export {}
class Speed              is Measure is export {}
class Angular-Speed      is Measure is export {}
class Acceleration       is Measure is export {}
class Moment-of-Inertia  is Measure is export {}
class Momentum           is Measure is export {}
class Angular-Momentum   is Measure is export {}
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
class Magnetic-Flux      is Measure is export {}
class Magnetic-Field     is Measure is export {}
class Luminous-Flux		 is Measure is export {}
class Illuminance		 is Measure is export {}
class Radioactivity		 is Measure is export {}
class Dose               is Measure is export {}
class Catalytic-Activity is Measure is export {}

#Synonyms for Length... 
class Distance           is Length is export {}
class Breadth            is Length is export {}
class Width              is Length is export {}
class Height             is Length is export {}
class Depth              is Length is export {}

######## Functional Operator Overrides ########

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
sub do-decl( $left is rw, $right ) {
    #declaration with default
    if $left ~~ Measure {
        $left .=new( $right );
    } else {
        $left = Measure.new( $right );
    }
}

#declaration with default
multi infix:<♎️> ( Any:U $left is rw, Measure:D $right ) is equiv( &infix:<=> ) is export {
    do-decl( $left, $right );
}
multi infix:<♎️> ( Any:U $left is rw, Str:D $right ) is equiv( &infix:<=> ) is export {
    do-decl( $left, $right );
}
multi infix:<♎️> ( Measure:U $left is rw, Real:D $right ) is equiv( &infix:<=> ) is export {
    do-decl( $left, $right );
}
multi infix:<♎️> ( Any:U $left is rw, Duration:D $right ) is equiv( &infix:<=> ) is export {
    do-decl( $left, $right );
}
#texas
multi infix:<libra> ( Any:U $left is rw, Measure:D $right ) is equiv( &infix:<=> ) is export {
    do-decl( $left, $right );
}
multi infix:<libra> ( Any:U $left is rw, Str:D $right ) is equiv( &infix:<=> ) is export {
    do-decl( $left, $right );
}
multi infix:<libra> ( Measure:U $left is rw, Real:D $right ) is equiv( &infix:<=> ) is export {
    do-decl( $left, $right );
}
multi infix:<libra> ( Any:U $left is rw, Duration:D $right ) is equiv( &infix:<=> ) is export {
    do-decl( $left, $right );
}

#assignment
multi infix:<♎️> ( Measure:D $left, Measure:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}
multi infix:<♎️> ( Measure:D $left, Str:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}
multi infix:<♎️> ( Measure:D $left, Real:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}
multi infix:<♎️> ( Measure:D $left, Duration:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}
multi infix:<libra> ( Measure:D $left, Measure:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}
multi infix:<libra> ( Measure:D $left, Str:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}
multi infix:<libra> ( Measure:D $left, Real:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}
multi infix:<libra> ( Measure:D $left, Duration:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}

#math
multi prefix:<-> ( Measure:D $right) is export {
    my $result = $right.clone;
    return $result.negate;
}
multi infix:<+> ( Measure:D $left, Measure:D $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.add( $argument );
}
multi infix:<+> ( Measure:D $left, $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.add( $argument );
}
multi infix:<+> ( $left, Measure:D $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.add( $argument );
}
multi infix:<-> ( Measure:D $left, Measure:D $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.subtract( $argument );
}
multi infix:<-> ( Measure:D $left, $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.subtract( $argument );
}
multi infix:<-> ( $left, Measure:D $right ) is export {
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
multi infix:<*> ( Measure:D $left, $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.multiply( $argument );
}
multi infix:<*> ( $left, Measure:D $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.multiply( $argument );
}

multi infix:</> ( Measure:D $left, Real:D $right ) is equiv( &infix:</> ) is export {
    my $result   = $left.clone;
    my $argument = $right;
    return $result.divide-const( $argument );
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
multi infix:</> ( Measure:D $left, $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.divide( $argument );
}
multi infix:</> ( $left, Measure:D $right ) is export {
    my ( $result, $argument ) = infix-prep( $left, $right );
    return $result.divide( $argument );
}

multi infix:<**> ( Measure:D $left, Real:D $right where 2..4 ) is equiv( &infix:<**> ) is export {
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

#EOF
