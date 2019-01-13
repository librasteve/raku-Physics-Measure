#lib/Physics/Measure/Lang.pm6
unit module Physics::Measure::Lang:ver<0.0.2>:auth<Steve Roe (sroe@furnival.net)>;

use Physics::Measure;

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

