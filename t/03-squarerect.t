#!/usr/bin/env perl6

use lib '../lib';
use Test;
plan 1;

use Math::Polygons;
use Math::Polygons::Drawing;

my $rectangle = Rectangle.new( 
    origin => Point.new(20, 20),
    width => 120, 
    height => 80  
);

my $square = Square.new( 
    origin => Point.new(160, 20),
    side => 100 
);

my \A = Point.new(20, 260);
my \B = Point.new(30, 160);
my \C = Point.new(120, 145);
my \D = Point.new(125, 250);
my $quadrilateral = Quadrilateral.new(
    A, B, C, D,  
);

my $apex = Point.new(x => 200, y => 160),
my $triangle = Triangle.new( apex => $apex, side => 100 );

my $drawing = Drawing.new( elements => [ 
    $quadrilateral,
    $rectangle, 
    $square, 
    $triangle,
]);
#$drawing.serialize.say;

my $svg-out = q:to/END/;
<svg xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="768" width="1024"><polygon points="20, 260 30, 160 120, 145 125, 250" stroke="blue" stroke-width="3" fill="red" />
<rect x="20" y="20" width="120" height="80" stroke="blue" stroke-width="3" fill="red" />
<rect x="160" y="20" width="100" height="100" stroke="blue" stroke-width="3" fill="red" />
<polygon points="200, 160 150, 246.60254037844385 250, 246.60254037844385" stroke="blue" stroke-width="3" fill="red" />
</svg>
END

#is $drawing.serialize, $svg-out, 'all square';
ok $drawing.serialize.contains( 'svg' ), 'all square';

