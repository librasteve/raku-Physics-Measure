[![Build Status](https://travis-ci.org/p6steve/perl6-Physics-Measure.svg?branch=master)](https://travis-ci.org/p6steve/perl6-Physics-Measure)

Synopsys:
https://github.com/p6steve/perl6-Physics-Measure/blob/master/bin/P--sics.p6

# perl6-Math-Polygons
Some perl6 polygon objects that draw via SVG - an alpha with the plan to do inheritance of Parallelograms, Rhomboids, etc.

[![Build Status](https://travis-ci.org/p6steve/perl6-Math-Polygons.svg?branch=master)](https://travis-ci.org/p6steve/perl6-Math-Polygons)

# Instructions
There are three ways to consume this module:
1. Jupyter Notebook local
- Clone this repo locally on your machine
- Do the Quick Start here Brian Duggan perl6 jupyter-notebook at <https://github.com/bduggan/p6-jupyter-kernel>
- From the root directory run *jupyter-notebook*
2. Jupyter Notebook hosted on Binder
- Click this badge => [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/p6steve/perl6-Physics-Measure/master)
- Go to /eg and click Polygons.ipynb, then Run
- If you are the first to build e.g. a new version this can take 24 mins or so and the Binder browser UI may lose hope - please just be patient (do not reload as this restarts the build)
- If not, go to <mybinder.org> and paste this url <https://github.com/p6steve/perl6-Physics-Measure>, then the ./Dockerfile will be used to (re)build and run on Jupyter at Binder
3. Perl6 Module
- *zef install Physics::Measure*

# Synopsis
```perl6
use SVG::Drawing;
use Math::Polygons;

my $rectangle = Rectangle.new( 
    origin => Point.new(20, 20),
    width  => 120, 
    height => 80  
);

my $square = Square.new( 
    origin => Point.new(170, 20),
    side   => 100 
);

my \A = Point.new( 20, 260);
my \B = Point.new( 30, 200);
my \C = Point.new(120, 145);
my \D = Point.new(125, 250);
my $quadrilateral = Quadrilateral.new(
    A, B, C, D,  
);

my $triangle = Triangle.new(
    fill => "green",
    stroke => "black",
    apex => Point.new(220, 160),
    side => 100 
);

my $drawing = SVG::Drawing.new( 
    elements => [ 
        $rectangle, 
        $square,
        $quadrilateral,
        $triangle,
    ],
);
$drawing.serialize.say;
```

# Inspired by
* Brian Duggan's perl6 jupyter-notebook at <https://github.com/bduggan/p6-jupyter-kernel>
