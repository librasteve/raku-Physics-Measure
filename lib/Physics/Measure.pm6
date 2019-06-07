unit module Physics::Measure:ver<0.0.2>:auth<Steve Roe (p6steve@furnival.net)>;
use Physics::Measure::Unit;

class Unitless { ... }
class Time { ... }

class Measure is export {
    #Parent class for physical quantities with value, units & error(tbd)
    #Builds child classes such as Distance, Mass, Power, etc. 

    has Real $!value;
    has Unit $.units;

    submethod BUILD( :$!value, :$!units ) { }

    method value( Real $value? ) is rw {
    	Proxy.new:
            FETCH => sub ( $ ) { $!value },
            STORE => sub ( $, $value )  {
                if $value == 1 || $value == -1 { self.units.set-sing-name } 
                    else                       { self.units.set-plur-name }
                $!value = $value;
            }
    }

    my $new-db = 0; #debug
    sub extract( Str:D $string ) {   #baby Grammar value / unit / error
        print "extracting «$string» ... " if $new-db; 
        my regex number {
            \S+                     #grab chars
            <?{ defined +"$/" }>    #assert coerces via '+' to Real
        }
        my Real $v;
        my Str  $u = '';
        $string ~~ /^ ( <number> ) \s* ( <-[±]>* ) $/;
        $v = +"$0".Real if $0.defined;  #cast to Real
        $u = "$1".Str if $1.defined;
        say "v is «$v» and u is «$u»" if $new-db;
        return( $v, $u );
    }
    sub new-measure-object( Real $value is rw, Unit $units ) {
        #uses Type Variable ::($name) technique
        say "making nmo() from v is $value; u is " ~ $units.perl if $new-db;
        my $nuts = $units.unitsof;          #new unit type string
        if $nuts eq 'Time' { $value = Duration.new( $value ) }
        if $nuts ~~ /'🌀'/ { $nuts  = 'Measure' }
        return ::($nuts).new( value => $value, units => $units );
    }

    multi method new( Str:D $s ) {
        say "new from Str" if $new-db;
        my ( $v, $us ) = extract( $s );
        my Unit $uo .=new( name => $us );   say "uo is " ~ $uo.perl if $new-db;
        my $nuts = $uo.unitsof;             #infer new unit type from string
        say "new unit type str is $nuts" if $new-db;
        if $nuts ~~ /'🌀'/ { $nuts  = 'Measure' }
        ::($nuts).new( value => $v, units => $uo );
    }
    multi method new( Real:D $r ) {
        say "new from Real" if $new-db;
        my Unit $uo .=new( unitsof => self.^name );
        self.bless( value => $r, units => $uo );
    }
    multi method new( :$value, :$units ) {
        say "new from named attributes" if $new-db;
        my $nunits = $units ~~ Unit ?? $units !! Unit.new( unitsof => self.^name );
        my $nvalue = $value ~~ Real ?? $value !! Real;
        return self.bless( value => $nvalue, units => $nunits );
    }
    multi method new( Measure:D $m ) {
        say "new from Measure" if $new-db;
        self.bless( value => $m.value, units => $m.units );
    }
    method clone( ::T: ) {
        #using Type Variables viz. http://www.jnthn.net/papers/2008-yapc-eu-perl6types.pdf
        if $new-db { print "cloning an object of Type "; say ::T; } 
        return T.new: self;
    }  

    my $ass-db = 0; #debug
    multi method assign( Measure:D $right ) {
        say "assign from Measure" if $ass-db;
        $.value = $right.value;
        $!units = $right.units;
    }
    multi method assign( Str:D $right ) {
        say "assign from Str" if $ass-db;
        my ( $v, $ustr ) = extract( $right );  
        $.value = $v;
        $!units .=new( name => $ustr ) if $ustr;
    }   
    multi method assign( Real:D $right ) {
        say "assign from Real" if $ass-db;
        my Unit $uo .=new( name => 'm', unitsof => self.^name );  #FIXME de hardwire default
        $.value = $right;
        $!units //= $uo;
    } 

    method Str {
        return $!units.Str ?? $!value.Str ~ ' ' ~ $!units.Str !! $!value.Str ;
    }
    method Real {
        return $!value;
    }
    method Numeric {
        return $!value;
    }
    method gist {
        my $perl = self.perl;
        $perl ~~ s/ ( Physics .*? ) Physics .* /$0\"$!units\" ... )/; 
        return $perl;
    }

