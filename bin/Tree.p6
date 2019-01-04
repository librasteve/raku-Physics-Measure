#!/usr/bin/env perl6

use lib '../lib';
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
$drawing.serialize.say;

