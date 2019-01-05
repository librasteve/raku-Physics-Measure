#!/usr/bin/env perl6
#t/01-new.t 
#TESTALL$ prove -e "perl6" ./t      [from root]
use v6; 
use lib 'lib';
use lib '../lib';
use Test;
#plan 5; 

use Physics::Measure;
use Math::Polygons;
use Math::Polygons::Drawing;

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
#drawing.serialize.say;

ok $triangle.side eq '100 m',        '$triangle.side';
ok $triangle.apex eq '200 m, 160 m', '$triangle.apex';
#ok $triangle.side eq '',        '$triangle.side';
#ok $triangle.area eq '',     '$triangle.area';
#FIXME

done-testing