    method norm {
        my $tb = $!units.get-type-base;
        if $tb.defined {
            return self.in( $tb );
        } else {
            warn "Failed to normalize units, please check operand units are compatible!";
        }
    }
    method add( $right is rw ) {
        if ( $right.units eq $!units ) {
            $.value += $right.value;
            return self;
        } elsif $!units.unitsof eq $right.units.unitsof {
            say "Normalizing Measures to base type for add.";
            my $left = self.norm;
            $right .= norm;
            $left.value += $right.value;
            return $left;
        } else {
            say "Cannot add two Measures of different Type!";
        }
    }
    method subtract( $right is rw ) {
        if ( $right.units eq $!units ) { 
            $.value -= $right.value; 
            return self;
        } elsif $!units.unitsof eq $right.units.unitsof {
            say "Normalizing Measures to base type for subtract.";
            my $left = self.norm;
            $right .= norm;
            $left.value -= $right.value;
            return $left;
        } else {
            say "Cannot subtract two Measures of different Type!";
        }
    }   
    method negate {
        #unlike reciprocal this negates the original object
        $.value *= -1;
        return self;
    } 

    method multiply( Measure:D $right is rw ) {
        #e.g. Area object from Distance*Distance
        my $left = self;
        my ( $ok, $nuo ) = $left.units.scalar-combine( $right.units, 'mul' );   #get new unit obj 
        unless $ok {
            #Fail where same unitsof but different name e.g. '6 m.feet'
            say "Mixing elements of same type, but different names not possible, normalizing to base type!";
            $left  .= norm;
            $right .= norm;
            ( $ok, $nuo ) = $left.units.scalar-combine( $right.units, 'mul' );   #try again 
            unless $ok {
                warn "Failed to normalize units for multiply, please check operand units are compatible!";
                return;
            }
        }
        my $nmo = new-measure-object( $left.value, $nuo );             #prep return obj
        $nmo.value *= $right.value;
        return $nmo;
    }   
    method multiply-const(Real:D $right) {
        $.value *= $right; 
        return self;
    }   
    
    method divide( Measure:D $right is rw ) {
        if ( $right.units eq $!units ) { 
            #making Real from e.g. Distance / Distance
            my Real $r = $.value / $right.value; 
            return $r;
        } else {
            #making e.g. Speed object from Distance / Time, name feet.s-1
            my $left = self;
            my ( $ok, $nuo ) = $left.units.scalar-combine( $right.units, 'div' );   #get new unit obj 
            unless $ok {
                #Fail where same unitsof but different name e.g. '6 m.feet'
                say "Mixing elements of same type, but different names not possible, normalizing to base type!";
                $left  .= norm;
                $right .= norm;
                ( $ok, $nuo ) = $left.units.scalar-combine( $right.units, 'div' );   #try again 
                unless $ok {
                    warn "Failed to normalize units for division, please check operand units are compatible!";
                    return;
                }
            }
            my $nmo = new-measure-object( $left.value, $nuo );             #prep return obj
            $nmo.value /= $right.value;
            return $nmo;
        }
    }   
    method divide-const( Real:D $right ) {
        $.value /= $right; 
        return self;
    }
    method reciprocal {
        #use nmo to make new 's-1' object (unlike negate does not affect the original object)
        my Unitless $unity .= new( value => 1 );
        my $deno = self;
        return $unity.divide( $deno );
    } 

    method power( Real:D $n ) {
        #e.g. Area object from Distance ** 2
        my $result = self;
        my $factor = self;
        for 2..$n {
            $result .= multiply( $factor ); 
        }
        return $result;
    } 
    sub nth-root( $n, $A, $p=1e-9 ) {
        my $x0 = $A / $n;
        loop {
            my $x1 = (($n-1) * $x0 + $A / ($x0 ** ($n-1))) / $n;
            return $x1 if abs($x1-$x0) < abs($x0 * $p);
            $x0 = $x1;
        }
    }
    method root( Int:D $n ) {
        my ( $ok, $nuo ) = $!units.root-extract( $n );
        unless $ok {
            #Test all units of self == x.n and set to x.1 or fail
            say "Can only take square, cube, fourth root if unit dimensions all exactly divisible by power!";
            return;
        }
        my $nval = nth-root( $n, $!value );
        my $nmo  = new-measure-object( $nval, $nuo );             #prep return obj
        return $nmo;
    }
    method sqrt() {
        return self.root( 2 );
    }

