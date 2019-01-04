#!/usr/bin/env perl6

use lib '../lib';
use Math::Polygons::Drawing;
use Physics::Measure;

#managed to break if put use Physics::Measure and use Physics::Unit in module Math::Polygons

class Rectangle does Element {
    has Point $.origin;
    has       $.width;
    has       $.height;
     
    method area() { 
        $.height * $.width 
    }   

    method serialize( --> Pair) {
        rect => [ x =>  $!origin.x, y => $!origin.y, width => $!width, height => $!height, |self.styles ];
    }   
}

class Square does Element {
    has Point $.origin;
    has       $.side;

    method area() { 
        #$.side ** 2    #need power math too!
        $.side * $.side
    }   

    method serialize( --> Pair) {
        rect => [ x =>  $!origin.x, y => $!origin.y, width => $!side, height => $!side, |self.styles ];
    }   
}

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

$x ♎️ 160;
my $square = Square.new(
    origin => Point.new($x, $y),
    side => $s, 
);

my $drawing = Drawing.new( elements => [
    $rectangle,
    $square,
]);
#$drawing.serialize.say;

say "";
say "Square Side:       {$square.side}";
say "Square Area:       {$square.area}";
say "";
say "Rectangle Width:   {$rectangle.width}";
say "Rectangle Height:  {$rectangle.height}";
say "Rectangle Area:    {$rectangle.area}";

#`[[ 
#need sqrt method in Measure for the math to work
#what's going to happen with trig? functions
$x ♎️ 200;
$y ♎️ 160;
my $apex = Point.new(x => $x, y => $y),
my $triangle = Triangle.new( apex => $apex, side => $s );

say "";
say "Triangle Side:     {$triangle.side}";
say "Triangle Apex:     {$triangle.apex}";
say "Triangle Height:   {$triangle.height}";
say "Triangle Area:     {$triangle.area}";
#]]

#snagging
# need power ** operator
# catch sqrt as ** 1/2
# need mechanism to convey Measure "Role" to e.g. Polygons classes
# need to think about drawing elements to a scale
# need to worry about trig functions - AB = BCcos(theta) take unit from BC
# need to get it working with 2018.10 and then? 6.d
