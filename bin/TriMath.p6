#!/usr/bin/env perl6
use lib '../lib';
use Math::Polygons;
use Physics::Measure;

class M-Drawing is Drawing {
    has Str $!scale-units = 'm';

    method scale() {
        @.elements.map(-> $e { $e.scale( $!scale-units ) }); 
    }   
}
class M-Point is Point {
    has Distance $.x;
    has Distance $.y;

    method scale( $su ) {
        $!x .= in( "$su" );     
        $!y .= in( "$su" );     
    }
}
class M-Polygon is Polygon {
    has M-Point @.points;
}
class M-Triangle is M-Polygon {
    has M-Point  $.apex is required;
    has Distance $.side is required;

    method scale( $su ) { 
        $!side .= in( "$su" );  
    } 
    method points() {
        ($!apex, |self.base-points)
    }
    method base-points() {
        my $y = $!apex.y + self.height;
        my \A = M-Point.new(:$y, x => $!apex.x - ( $!side / 2 ));
        my \C = M-Point.new(:$y, x => $!apex.x + ( $!side / 2 ));
        return( A, C );
    }
    method height() {
        sqrt($!side**2 - ($!side/2)**2)
    }
    method base() {
        $!side
    }
    method area( ) {
        ( $.height * $.base ) / 2
    }
}
#### here endeth the specializations

my $x ♎️ '200 m';
my $y ♎️ '160 m';
my $s ♎️ '100 ft';

my $apex     = M-Point.new(x => $x, y => $y),
my $triangle = M-Triangle.new( apex => $apex, side => $s );

my $drawing = M-Drawing.new( elements => [
    $triangle,
]);

#pre scale & draw
say "Triangle Side:     {$triangle.side}";
say "Triangle Area:     {$triangle.area}";

$drawing.scale;
$drawing.serialize.say;

#post scale & draw
say "Triangle Side:     {$triangle.side}";
say "Triangle Apex:     {$triangle.apex}"; 
say "Triangle Height:   {$triangle.height}";
say "Triangle Area:     {$triangle.area}";