    method in( Str $convert-to ) {
        my $in-db = 0; #debug
        my $cto = Unit.new( name => $convert-to );              #convert-to unit object
        my $cfo = self.units;                                   #convert-fm unit object
        my $convert-fm = $cfo.name;                             #convert-fm name

        say "...converting from «$convert-fm» to «$convert-to»..thus..«" ~ $cfo.unitsof ~ "» to «" 
                         ~ $cto.unitsof ~ "»..." if $in-db;
        #dd $cto;
        
        #check Measure Types match 
        if $cto.unitsof ne $cfo.unitsof {
            if $cto.unitsof eq 'Measure' || $cfo.unitsof eq 'Measure' {
                say "Converting from " ~ $cfo.unitsof ~ " to " ~ $cto.unitsof ~ 
                        " ... not able to check specific Unit Type against generic Measure!" if $in-db;
            } else {
                warn "Conversion between different Measure Types not possible!";
                return;
            }
        }
        #check Unit names differ
        if $convert-to eq $convert-fm {
            say "Converting to same units - may be redundant operation!" if $in-db;
            return self;
        }

        my $nmo = new-measure-object( $.value, $cto );          #prep return object

        #composite from m.s-1 to miles.hours-1...
        #1. iterate to/fm dims, match unitsof 
        #2. convert each dim via in-nato 
        #native order from l to yards3...
        #1. check if to/fm is-nato
        #2. do first/last conversion step by hand (i.e. cxo to/fm its order root)
        #3. rely on in-simple to invert when cto.is-nato
        #order from feet2 to m2...
        #1. decompose from wwwwd to name wwww and order d (in TWEAK)
        #2. iterate simple d times
        #3. handle -d with inverse
        #simple from miles to yards...
        #1. walk fm-roots: miles => feet => m
        #2. walk to-roots: yards => feet => m
        #3. combine 1. and 2.: miles => feet => m => feet => yards 
        
        if $in-db { say $cfo.perl; say $cto.perl; say $nmo.perl };
        say "...nmo.value is " ~ $nmo.value if $in-db;

        ##composite
        if $cfo.is-comp {                                       say "cfo is comp" if $in-db;
            my ( $cfo-dim, $cto-dim );
            my ( $fm-dim-name, $to-dim-name );

            for $cfo.dims.keys -> $fm-dim {
                $fm-dim-name = $fm-dim ~ $cfo.dims{$fm-dim}; #NB leave trailing 1
                #say "..fm-dim is $fm-dim; fm-dim-name is $fm-dim-name" if $in-db;
                $cfo-dim = Unit.new( name => $fm-dim-name );
                #say "..outer-fm: " ~ $cfo-dim.unitsof if $in-db;

                for $cto.dims.keys -> $to-dim {
                    $to-dim-name = $to-dim ~ $cto.dims{$to-dim};
                    #say "....to-dim is $to-dim; to-dim-name is $to-dim-name" if $in-db;
                    $cto-dim = Unit.new( name => $to-dim-name );
                    #say "....inner-to: " ~ $cto-dim.unitsof if $in-db;

                    #convert where dims have same unitsof
                    if $cto-dim.unitsof eq $cfo-dim.unitsof {
                        in-nato( $cfo-dim, $cto-dim );
                        #say "......nmo.value is " ~ $nmo.value if $in-db;
                    }
                }
            }
        } else {   
            in-nato( $cfo, $cto );
        }
        return $nmo;

        ##nato
        sub in-nato( $cfo is rw, $cto is rw ) {
            my ( $cfo-ord, $cto-ord ) = ( $cfo, $cto );
            if $cfo.is-nato {
                my $cfo-ord = $cfo.root;
                #say "...converting first step from " ~ $cfo.name ~ " to " ~ $cfo-ord.name if $in-db;
                in-simple( $cfo, $cfo-ord );                        #just convert e.g. l to m3
                $cfo = $cfo-ord;                                    #swap cfo then carry on as normal
                #say "nmo.value is " ~ $nmo.value if $in-db;
            }
            if $cto.is-nato {
                my $cto-ord = $cto.root;
                #say "...converting last step from " ~ $cto-ord.name ~ " to " ~ $cto.name if $in-db;
                in-simple( $cto-ord, $cto );                        #just convert e.g. m3 to l
                $cto = $cto-ord;                                    #swap cto then carry on as normal
                #say "nmo.value is " ~ $nmo.value if $in-db;
            }
            in-order( $cfo, $cto );
        }
        
        ##order
        sub in-order( $cfo, $cto ) {
            say "...converting at order: " ~ $cfo.order if $in-db;
            if $cfo.order > 0 {
                for 1 .. $cfo.order.abs {
                    in-simple( $cfo, $cto );
                    say "nmo.value is " ~ $nmo.value if $in-db;
                }
            } elsif $cfo.order < 0 {
                for 1 .. $cfo.order.abs {
                    in-simple( $cto, $cfo );    #invert by swapping NB does not work with offset! 
                    #say "-ve order nmo.value is " ~ $nmo.value if $in-db;
                }
            } else {
                warn "Unable to convert scalars!";
            }
        }
        
        ##simple
        sub in-simple ( $cfo, $cto ) { 
            my $is-db = 0; #debug
            #dd $cfo if $is-db;
            
            #load root lists
            my @fm-root-list = $cfo.list-roots( [$cfo] );   dd @fm-root-list if $is-db;
            my @to-root-list = $cto.list-roots( [$cto] );   dd @to-root-list if $is-db;
            
            my $engaged = False;
            my $is-convert-to = $cto.name;      #re-set after pre-amble adjustments
            OUTERFOR:
            for @fm-root-list -> $fm-root {
                say "entering fm-root= $fm-root" if $is-db;
                if $fm-root eq $is-convert-to {
                    say " ...to root found, jumping out..." if $is-db;
                    last OUTERFOR;
                } else {
                    #at this fm-root, look for cross over to to-root longest case is via core 
                    for @to-root-list.reverse -> $to-root {
                        say " entering to-root= $to-root" if $is-db;
                        if $to-root eq $fm-root {
                            say " to root matches fm root" if $is-db;
                            $engaged = True;
                        } elsif $engaged {
                            say " next do root-conv-fm" if $is-db;
                            $nmo.value = $to-root.root-conv-fm( $nmo.value ); 
                        }
                        say " to-loop-end: engaged: $engaged: value:" ~ $nmo.value if $is-db;
                    }
                    #don't forget to abandon any more fm-roots
                    if $engaged {
                        last OUTERFOR;
                    }
                }
                $nmo.value = $fm-root.root-conv-to( $nmo.value ); 
                say "fm-loop-end: value:" ~ $nmo.value if $is-db;
            }
        }
    } 

