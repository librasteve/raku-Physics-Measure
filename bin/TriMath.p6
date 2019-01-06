#!/usr/bin/env perl6

use lib '../lib';
use Math::Polygons;
use Math::Polygons::Drawing;
use Physics::Measure;

my $x ♎️ '200 m';
my $y ♎️ '160 m';
my $s ♎️ '100 m';

#need sqrt method in Measure for the math to work
#what's going to happen with trig? functions
my $apex = Point.new(x => $x, y => $y),
my $triangle = Triangle.new( apex => $apex, side => $s );

my $drawing = Drawing.new( elements => [
    $triangle,
]);
$drawing.serialize.say;

say "Triangle Side:     {$triangle.side}";
say "Triangle Apex:     {$triangle.apex}";
say "Triangle Height:   {$triangle.height}";
say "Triangle Area:     {$triangle.area}";

