#!/usr/bin/env perl6
#t/01-new.t 
#TESTALL$ prove -e "perl6" ./t      [from root]
use v6; 
use lib 'lib';
use lib '../lib';
use Test;
plan 5; 

use Physics::Measure;
use Math::Polygons::Drawing;


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

ok $square.side eq '100 ft',        '$square.side';
ok $square.area eq '10000 ft2',     '$square.area';
ok $rectangle.width eq '120 m',     '$rectangle.width';
ok $rectangle.height eq '80 m',     '$rectangle.height';
ok $rectangle.area eq '9600 m2',    '$rectangle.area';

#done-testing