    method cmp( $a: $b ) {
        #say "a cmp b: a is $a: b is $b";
        if $a.units.unitsof eq $b.units.unitsof {
            if $a.units.name eq $b.units.name {
                return $a.value cmp $b.value;
            } else {
                say "Normalizing Measures to base type for cmp.";
                my $an = $a.norm;
                my $bn = $b.norm;
                return $an.value cmp $bn.value;
            }
        } else {
            say "Cannot cmp two Measures of different Type!";
            return;
        }    
    }
}

class Time is Measure is export {
    #Duration ops <+> <-> <mod>
    
    multi method new( Measure:D $m ) {
        nextsame;
    }
    multi method new( Str:D $s ) {
        nextsame;
    }
    multi method new( Real:D $r ) {
        nextsame;
    }
    multi method new( *%h is copy ) {
        #say "new Time from Named";
        nextwith( |%h );
    }

    #get/set Time value as Duration
    #get usage -  my Duration $d8 = $t8.Duration;
    multi method Duration() {
        return Duration.new( $.value );
    }
    #set usage - $t.Duration( $dur ); - NB. cannot use as proxy in assignment with '=' 
    multi method Duration( Duration:D $d is copy ) {
        $.value = $d.Real;
    }

    #FIXME denormalize duration in seconds to given units e.g. hh:mm:ss v2 feature
}

class Unitless           is Measure is export {}
class Angle              is Measure is export {}
class Solid-Angle        is Measure is export {}
class Distance           is Measure is export {}
#`[[
#FIXME test this
#some synonyms for Distance...
class Length             is Distance is export {}
class Breadth            is Distance is export {}
class Width              is Distance is export {}
class Height             is Distance is export {}
class Depth              is Distance is export {}
]]
class Mass               is Measure is export {}
class Moment-of-Inertia  is Measure is export {}
class Frequency          is Measure is export {}
class Angular-Speed      is Measure is export {}
class Speed              is Measure is export {}
class Acceleration       is Measure is export {}
class Impulse            is Measure is export {}
class Momentum           is Measure is export {}
class Angular-Momentum   is Measure is export {}
class Data               is Measure is export {}
class Substance          is Measure is export {}
class Money              is Measure is export {}
class Current            is Measure is export {}
class Potential          is Measure is export {}
class Resistance         is Measure is export {}
class Conductance        is Measure is export {}
class Capacitance        is Measure is export {}
class Inductance         is Measure is export {}
class Magnetic-Flux      is Measure is export {}
class Magnetic-Field     is Measure is export {}
class Temperature        is Measure is export {}
class Luminosity         is Measure is export {}
class Force              is Measure is export {}
class Area               is Measure is export {}
class Volume             is Measure is export {}
class Power              is Measure is export {}
class Energy             is Measure is export {}
class Torque             is Measure is export {}
class Charge             is Measure is export {}
class Pressure           is Measure is export {}
class Density            is Measure is export {}
class Dose               is Measure is export {}

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
multi infix:<libra> ( Measure:D $left, Measure:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}
multi infix:<libra> ( Measure:D $left, Str:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}
multi infix:<libra> ( Measure:D $left, Real:D $right ) is equiv( &infix:<=> ) is export {
    $left.assign( $right );
}

multi prefix:<-> ( Measure:D $right) is export {
    my $result = $right.clone;
    return $result.negate;
}
multi prefix:<+> ( Measure:D $right) is export {
    return $right;   #no op
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
