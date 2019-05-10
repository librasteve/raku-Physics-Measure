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
class M-Rectangle is Rectangle {
    has M-Point  $.origin;
    has Distance $.width is rw;
    has Distance $.height is rw;

    method scale( $su ) {
        $!width  .= in( "$su" ); 
        $!height .= in( "$su" ); 
    }
    method area( --> Area ) {
        $.height * $.width
    }
}
class M-Square is Square {
    has M-Point  $.origin;
    has Distance $.side is rw;

    method scale( $su ) {
        $!side .= in( "$su" ); 
    }
    method area( --> Area ) {
        $.side ** 2
    }
}
#### here endeth the specializations 

my $x ♎️ '20 m';
my $y ♎️ '20 m';
my $w ♎️ '120 m';
my $h ♎️ '80 m';
my $s ♎️ '100 ft';

my $rectangle = M-Rectangle.new(
    origin => M-Point.new($x, $y),
    width  => $w,
    height => $h, 
);
my $square = M-Square.new(
    origin => M-Point.new( ( ( 2 * $x ) + $w ), $y),
    side   => $s, 
);
my $drawing = M-Drawing.new( elements => [
    $rectangle,
    $square,
]);

#pre scale & draw
say "Square Side:       {$square.side}";
say "Square Area:       {$square.area}";

$drawing.scale;
$drawing.serialize.say;

#post scale & draw
say "Rectangle Width:   {$rectangle.width}";
say "Rectangle Height:  {$rectangle.height}";
say "Rectangle Area:    {$rectangle.area}";
say "Square Side:       {$square.side}";
say "Square Area:       {$square.area}";

