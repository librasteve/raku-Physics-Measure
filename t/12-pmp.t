#!/usr/bin/env perl6
#t/12-pmp.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 5; 

use Math::Polygons;
use Physics::Measure;

#this test defines own Rectangle & Square classes ('copied' from Math::Polygons)

class MyRectangle does Element does Styled {
    has Point $.origin;
    has       $.width;
    has       $.height;

    method area() {
        $.height * $.width
    }

    #|serialize Points as Real to strip any Physics::Measure container
    method serialize( --> Pair) {
        rect => [ x => $!origin.x.Real, y => $!origin.y.Real, width => $!width.Real, height => $!height.Real, |self.styles ];
    }
}

class MySquare does Element does Styled {
    has Point $.origin;
    has       $.side;

    method area() {
        $.side ** 2
    }

    #|serialize Points as Real to strip any Physics::Measure container
    method serialize( --> Pair) {
        rect => [ x => $!origin.x.Real, y => $!origin.y.Real, width => $!side.Real, height => $!side.Real, |self.styles ];
    }
}

my $x ♎️ '20 m';
my $y ♎️ '20 m';
my $w ♎️ '120 m';
my $h ♎️ '80 m'; 
my $s ♎️ '100 ft';

my $rectangle = MyRectangle.new(
    origin => Point.new($x, $y),
    width  => $w, 
    height => $h, 
);

$x ♎️ 160;
my $square = MySquare.new(
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

