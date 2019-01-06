#!/usr/bin/env perl6

use lib '../lib';
use Physics::Measure;
use Math::Polygons;
use Math::Polygons::Drawing;

my $x ♎️ '20 m';
my $y ♎️ '20 m';
my $w ♎️ '120 m';
my $h ♎️ '80 m';
my $s ♎️ '100 ft';

my $rectangle = Rectangle.new(
    origin => Point.new($x, $y),
    width  => $w,
    height => $h, 
);

my $square = Square.new(
    origin => Point.new( ( 2*$x + $w ), $y),
    side => $s, 
);

my $drawing = Drawing.new( elements => [
    $rectangle,
    $square,
]);
$drawing.serialize.say;

say "";
say "Rectangle Width:   {$rectangle.width}";
say "Rectangle Height:  {$rectangle.height}";
say "Rectangle Area:    {$rectangle.area}";
say "";
say "Square Side:       {$square.side}";
say "Square Area:       {$square.area}";

