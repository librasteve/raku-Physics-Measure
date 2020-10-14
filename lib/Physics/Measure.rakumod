unit module Physics::Measure:ver<0.0.3>:auth<Steve Roe (p6steve@furnival.net)>;
use Physics::Unit;

my $db = 0;					#debug

#This module uses Type Variables such as ::T,::($s) 
#viz. http://www.jnthn.net/papers/2008-yapc-eu-raku6types.pdf

#Length = 12.5 ±0.05 m   (FIXME v2 cover errors)
#viz. https://www.mathsisfun.com/measure/error-measurement.html

constant \isa-length = 'Distance' | 'Breadth' | 'Width' | 'Height' | 'Depth'; 

our $round-to is export;	#optional global rounding for Str etc.

my regex number {
	\S+                     #grab chars
	<?{ defined +"$/" }>    #assert coerces via '+' to Real
}

class Dimensionless { ... }

class Measure is export {
    #Parent class for physical quantities with value, units & error(tbd)
    #Builds child classes such as Distance, Mass, Power, etc. 

    has	Real $.value is rw;
    has Unit $.units is rw;

    multi method new( :$value, :$units ) {			say "new from attrs" if $db;
        self.bless( value => $value, units => GetUnit( $units) )
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

    method Real      { $.value }
    method Numeric   { $.value }
	method value-r   { $round-to ?? $.value.round($round-to) !! $.value }
    method Str       { "{$.value-r} {$.units}" }
    method canonical { "{$.value-r} {$.units.canonical}" }
    method pretty    { "{$.value-r} {$.units.pretty}" }

	#class method baby Grammar for initial extraction of definition from Str (value/unit/error)
	method defn-extract( Measure:U: Str:D $s ) {
		#handle degrees-minutes-seconds
		#<°> is U+00B0 <′> is U+2032 <″> is U+2033
		if $s ~~ /(\d*)\°(\d*)\′(\d*)\″?/ {			
			my $deg where 0 <= * < 360 = $0 % 360;
			my $min where 0 <= * <  60 = $1 // 0;
			my $sec where 0 <= * <  60 = $2 // 0;
			my $v = ( ($deg * 3600) + ($min * 60) + $sec ) / 3600;

			say "extracting «$s»: v is $deg°$min′$sec″, u is degrees";# if $db;
			return($v, 'degrees')
		}
		#put hh:mm:ss in here ;-)
		#handle generic case
		else {
			$s ~~ /^ ( <number> ) \s* ( <-[±]>* ) $/;  
			my $v = +"$0".Real if $0.defined;
			my $u =  "$1".Str  if $1.defined;

			say "extracting «$s»: v is «$v», u is «$u»" if $db;
			return($v, $u)
		}
	}

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

    #### convert & compare methods ####
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
		my $deg = $.value.floor; 
		my $rem = ( $.value - $deg ) * 60; 
		my $min = $rem.floor;
		my $sec = ( $rem - $min ) * 60; 

		if %h<no-secs>:exists {
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

#`[[
    method value() {
		##FIXME debug and generalize to Rad...
        Proxy.new:
            FETCH => -> $ { $!value },
            STORE => -> $, $x {
                $!value = $x % 360;
            }
    }   
#]]
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
class Dose               is Measure is export {}
#Synonyms for Length... 
class Distance           is Length is export {}
class Breadth            is Length is export {}
class Width              is Length is export {}
class Height             is Length is export {}
class Depth              is Length is export {}

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

sub do-postfix( Real $v, Str $n ) is export {
    my $nuo = GetUnit( $n );
    my $n-type = $nuo.type( just1 => 1 );
    ::($n-type).new( value => $v, units => $nuo )
} 
##e.g. => sub postfix:<m> ( Real:D $x ) is export { do-postfix( $x, 'm' ) } 

##First a few "non-declining singletons"...
sub postfix:<°> (Real:D $x) is export { do-postfix($x,'°') }
sub postfix:<radian> (Real:D $x) is export { do-postfix($x,'radian') }
sub postfix:<steradian> (Real:D $x) is export { do-postfix($x,'steradian') }
sub postfix:<°C> (Real:D $x) is export { do-postfix($x,'°C') }

#approx. 600 shorty units == ~600 more lines...
sub postfix:<hm> (Real:D $x) is export { do-postfix($x,'hm') }
sub postfix:<km> (Real:D $x) is export { do-postfix($x,'km') }
sub postfix:<Mm> (Real:D $x) is export { do-postfix($x,'Mm') }
sub postfix:<Gm> (Real:D $x) is export { do-postfix($x,'Gm') }
sub postfix:<Tm> (Real:D $x) is export { do-postfix($x,'Tm') }
sub postfix:<Pm> (Real:D $x) is export { do-postfix($x,'Pm') }
sub postfix:<Em> (Real:D $x) is export { do-postfix($x,'Em') }
sub postfix:<Zm> (Real:D $x) is export { do-postfix($x,'Zm') }
sub postfix:<Ym> (Real:D $x) is export { do-postfix($x,'Ym') }
sub postfix:<dm> (Real:D $x) is export { do-postfix($x,'dm') }
sub postfix:<cm> (Real:D $x) is export { do-postfix($x,'cm') }
sub postfix:<mm> (Real:D $x) is export { do-postfix($x,'mm') }
sub postfix:<μm> (Real:D $x) is export { do-postfix($x,'μm') }
sub postfix:<nm> (Real:D $x) is export { do-postfix($x,'nm') }
sub postfix:<pm> (Real:D $x) is export { do-postfix($x,'pm') }
sub postfix:<fm> (Real:D $x) is export { do-postfix($x,'fm') }
sub postfix:<am> (Real:D $x) is export { do-postfix($x,'am') }
sub postfix:<zm> (Real:D $x) is export { do-postfix($x,'zm') }
sub postfix:<ym> (Real:D $x) is export { do-postfix($x,'ym') }
sub postfix:<g> (Real:D $x) is export { do-postfix($x,'g') }
sub postfix:<dag> (Real:D $x) is export { do-postfix($x,'dag') }
sub postfix:<hg> (Real:D $x) is export { do-postfix($x,'hg') }
sub postfix:<kg> (Real:D $x) is export { do-postfix($x,'kg') }
sub postfix:<Mg> (Real:D $x) is export { do-postfix($x,'Mg') }
sub postfix:<Gg> (Real:D $x) is export { do-postfix($x,'Gg') }
sub postfix:<Tg> (Real:D $x) is export { do-postfix($x,'Tg') }
sub postfix:<Pg> (Real:D $x) is export { do-postfix($x,'Pg') }
sub postfix:<Eg> (Real:D $x) is export { do-postfix($x,'Eg') }
sub postfix:<Zg> (Real:D $x) is export { do-postfix($x,'Zg') }
sub postfix:<Yg> (Real:D $x) is export { do-postfix($x,'Yg') }
sub postfix:<dg> (Real:D $x) is export { do-postfix($x,'dg') }
sub postfix:<cg> (Real:D $x) is export { do-postfix($x,'cg') }
sub postfix:<mg> (Real:D $x) is export { do-postfix($x,'mg') }
sub postfix:<μg> (Real:D $x) is export { do-postfix($x,'μg') }
sub postfix:<ng> (Real:D $x) is export { do-postfix($x,'ng') }
sub postfix:<pg> (Real:D $x) is export { do-postfix($x,'pg') }
sub postfix:<fg> (Real:D $x) is export { do-postfix($x,'fg') }
sub postfix:<ag> (Real:D $x) is export { do-postfix($x,'ag') }
sub postfix:<zg> (Real:D $x) is export { do-postfix($x,'zg') }
sub postfix:<yg> (Real:D $x) is export { do-postfix($x,'yg') }
sub postfix:<s> (Real:D $x) is export { do-postfix($x,'s') }
sub postfix:<das> (Real:D $x) is export { do-postfix($x,'das') }
sub postfix:<hs> (Real:D $x) is export { do-postfix($x,'hs') }
sub postfix:<ks> (Real:D $x) is export { do-postfix($x,'ks') }
sub postfix:<Ms> (Real:D $x) is export { do-postfix($x,'Ms') }
sub postfix:<Gs> (Real:D $x) is export { do-postfix($x,'Gs') }
sub postfix:<Ts> (Real:D $x) is export { do-postfix($x,'Ts') }
sub postfix:<Ps> (Real:D $x) is export { do-postfix($x,'Ps') }
sub postfix:<Es> (Real:D $x) is export { do-postfix($x,'Es') }
sub postfix:<Zs> (Real:D $x) is export { do-postfix($x,'Zs') }
sub postfix:<Ys> (Real:D $x) is export { do-postfix($x,'Ys') }
sub postfix:<ds> (Real:D $x) is export { do-postfix($x,'ds') }
sub postfix:<cs> (Real:D $x) is export { do-postfix($x,'cs') }
sub postfix:<ms> (Real:D $x) is export { do-postfix($x,'ms') }
sub postfix:<μs> (Real:D $x) is export { do-postfix($x,'μs') }
sub postfix:<ns> (Real:D $x) is export { do-postfix($x,'ns') }
sub postfix:<ps> (Real:D $x) is export { do-postfix($x,'ps') }
sub postfix:<fs> (Real:D $x) is export { do-postfix($x,'fs') }
sub postfix:<as> (Real:D $x) is export { do-postfix($x,'as') }
sub postfix:<zs> (Real:D $x) is export { do-postfix($x,'zs') }
sub postfix:<ys> (Real:D $x) is export { do-postfix($x,'ys') }
sub postfix:<l> (Real:D $x) is export { do-postfix($x,'l') }
sub postfix:<dal> (Real:D $x) is export { do-postfix($x,'dal') }
sub postfix:<hl> (Real:D $x) is export { do-postfix($x,'hl') }
sub postfix:<kl> (Real:D $x) is export { do-postfix($x,'kl') }
sub postfix:<Ml> (Real:D $x) is export { do-postfix($x,'Ml') }
sub postfix:<Gl> (Real:D $x) is export { do-postfix($x,'Gl') }
sub postfix:<Tl> (Real:D $x) is export { do-postfix($x,'Tl') }
sub postfix:<Pl> (Real:D $x) is export { do-postfix($x,'Pl') }
sub postfix:<El> (Real:D $x) is export { do-postfix($x,'El') }
sub postfix:<Zl> (Real:D $x) is export { do-postfix($x,'Zl') }
sub postfix:<Yl> (Real:D $x) is export { do-postfix($x,'Yl') }
sub postfix:<dl> (Real:D $x) is export { do-postfix($x,'dl') }
sub postfix:<cl> (Real:D $x) is export { do-postfix($x,'cl') }
sub postfix:<ml> (Real:D $x) is export { do-postfix($x,'ml') }
sub postfix:<μl> (Real:D $x) is export { do-postfix($x,'μl') }
sub postfix:<nl> (Real:D $x) is export { do-postfix($x,'nl') }
sub postfix:<pl> (Real:D $x) is export { do-postfix($x,'pl') }
sub postfix:<fl> (Real:D $x) is export { do-postfix($x,'fl') }
sub postfix:<al> (Real:D $x) is export { do-postfix($x,'al') }
sub postfix:<zl> (Real:D $x) is export { do-postfix($x,'zl') }
sub postfix:<yl> (Real:D $x) is export { do-postfix($x,'yl') }

### Below commented out as first compile too slow > 7 mins
### If you can live with this feel free to uncomment here and 
### relevant items in UnitPostfix.rakumod
#`(( 
sub postfix:<A> (Real:D $x) is export { do-postfix($x,'A') }
sub postfix:<daA> (Real:D $x) is export { do-postfix($x,'daA') }
sub postfix:<hA> (Real:D $x) is export { do-postfix($x,'hA') }
sub postfix:<kA> (Real:D $x) is export { do-postfix($x,'kA') }
sub postfix:<MA> (Real:D $x) is export { do-postfix($x,'MA') }
sub postfix:<GA> (Real:D $x) is export { do-postfix($x,'GA') }
sub postfix:<TA> (Real:D $x) is export { do-postfix($x,'TA') }
sub postfix:<PA> (Real:D $x) is export { do-postfix($x,'PA') }
sub postfix:<EA> (Real:D $x) is export { do-postfix($x,'EA') }
sub postfix:<ZA> (Real:D $x) is export { do-postfix($x,'ZA') }
sub postfix:<YA> (Real:D $x) is export { do-postfix($x,'YA') }
sub postfix:<dA> (Real:D $x) is export { do-postfix($x,'dA') }
sub postfix:<cA> (Real:D $x) is export { do-postfix($x,'cA') }
sub postfix:<mA> (Real:D $x) is export { do-postfix($x,'mA') }
sub postfix:<μA> (Real:D $x) is export { do-postfix($x,'μA') }
sub postfix:<nA> (Real:D $x) is export { do-postfix($x,'nA') }
sub postfix:<pA> (Real:D $x) is export { do-postfix($x,'pA') }
sub postfix:<fA> (Real:D $x) is export { do-postfix($x,'fA') }
sub postfix:<aA> (Real:D $x) is export { do-postfix($x,'aA') }
sub postfix:<zA> (Real:D $x) is export { do-postfix($x,'zA') }
sub postfix:<yA> (Real:D $x) is export { do-postfix($x,'yA') }
sub postfix:<K> (Real:D $x) is export { do-postfix($x,'K') }
sub postfix:<daK> (Real:D $x) is export { do-postfix($x,'daK') }
sub postfix:<hK> (Real:D $x) is export { do-postfix($x,'hK') }
sub postfix:<kK> (Real:D $x) is export { do-postfix($x,'kK') }
sub postfix:<MK> (Real:D $x) is export { do-postfix($x,'MK') }
sub postfix:<GK> (Real:D $x) is export { do-postfix($x,'GK') }
sub postfix:<TK> (Real:D $x) is export { do-postfix($x,'TK') }
sub postfix:<PK> (Real:D $x) is export { do-postfix($x,'PK') }
sub postfix:<EK> (Real:D $x) is export { do-postfix($x,'EK') }
sub postfix:<ZK> (Real:D $x) is export { do-postfix($x,'ZK') }
sub postfix:<YK> (Real:D $x) is export { do-postfix($x,'YK') }
sub postfix:<dK> (Real:D $x) is export { do-postfix($x,'dK') }
sub postfix:<cK> (Real:D $x) is export { do-postfix($x,'cK') }
sub postfix:<mK> (Real:D $x) is export { do-postfix($x,'mK') }
sub postfix:<μK> (Real:D $x) is export { do-postfix($x,'μK') }
sub postfix:<nK> (Real:D $x) is export { do-postfix($x,'nK') }
sub postfix:<pK> (Real:D $x) is export { do-postfix($x,'pK') }
sub postfix:<fK> (Real:D $x) is export { do-postfix($x,'fK') }
sub postfix:<aK> (Real:D $x) is export { do-postfix($x,'aK') }
sub postfix:<zK> (Real:D $x) is export { do-postfix($x,'zK') }
sub postfix:<yK> (Real:D $x) is export { do-postfix($x,'yK') }
sub postfix:<mol> (Real:D $x) is export { do-postfix($x,'mol') }
sub postfix:<damol> (Real:D $x) is export { do-postfix($x,'damol') }
sub postfix:<hmol> (Real:D $x) is export { do-postfix($x,'hmol') }
sub postfix:<kmol> (Real:D $x) is export { do-postfix($x,'kmol') }
sub postfix:<Mmol> (Real:D $x) is export { do-postfix($x,'Mmol') }
sub postfix:<Gmol> (Real:D $x) is export { do-postfix($x,'Gmol') }
sub postfix:<Tmol> (Real:D $x) is export { do-postfix($x,'Tmol') }
sub postfix:<Pmol> (Real:D $x) is export { do-postfix($x,'Pmol') }
sub postfix:<Emol> (Real:D $x) is export { do-postfix($x,'Emol') }
sub postfix:<Zmol> (Real:D $x) is export { do-postfix($x,'Zmol') }
sub postfix:<Ymol> (Real:D $x) is export { do-postfix($x,'Ymol') }
sub postfix:<dmol> (Real:D $x) is export { do-postfix($x,'dmol') }
sub postfix:<cmol> (Real:D $x) is export { do-postfix($x,'cmol') }
sub postfix:<mmol> (Real:D $x) is export { do-postfix($x,'mmol') }
sub postfix:<μmol> (Real:D $x) is export { do-postfix($x,'μmol') }
sub postfix:<nmol> (Real:D $x) is export { do-postfix($x,'nmol') }
sub postfix:<pmol> (Real:D $x) is export { do-postfix($x,'pmol') }
sub postfix:<fmol> (Real:D $x) is export { do-postfix($x,'fmol') }
sub postfix:<amol> (Real:D $x) is export { do-postfix($x,'amol') }
sub postfix:<zmol> (Real:D $x) is export { do-postfix($x,'zmol') }
sub postfix:<ymol> (Real:D $x) is export { do-postfix($x,'ymol') }
sub postfix:<cd> (Real:D $x) is export { do-postfix($x,'cd') }
sub postfix:<dacd> (Real:D $x) is export { do-postfix($x,'dacd') }
sub postfix:<hcd> (Real:D $x) is export { do-postfix($x,'hcd') }
sub postfix:<kcd> (Real:D $x) is export { do-postfix($x,'kcd') }
sub postfix:<Mcd> (Real:D $x) is export { do-postfix($x,'Mcd') }
sub postfix:<Gcd> (Real:D $x) is export { do-postfix($x,'Gcd') }
sub postfix:<Tcd> (Real:D $x) is export { do-postfix($x,'Tcd') }
sub postfix:<Pcd> (Real:D $x) is export { do-postfix($x,'Pcd') }
sub postfix:<Ecd> (Real:D $x) is export { do-postfix($x,'Ecd') }
sub postfix:<Zcd> (Real:D $x) is export { do-postfix($x,'Zcd') }
sub postfix:<Ycd> (Real:D $x) is export { do-postfix($x,'Ycd') }
sub postfix:<dcd> (Real:D $x) is export { do-postfix($x,'dcd') }
sub postfix:<ccd> (Real:D $x) is export { do-postfix($x,'ccd') }
sub postfix:<mcd> (Real:D $x) is export { do-postfix($x,'mcd') }
sub postfix:<μcd> (Real:D $x) is export { do-postfix($x,'μcd') }
sub postfix:<ncd> (Real:D $x) is export { do-postfix($x,'ncd') }
sub postfix:<pcd> (Real:D $x) is export { do-postfix($x,'pcd') }
sub postfix:<fcd> (Real:D $x) is export { do-postfix($x,'fcd') }
sub postfix:<acd> (Real:D $x) is export { do-postfix($x,'acd') }
sub postfix:<zcd> (Real:D $x) is export { do-postfix($x,'zcd') }
sub postfix:<ycd> (Real:D $x) is export { do-postfix($x,'ycd') }
sub postfix:<Hz> (Real:D $x) is export { do-postfix($x,'Hz') }
sub postfix:<daHz> (Real:D $x) is export { do-postfix($x,'daHz') }
sub postfix:<hHz> (Real:D $x) is export { do-postfix($x,'hHz') }
sub postfix:<kHz> (Real:D $x) is export { do-postfix($x,'kHz') }
sub postfix:<MHz> (Real:D $x) is export { do-postfix($x,'MHz') }
sub postfix:<GHz> (Real:D $x) is export { do-postfix($x,'GHz') }
sub postfix:<THz> (Real:D $x) is export { do-postfix($x,'THz') }
sub postfix:<PHz> (Real:D $x) is export { do-postfix($x,'PHz') }
sub postfix:<EHz> (Real:D $x) is export { do-postfix($x,'EHz') }
sub postfix:<ZHz> (Real:D $x) is export { do-postfix($x,'ZHz') }
sub postfix:<YHz> (Real:D $x) is export { do-postfix($x,'YHz') }
sub postfix:<dHz> (Real:D $x) is export { do-postfix($x,'dHz') }
sub postfix:<cHz> (Real:D $x) is export { do-postfix($x,'cHz') }
sub postfix:<mHz> (Real:D $x) is export { do-postfix($x,'mHz') }
sub postfix:<μHz> (Real:D $x) is export { do-postfix($x,'μHz') }
sub postfix:<nHz> (Real:D $x) is export { do-postfix($x,'nHz') }
sub postfix:<pHz> (Real:D $x) is export { do-postfix($x,'pHz') }
sub postfix:<fHz> (Real:D $x) is export { do-postfix($x,'fHz') }
sub postfix:<aHz> (Real:D $x) is export { do-postfix($x,'aHz') }
sub postfix:<zHz> (Real:D $x) is export { do-postfix($x,'zHz') }
sub postfix:<yHz> (Real:D $x) is export { do-postfix($x,'yHz') }
sub postfix:<N> (Real:D $x) is export { do-postfix($x,'N') }
sub postfix:<daN> (Real:D $x) is export { do-postfix($x,'daN') }
sub postfix:<hN> (Real:D $x) is export { do-postfix($x,'hN') }
sub postfix:<kN> (Real:D $x) is export { do-postfix($x,'kN') }
sub postfix:<MN> (Real:D $x) is export { do-postfix($x,'MN') }
sub postfix:<GN> (Real:D $x) is export { do-postfix($x,'GN') }
sub postfix:<TN> (Real:D $x) is export { do-postfix($x,'TN') }
sub postfix:<PN> (Real:D $x) is export { do-postfix($x,'PN') }
sub postfix:<EN> (Real:D $x) is export { do-postfix($x,'EN') }
sub postfix:<ZN> (Real:D $x) is export { do-postfix($x,'ZN') }
sub postfix:<YN> (Real:D $x) is export { do-postfix($x,'YN') }
sub postfix:<dN> (Real:D $x) is export { do-postfix($x,'dN') }
sub postfix:<cN> (Real:D $x) is export { do-postfix($x,'cN') }
sub postfix:<mN> (Real:D $x) is export { do-postfix($x,'mN') }
sub postfix:<μN> (Real:D $x) is export { do-postfix($x,'μN') }
sub postfix:<nN> (Real:D $x) is export { do-postfix($x,'nN') }
sub postfix:<pN> (Real:D $x) is export { do-postfix($x,'pN') }
sub postfix:<fN> (Real:D $x) is export { do-postfix($x,'fN') }
sub postfix:<aN> (Real:D $x) is export { do-postfix($x,'aN') }
sub postfix:<zN> (Real:D $x) is export { do-postfix($x,'zN') }
sub postfix:<yN> (Real:D $x) is export { do-postfix($x,'yN') }
sub postfix:<Pa> (Real:D $x) is export { do-postfix($x,'Pa') }
sub postfix:<daPa> (Real:D $x) is export { do-postfix($x,'daPa') }
sub postfix:<hPa> (Real:D $x) is export { do-postfix($x,'hPa') }
sub postfix:<kPa> (Real:D $x) is export { do-postfix($x,'kPa') }
sub postfix:<MPa> (Real:D $x) is export { do-postfix($x,'MPa') }
sub postfix:<GPa> (Real:D $x) is export { do-postfix($x,'GPa') }
sub postfix:<TPa> (Real:D $x) is export { do-postfix($x,'TPa') }
sub postfix:<PPa> (Real:D $x) is export { do-postfix($x,'PPa') }
sub postfix:<EPa> (Real:D $x) is export { do-postfix($x,'EPa') }
sub postfix:<ZPa> (Real:D $x) is export { do-postfix($x,'ZPa') }
sub postfix:<YPa> (Real:D $x) is export { do-postfix($x,'YPa') }
sub postfix:<dPa> (Real:D $x) is export { do-postfix($x,'dPa') }
sub postfix:<cPa> (Real:D $x) is export { do-postfix($x,'cPa') }
sub postfix:<mPa> (Real:D $x) is export { do-postfix($x,'mPa') }
sub postfix:<μPa> (Real:D $x) is export { do-postfix($x,'μPa') }
sub postfix:<nPa> (Real:D $x) is export { do-postfix($x,'nPa') }
sub postfix:<pPa> (Real:D $x) is export { do-postfix($x,'pPa') }
sub postfix:<fPa> (Real:D $x) is export { do-postfix($x,'fPa') }
sub postfix:<aPa> (Real:D $x) is export { do-postfix($x,'aPa') }
sub postfix:<zPa> (Real:D $x) is export { do-postfix($x,'zPa') }
sub postfix:<yPa> (Real:D $x) is export { do-postfix($x,'yPa') }
sub postfix:<J> (Real:D $x) is export { do-postfix($x,'J') }
sub postfix:<daJ> (Real:D $x) is export { do-postfix($x,'daJ') }
sub postfix:<hJ> (Real:D $x) is export { do-postfix($x,'hJ') }
sub postfix:<kJ> (Real:D $x) is export { do-postfix($x,'kJ') }
sub postfix:<MJ> (Real:D $x) is export { do-postfix($x,'MJ') }
sub postfix:<GJ> (Real:D $x) is export { do-postfix($x,'GJ') }
sub postfix:<TJ> (Real:D $x) is export { do-postfix($x,'TJ') }
sub postfix:<PJ> (Real:D $x) is export { do-postfix($x,'PJ') }
sub postfix:<EJ> (Real:D $x) is export { do-postfix($x,'EJ') }
sub postfix:<ZJ> (Real:D $x) is export { do-postfix($x,'ZJ') }
sub postfix:<YJ> (Real:D $x) is export { do-postfix($x,'YJ') }
sub postfix:<dJ> (Real:D $x) is export { do-postfix($x,'dJ') }
sub postfix:<cJ> (Real:D $x) is export { do-postfix($x,'cJ') }
sub postfix:<mJ> (Real:D $x) is export { do-postfix($x,'mJ') }
sub postfix:<μJ> (Real:D $x) is export { do-postfix($x,'μJ') }
sub postfix:<nJ> (Real:D $x) is export { do-postfix($x,'nJ') }
sub postfix:<pJ> (Real:D $x) is export { do-postfix($x,'pJ') }
sub postfix:<fJ> (Real:D $x) is export { do-postfix($x,'fJ') }
sub postfix:<aJ> (Real:D $x) is export { do-postfix($x,'aJ') }
sub postfix:<zJ> (Real:D $x) is export { do-postfix($x,'zJ') }
sub postfix:<yJ> (Real:D $x) is export { do-postfix($x,'yJ') }
sub postfix:<W> (Real:D $x) is export { do-postfix($x,'W') }
sub postfix:<daW> (Real:D $x) is export { do-postfix($x,'daW') }
sub postfix:<hW> (Real:D $x) is export { do-postfix($x,'hW') }
sub postfix:<kW> (Real:D $x) is export { do-postfix($x,'kW') }
sub postfix:<MW> (Real:D $x) is export { do-postfix($x,'MW') }
sub postfix:<GW> (Real:D $x) is export { do-postfix($x,'GW') }
sub postfix:<TW> (Real:D $x) is export { do-postfix($x,'TW') }
sub postfix:<PW> (Real:D $x) is export { do-postfix($x,'PW') }
sub postfix:<EW> (Real:D $x) is export { do-postfix($x,'EW') }
sub postfix:<ZW> (Real:D $x) is export { do-postfix($x,'ZW') }
sub postfix:<YW> (Real:D $x) is export { do-postfix($x,'YW') }
sub postfix:<dW> (Real:D $x) is export { do-postfix($x,'dW') }
sub postfix:<cW> (Real:D $x) is export { do-postfix($x,'cW') }
sub postfix:<mW> (Real:D $x) is export { do-postfix($x,'mW') }
sub postfix:<μW> (Real:D $x) is export { do-postfix($x,'μW') }
sub postfix:<nW> (Real:D $x) is export { do-postfix($x,'nW') }
sub postfix:<pW> (Real:D $x) is export { do-postfix($x,'pW') }
sub postfix:<fW> (Real:D $x) is export { do-postfix($x,'fW') }
sub postfix:<aW> (Real:D $x) is export { do-postfix($x,'aW') }
sub postfix:<zW> (Real:D $x) is export { do-postfix($x,'zW') }
sub postfix:<yW> (Real:D $x) is export { do-postfix($x,'yW') }
sub postfix:<C> (Real:D $x) is export { do-postfix($x,'C') }
sub postfix:<daC> (Real:D $x) is export { do-postfix($x,'daC') }
sub postfix:<hC> (Real:D $x) is export { do-postfix($x,'hC') }
sub postfix:<kC> (Real:D $x) is export { do-postfix($x,'kC') }
sub postfix:<MC> (Real:D $x) is export { do-postfix($x,'MC') }
sub postfix:<GC> (Real:D $x) is export { do-postfix($x,'GC') }
sub postfix:<TC> (Real:D $x) is export { do-postfix($x,'TC') }
sub postfix:<PC> (Real:D $x) is export { do-postfix($x,'PC') }
sub postfix:<EC> (Real:D $x) is export { do-postfix($x,'EC') }
sub postfix:<ZC> (Real:D $x) is export { do-postfix($x,'ZC') }
sub postfix:<YC> (Real:D $x) is export { do-postfix($x,'YC') }
sub postfix:<dC> (Real:D $x) is export { do-postfix($x,'dC') }
sub postfix:<cC> (Real:D $x) is export { do-postfix($x,'cC') }
sub postfix:<mC> (Real:D $x) is export { do-postfix($x,'mC') }
sub postfix:<μC> (Real:D $x) is export { do-postfix($x,'μC') }
sub postfix:<nC> (Real:D $x) is export { do-postfix($x,'nC') }
sub postfix:<pC> (Real:D $x) is export { do-postfix($x,'pC') }
sub postfix:<fC> (Real:D $x) is export { do-postfix($x,'fC') }
sub postfix:<aC> (Real:D $x) is export { do-postfix($x,'aC') }
sub postfix:<zC> (Real:D $x) is export { do-postfix($x,'zC') }
sub postfix:<yC> (Real:D $x) is export { do-postfix($x,'yC') }
sub postfix:<V> (Real:D $x) is export { do-postfix($x,'V') }
sub postfix:<daV> (Real:D $x) is export { do-postfix($x,'daV') }
sub postfix:<hV> (Real:D $x) is export { do-postfix($x,'hV') }
sub postfix:<kV> (Real:D $x) is export { do-postfix($x,'kV') }
sub postfix:<MV> (Real:D $x) is export { do-postfix($x,'MV') }
sub postfix:<GV> (Real:D $x) is export { do-postfix($x,'GV') }
sub postfix:<TV> (Real:D $x) is export { do-postfix($x,'TV') }
sub postfix:<PV> (Real:D $x) is export { do-postfix($x,'PV') }
sub postfix:<EV> (Real:D $x) is export { do-postfix($x,'EV') }
sub postfix:<ZV> (Real:D $x) is export { do-postfix($x,'ZV') }
sub postfix:<YV> (Real:D $x) is export { do-postfix($x,'YV') }
sub postfix:<dV> (Real:D $x) is export { do-postfix($x,'dV') }
sub postfix:<cV> (Real:D $x) is export { do-postfix($x,'cV') }
sub postfix:<mV> (Real:D $x) is export { do-postfix($x,'mV') }
sub postfix:<μV> (Real:D $x) is export { do-postfix($x,'μV') }
sub postfix:<nV> (Real:D $x) is export { do-postfix($x,'nV') }
sub postfix:<pV> (Real:D $x) is export { do-postfix($x,'pV') }
sub postfix:<fV> (Real:D $x) is export { do-postfix($x,'fV') }
sub postfix:<aV> (Real:D $x) is export { do-postfix($x,'aV') }
sub postfix:<zV> (Real:D $x) is export { do-postfix($x,'zV') }
sub postfix:<yV> (Real:D $x) is export { do-postfix($x,'yV') }
sub postfix:<F> (Real:D $x) is export { do-postfix($x,'F') }
sub postfix:<daF> (Real:D $x) is export { do-postfix($x,'daF') }
sub postfix:<hF> (Real:D $x) is export { do-postfix($x,'hF') }
sub postfix:<kF> (Real:D $x) is export { do-postfix($x,'kF') }
sub postfix:<MF> (Real:D $x) is export { do-postfix($x,'MF') }
sub postfix:<GF> (Real:D $x) is export { do-postfix($x,'GF') }
sub postfix:<TF> (Real:D $x) is export { do-postfix($x,'TF') }
sub postfix:<PF> (Real:D $x) is export { do-postfix($x,'PF') }
sub postfix:<EF> (Real:D $x) is export { do-postfix($x,'EF') }
sub postfix:<ZF> (Real:D $x) is export { do-postfix($x,'ZF') }
sub postfix:<YF> (Real:D $x) is export { do-postfix($x,'YF') }
sub postfix:<dF> (Real:D $x) is export { do-postfix($x,'dF') }
sub postfix:<cF> (Real:D $x) is export { do-postfix($x,'cF') }
sub postfix:<mF> (Real:D $x) is export { do-postfix($x,'mF') }
sub postfix:<μF> (Real:D $x) is export { do-postfix($x,'μF') }
sub postfix:<nF> (Real:D $x) is export { do-postfix($x,'nF') }
sub postfix:<pF> (Real:D $x) is export { do-postfix($x,'pF') }
sub postfix:<fF> (Real:D $x) is export { do-postfix($x,'fF') }
sub postfix:<aF> (Real:D $x) is export { do-postfix($x,'aF') }
sub postfix:<zF> (Real:D $x) is export { do-postfix($x,'zF') }
sub postfix:<yF> (Real:D $x) is export { do-postfix($x,'yF') }
sub postfix:<Ω> (Real:D $x) is export { do-postfix($x,'Ω') }
sub postfix:<daΩ> (Real:D $x) is export { do-postfix($x,'daΩ') }
sub postfix:<hΩ> (Real:D $x) is export { do-postfix($x,'hΩ') }
sub postfix:<kΩ> (Real:D $x) is export { do-postfix($x,'kΩ') }
sub postfix:<MΩ> (Real:D $x) is export { do-postfix($x,'MΩ') }
sub postfix:<GΩ> (Real:D $x) is export { do-postfix($x,'GΩ') }
sub postfix:<TΩ> (Real:D $x) is export { do-postfix($x,'TΩ') }
sub postfix:<PΩ> (Real:D $x) is export { do-postfix($x,'PΩ') }
sub postfix:<EΩ> (Real:D $x) is export { do-postfix($x,'EΩ') }
sub postfix:<ZΩ> (Real:D $x) is export { do-postfix($x,'ZΩ') }
sub postfix:<YΩ> (Real:D $x) is export { do-postfix($x,'YΩ') }
sub postfix:<dΩ> (Real:D $x) is export { do-postfix($x,'dΩ') }
sub postfix:<cΩ> (Real:D $x) is export { do-postfix($x,'cΩ') }
sub postfix:<mΩ> (Real:D $x) is export { do-postfix($x,'mΩ') }
sub postfix:<μΩ> (Real:D $x) is export { do-postfix($x,'μΩ') }
sub postfix:<nΩ> (Real:D $x) is export { do-postfix($x,'nΩ') }
sub postfix:<pΩ> (Real:D $x) is export { do-postfix($x,'pΩ') }
sub postfix:<fΩ> (Real:D $x) is export { do-postfix($x,'fΩ') }
sub postfix:<aΩ> (Real:D $x) is export { do-postfix($x,'aΩ') }
sub postfix:<zΩ> (Real:D $x) is export { do-postfix($x,'zΩ') }
sub postfix:<yΩ> (Real:D $x) is export { do-postfix($x,'yΩ') }
sub postfix:<S> (Real:D $x) is export { do-postfix($x,'S') }
sub postfix:<daS> (Real:D $x) is export { do-postfix($x,'daS') }
sub postfix:<hS> (Real:D $x) is export { do-postfix($x,'hS') }
sub postfix:<kS> (Real:D $x) is export { do-postfix($x,'kS') }
sub postfix:<MS> (Real:D $x) is export { do-postfix($x,'MS') }
sub postfix:<GS> (Real:D $x) is export { do-postfix($x,'GS') }
sub postfix:<TS> (Real:D $x) is export { do-postfix($x,'TS') }
sub postfix:<PS> (Real:D $x) is export { do-postfix($x,'PS') }
sub postfix:<ES> (Real:D $x) is export { do-postfix($x,'ES') }
sub postfix:<ZS> (Real:D $x) is export { do-postfix($x,'ZS') }
sub postfix:<YS> (Real:D $x) is export { do-postfix($x,'YS') }
sub postfix:<dS> (Real:D $x) is export { do-postfix($x,'dS') }
sub postfix:<cS> (Real:D $x) is export { do-postfix($x,'cS') }
sub postfix:<mS> (Real:D $x) is export { do-postfix($x,'mS') }
sub postfix:<μS> (Real:D $x) is export { do-postfix($x,'μS') }
sub postfix:<nS> (Real:D $x) is export { do-postfix($x,'nS') }
sub postfix:<pS> (Real:D $x) is export { do-postfix($x,'pS') }
sub postfix:<fS> (Real:D $x) is export { do-postfix($x,'fS') }
sub postfix:<aS> (Real:D $x) is export { do-postfix($x,'aS') }
sub postfix:<zS> (Real:D $x) is export { do-postfix($x,'zS') }
sub postfix:<yS> (Real:D $x) is export { do-postfix($x,'yS') }
sub postfix:<Wb> (Real:D $x) is export { do-postfix($x,'Wb') }
sub postfix:<daWb> (Real:D $x) is export { do-postfix($x,'daWb') }
sub postfix:<hWb> (Real:D $x) is export { do-postfix($x,'hWb') }
sub postfix:<kWb> (Real:D $x) is export { do-postfix($x,'kWb') }
sub postfix:<MWb> (Real:D $x) is export { do-postfix($x,'MWb') }
sub postfix:<GWb> (Real:D $x) is export { do-postfix($x,'GWb') }
sub postfix:<TWb> (Real:D $x) is export { do-postfix($x,'TWb') }
sub postfix:<PWb> (Real:D $x) is export { do-postfix($x,'PWb') }
sub postfix:<EWb> (Real:D $x) is export { do-postfix($x,'EWb') }
sub postfix:<ZWb> (Real:D $x) is export { do-postfix($x,'ZWb') }
sub postfix:<YWb> (Real:D $x) is export { do-postfix($x,'YWb') }
sub postfix:<dWb> (Real:D $x) is export { do-postfix($x,'dWb') }
sub postfix:<cWb> (Real:D $x) is export { do-postfix($x,'cWb') }
sub postfix:<mWb> (Real:D $x) is export { do-postfix($x,'mWb') }
sub postfix:<μWb> (Real:D $x) is export { do-postfix($x,'μWb') }
sub postfix:<nWb> (Real:D $x) is export { do-postfix($x,'nWb') }
sub postfix:<pWb> (Real:D $x) is export { do-postfix($x,'pWb') }
sub postfix:<fWb> (Real:D $x) is export { do-postfix($x,'fWb') }
sub postfix:<aWb> (Real:D $x) is export { do-postfix($x,'aWb') }
sub postfix:<zWb> (Real:D $x) is export { do-postfix($x,'zWb') }
sub postfix:<yWb> (Real:D $x) is export { do-postfix($x,'yWb') }
sub postfix:<T> (Real:D $x) is export { do-postfix($x,'T') }
sub postfix:<daT> (Real:D $x) is export { do-postfix($x,'daT') }
sub postfix:<hT> (Real:D $x) is export { do-postfix($x,'hT') }
sub postfix:<kT> (Real:D $x) is export { do-postfix($x,'kT') }
sub postfix:<MT> (Real:D $x) is export { do-postfix($x,'MT') }
sub postfix:<GT> (Real:D $x) is export { do-postfix($x,'GT') }
sub postfix:<TT> (Real:D $x) is export { do-postfix($x,'TT') }
sub postfix:<PT> (Real:D $x) is export { do-postfix($x,'PT') }
sub postfix:<ET> (Real:D $x) is export { do-postfix($x,'ET') }
sub postfix:<ZT> (Real:D $x) is export { do-postfix($x,'ZT') }
sub postfix:<YT> (Real:D $x) is export { do-postfix($x,'YT') }
sub postfix:<dT> (Real:D $x) is export { do-postfix($x,'dT') }
sub postfix:<cT> (Real:D $x) is export { do-postfix($x,'cT') }
sub postfix:<mT> (Real:D $x) is export { do-postfix($x,'mT') }
sub postfix:<μT> (Real:D $x) is export { do-postfix($x,'μT') }
sub postfix:<nT> (Real:D $x) is export { do-postfix($x,'nT') }
sub postfix:<pT> (Real:D $x) is export { do-postfix($x,'pT') }
sub postfix:<fT> (Real:D $x) is export { do-postfix($x,'fT') }
sub postfix:<aT> (Real:D $x) is export { do-postfix($x,'aT') }
sub postfix:<zT> (Real:D $x) is export { do-postfix($x,'zT') }
sub postfix:<yT> (Real:D $x) is export { do-postfix($x,'yT') }
sub postfix:<H> (Real:D $x) is export { do-postfix($x,'H') }
sub postfix:<daH> (Real:D $x) is export { do-postfix($x,'daH') }
sub postfix:<hH> (Real:D $x) is export { do-postfix($x,'hH') }
sub postfix:<kH> (Real:D $x) is export { do-postfix($x,'kH') }
sub postfix:<MH> (Real:D $x) is export { do-postfix($x,'MH') }
sub postfix:<GH> (Real:D $x) is export { do-postfix($x,'GH') }
sub postfix:<TH> (Real:D $x) is export { do-postfix($x,'TH') }
sub postfix:<PH> (Real:D $x) is export { do-postfix($x,'PH') }
sub postfix:<EH> (Real:D $x) is export { do-postfix($x,'EH') }
sub postfix:<ZH> (Real:D $x) is export { do-postfix($x,'ZH') }
sub postfix:<YH> (Real:D $x) is export { do-postfix($x,'YH') }
sub postfix:<dH> (Real:D $x) is export { do-postfix($x,'dH') }
sub postfix:<cH> (Real:D $x) is export { do-postfix($x,'cH') }
sub postfix:<mH> (Real:D $x) is export { do-postfix($x,'mH') }
sub postfix:<μH> (Real:D $x) is export { do-postfix($x,'μH') }
sub postfix:<nH> (Real:D $x) is export { do-postfix($x,'nH') }
sub postfix:<pH> (Real:D $x) is export { do-postfix($x,'pH') }
sub postfix:<fH> (Real:D $x) is export { do-postfix($x,'fH') }
sub postfix:<aH> (Real:D $x) is export { do-postfix($x,'aH') }
sub postfix:<zH> (Real:D $x) is export { do-postfix($x,'zH') }
sub postfix:<yH> (Real:D $x) is export { do-postfix($x,'yH') }
sub postfix:<lm> (Real:D $x) is export { do-postfix($x,'lm') }
sub postfix:<dalm> (Real:D $x) is export { do-postfix($x,'dalm') }
sub postfix:<hlm> (Real:D $x) is export { do-postfix($x,'hlm') }
sub postfix:<klm> (Real:D $x) is export { do-postfix($x,'klm') }
sub postfix:<Mlm> (Real:D $x) is export { do-postfix($x,'Mlm') }
sub postfix:<Glm> (Real:D $x) is export { do-postfix($x,'Glm') }
sub postfix:<Tlm> (Real:D $x) is export { do-postfix($x,'Tlm') }
sub postfix:<Plm> (Real:D $x) is export { do-postfix($x,'Plm') }
sub postfix:<Elm> (Real:D $x) is export { do-postfix($x,'Elm') }
sub postfix:<Zlm> (Real:D $x) is export { do-postfix($x,'Zlm') }
sub postfix:<Ylm> (Real:D $x) is export { do-postfix($x,'Ylm') }
sub postfix:<dlm> (Real:D $x) is export { do-postfix($x,'dlm') }
sub postfix:<clm> (Real:D $x) is export { do-postfix($x,'clm') }
sub postfix:<mlm> (Real:D $x) is export { do-postfix($x,'mlm') }
sub postfix:<μlm> (Real:D $x) is export { do-postfix($x,'μlm') }
sub postfix:<nlm> (Real:D $x) is export { do-postfix($x,'nlm') }
sub postfix:<plm> (Real:D $x) is export { do-postfix($x,'plm') }
sub postfix:<flm> (Real:D $x) is export { do-postfix($x,'flm') }
sub postfix:<alm> (Real:D $x) is export { do-postfix($x,'alm') }
sub postfix:<zlm> (Real:D $x) is export { do-postfix($x,'zlm') }
sub postfix:<ylm> (Real:D $x) is export { do-postfix($x,'ylm') }
sub postfix:<lx> (Real:D $x) is export { do-postfix($x,'lx') }
sub postfix:<dalx> (Real:D $x) is export { do-postfix($x,'dalx') }
sub postfix:<hlx> (Real:D $x) is export { do-postfix($x,'hlx') }
sub postfix:<klx> (Real:D $x) is export { do-postfix($x,'klx') }
sub postfix:<Mlx> (Real:D $x) is export { do-postfix($x,'Mlx') }
sub postfix:<Glx> (Real:D $x) is export { do-postfix($x,'Glx') }
sub postfix:<Tlx> (Real:D $x) is export { do-postfix($x,'Tlx') }
sub postfix:<Plx> (Real:D $x) is export { do-postfix($x,'Plx') }
sub postfix:<Elx> (Real:D $x) is export { do-postfix($x,'Elx') }
sub postfix:<Zlx> (Real:D $x) is export { do-postfix($x,'Zlx') }
sub postfix:<Ylx> (Real:D $x) is export { do-postfix($x,'Ylx') }
sub postfix:<dlx> (Real:D $x) is export { do-postfix($x,'dlx') }
sub postfix:<clx> (Real:D $x) is export { do-postfix($x,'clx') }
sub postfix:<mlx> (Real:D $x) is export { do-postfix($x,'mlx') }
sub postfix:<μlx> (Real:D $x) is export { do-postfix($x,'μlx') }
sub postfix:<nlx> (Real:D $x) is export { do-postfix($x,'nlx') }
sub postfix:<plx> (Real:D $x) is export { do-postfix($x,'plx') }
sub postfix:<flx> (Real:D $x) is export { do-postfix($x,'flx') }
sub postfix:<alx> (Real:D $x) is export { do-postfix($x,'alx') }
sub postfix:<zlx> (Real:D $x) is export { do-postfix($x,'zlx') }
sub postfix:<ylx> (Real:D $x) is export { do-postfix($x,'ylx') }
sub postfix:<Bq> (Real:D $x) is export { do-postfix($x,'Bq') }
sub postfix:<daBq> (Real:D $x) is export { do-postfix($x,'daBq') }
sub postfix:<hBq> (Real:D $x) is export { do-postfix($x,'hBq') }
sub postfix:<kBq> (Real:D $x) is export { do-postfix($x,'kBq') }
sub postfix:<MBq> (Real:D $x) is export { do-postfix($x,'MBq') }
sub postfix:<GBq> (Real:D $x) is export { do-postfix($x,'GBq') }
sub postfix:<TBq> (Real:D $x) is export { do-postfix($x,'TBq') }
sub postfix:<PBq> (Real:D $x) is export { do-postfix($x,'PBq') }
sub postfix:<EBq> (Real:D $x) is export { do-postfix($x,'EBq') }
sub postfix:<ZBq> (Real:D $x) is export { do-postfix($x,'ZBq') }
sub postfix:<YBq> (Real:D $x) is export { do-postfix($x,'YBq') }
sub postfix:<dBq> (Real:D $x) is export { do-postfix($x,'dBq') }
sub postfix:<cBq> (Real:D $x) is export { do-postfix($x,'cBq') }
sub postfix:<mBq> (Real:D $x) is export { do-postfix($x,'mBq') }
sub postfix:<μBq> (Real:D $x) is export { do-postfix($x,'μBq') }
sub postfix:<nBq> (Real:D $x) is export { do-postfix($x,'nBq') }
sub postfix:<pBq> (Real:D $x) is export { do-postfix($x,'pBq') }
sub postfix:<fBq> (Real:D $x) is export { do-postfix($x,'fBq') }
sub postfix:<aBq> (Real:D $x) is export { do-postfix($x,'aBq') }
sub postfix:<zBq> (Real:D $x) is export { do-postfix($x,'zBq') }
sub postfix:<yBq> (Real:D $x) is export { do-postfix($x,'yBq') }
sub postfix:<Gy> (Real:D $x) is export { do-postfix($x,'Gy') }
sub postfix:<daGy> (Real:D $x) is export { do-postfix($x,'daGy') }
sub postfix:<hGy> (Real:D $x) is export { do-postfix($x,'hGy') }
sub postfix:<kGy> (Real:D $x) is export { do-postfix($x,'kGy') }
sub postfix:<MGy> (Real:D $x) is export { do-postfix($x,'MGy') }
sub postfix:<GGy> (Real:D $x) is export { do-postfix($x,'GGy') }
sub postfix:<TGy> (Real:D $x) is export { do-postfix($x,'TGy') }
sub postfix:<PGy> (Real:D $x) is export { do-postfix($x,'PGy') }
sub postfix:<EGy> (Real:D $x) is export { do-postfix($x,'EGy') }
sub postfix:<ZGy> (Real:D $x) is export { do-postfix($x,'ZGy') }
sub postfix:<YGy> (Real:D $x) is export { do-postfix($x,'YGy') }
sub postfix:<dGy> (Real:D $x) is export { do-postfix($x,'dGy') }
sub postfix:<cGy> (Real:D $x) is export { do-postfix($x,'cGy') }
sub postfix:<mGy> (Real:D $x) is export { do-postfix($x,'mGy') }
sub postfix:<μGy> (Real:D $x) is export { do-postfix($x,'μGy') }
sub postfix:<nGy> (Real:D $x) is export { do-postfix($x,'nGy') }
sub postfix:<pGy> (Real:D $x) is export { do-postfix($x,'pGy') }
sub postfix:<fGy> (Real:D $x) is export { do-postfix($x,'fGy') }
sub postfix:<aGy> (Real:D $x) is export { do-postfix($x,'aGy') }
sub postfix:<zGy> (Real:D $x) is export { do-postfix($x,'zGy') }
sub postfix:<yGy> (Real:D $x) is export { do-postfix($x,'yGy') }
sub postfix:<Sv> (Real:D $x) is export { do-postfix($x,'Sv') }
sub postfix:<daSv> (Real:D $x) is export { do-postfix($x,'daSv') }
sub postfix:<hSv> (Real:D $x) is export { do-postfix($x,'hSv') }
sub postfix:<kSv> (Real:D $x) is export { do-postfix($x,'kSv') }
sub postfix:<MSv> (Real:D $x) is export { do-postfix($x,'MSv') }
sub postfix:<GSv> (Real:D $x) is export { do-postfix($x,'GSv') }
sub postfix:<TSv> (Real:D $x) is export { do-postfix($x,'TSv') }
sub postfix:<PSv> (Real:D $x) is export { do-postfix($x,'PSv') }
sub postfix:<ESv> (Real:D $x) is export { do-postfix($x,'ESv') }
sub postfix:<ZSv> (Real:D $x) is export { do-postfix($x,'ZSv') }
sub postfix:<YSv> (Real:D $x) is export { do-postfix($x,'YSv') }
sub postfix:<dSv> (Real:D $x) is export { do-postfix($x,'dSv') }
sub postfix:<cSv> (Real:D $x) is export { do-postfix($x,'cSv') }
sub postfix:<mSv> (Real:D $x) is export { do-postfix($x,'mSv') }
sub postfix:<μSv> (Real:D $x) is export { do-postfix($x,'μSv') }
sub postfix:<nSv> (Real:D $x) is export { do-postfix($x,'nSv') }
sub postfix:<pSv> (Real:D $x) is export { do-postfix($x,'pSv') }
sub postfix:<fSv> (Real:D $x) is export { do-postfix($x,'fSv') }
sub postfix:<aSv> (Real:D $x) is export { do-postfix($x,'aSv') }
sub postfix:<zSv> (Real:D $x) is export { do-postfix($x,'zSv') }
sub postfix:<ySv> (Real:D $x) is export { do-postfix($x,'ySv') }
sub postfix:<kat> (Real:D $x) is export { do-postfix($x,'kat') }
sub postfix:<dakat> (Real:D $x) is export { do-postfix($x,'dakat') }
sub postfix:<hkat> (Real:D $x) is export { do-postfix($x,'hkat') }
sub postfix:<kkat> (Real:D $x) is export { do-postfix($x,'kkat') }
sub postfix:<Mkat> (Real:D $x) is export { do-postfix($x,'Mkat') }
sub postfix:<Gkat> (Real:D $x) is export { do-postfix($x,'Gkat') }
sub postfix:<Tkat> (Real:D $x) is export { do-postfix($x,'Tkat') }
sub postfix:<Pkat> (Real:D $x) is export { do-postfix($x,'Pkat') }
sub postfix:<Ekat> (Real:D $x) is export { do-postfix($x,'Ekat') }
sub postfix:<Zkat> (Real:D $x) is export { do-postfix($x,'Zkat') }
sub postfix:<Ykat> (Real:D $x) is export { do-postfix($x,'Ykat') }
sub postfix:<dkat> (Real:D $x) is export { do-postfix($x,'dkat') }
sub postfix:<ckat> (Real:D $x) is export { do-postfix($x,'ckat') }
sub postfix:<mkat> (Real:D $x) is export { do-postfix($x,'mkat') }
sub postfix:<μkat> (Real:D $x) is export { do-postfix($x,'μkat') }
sub postfix:<nkat> (Real:D $x) is export { do-postfix($x,'nkat') }
sub postfix:<pkat> (Real:D $x) is export { do-postfix($x,'pkat') }
sub postfix:<fkat> (Real:D $x) is export { do-postfix($x,'fkat') }
sub postfix:<akat> (Real:D $x) is export { do-postfix($x,'akat') }
sub postfix:<zkat> (Real:D $x) is export { do-postfix($x,'zkat') }
sub postfix:<ykat> (Real:D $x) is export { do-postfix($x,'ykat') }
#))

#EOF
