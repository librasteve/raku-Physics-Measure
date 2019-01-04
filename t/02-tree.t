#!/usr/bin/env perl6

use lib '../lib';
use Test;
plan 1;

use Math::Polygons;
use Math::Polygons::Drawing;

my $tri1 = Triangle.new(stroke => "green", fill => "green", 
                apex => Point.new(100, 50),
                side => 50, 
            );  
my $tri2 = Triangle.new(stroke => "green", fill => "green", 
                apex => Point.new(100, 75),
                side => 75, 
            );  
my $tri3 = Triangle.new(stroke => "green", fill => "green", 
                apex => Point.new(100, 100),
                side => 100,
            );  
my $rect  = Rectangle.new(stroke => "brown", fill => "brown",
                origin  => Point.new(90, 185),
                width   => 20, 
                height  => 40, 
            );  

my $tree = Group.new( elements => [ $tri1, $tri2, $tri3, $rect ] );
my $drawing = Drawing.new( elements => $tree );
#$drawing.serialize.say;

my $svg-out = q:to/END/;
<svg xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="768" width="1024"><g><polygon points="100, 50 75, 93.30127018922192 125, 93.30127018922192" stroke="green" stroke-width="3" fill="green" />
<polygon points="100, 75 62.5, 139.9519052838329 137.5, 139.9519052838329" stroke="green" stroke-width="3" fill="green" />
<polygon points="100, 100 50, 186.60254037844385 150, 186.60254037844385" stroke="green" stroke-width="3" fill="green" />
<rect x="90" y="185" width="20" height="40" stroke="brown" stroke-width="3" fill="brown" />
</g>
</svg>
END

#is $drawing.serialize, $svg-out, 'happy christmas';
ok $drawing.serialize.contains( 'svg' ), 'happy christmas';

