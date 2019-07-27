# perl6-Physics-Measure
A set of SI, Imperial and US Unit objects that are employed by Measure objects having value, units and error(tbd) and act as operands in most calculations. Some prefix and physical constants included where needed. Some use of unicode and operator overload.

*NB. Feedback in general and on the [♎️] interface in particular is very welcome!*

[![Build Status](https://travis-ci.org/p6steve/perl6-Physics-Measure.svg?branch=master)](https://travis-ci.org/p6steve/perl6-Physics-Measure)

# Instructions
There are three ways to consume this module:
1. Jupyter Notebook local
- Clone this repo locally on your machine
- Do the Quick Start here Brian Duggan perl6 jupyter-notebook at <https://github.com/bduggan/p6-jupyter-kernel>
- From the root directory run *jupyter-notebook*
2. Jupyter Notebook hosted on Binder
- Click this badge => [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/p6steve/perl6-Physics-Measure/master)
- Go to /eg and click Polygons.ipynb, then Run
- If you are the first to build e.g. a new version this can take 30 mins or so and the Binder browser UI may lose hope - please just be patient (do not reload as this restarts the build)
- If not, go to <mybinder.org> and paste this url <https://github.com/p6steve/perl6-Physics-Measure>, then the ./Dockerfile will be used to (re)build and run on Jupyter at Binder
3. Perl6 Module
- *zef install Physics::Measure*

# Synopsys
[https://github.com/p6steve/perl6-Physics-Measure/bin/P--sics.p6](https://github.com/p6steve/perl6-Physics-Measure/blob/master/bin/P--sics.p6)

```perl6
#!/usr/bin/env perl6
#main.p6
#usage in repl: perl6 -I/path-to-my/perl6-Physics-Measure/lib   then > use Physics::Measure; use Physics::Measure::Unit;

use v6;
use lib '../lib';
use Physics::Measure;
use Physics::Measure::Unit;

#SYNOPSIS

#Types can be declared and constructed formally:
    my Unit $u     .=new(name => 'm', unitsof => 'Distance');       #new Units for new Measure
    my Distance $a .=new(value => 1e4, units => $u);                #'10000 m'
    my Distance $b .=new(value => 42);                              #'42 m' default units
    my Distance $c;
    
#The libra operator ♎️ is a handy way to create instances and to set defaults...
    my $d ♎️ '5e1 m';      #'50 m' (Distance) from Str
    my $e ♎️ $a;           #'10000 m'
#...and to assign (coerce) from a Real or Str immediate value
    $a ♎️ 3e1;          #'30 m'
    $a ♎️ '3 yards';    #'3 yards'
    $a ♎️ '5';          #'5 yards'
#...there is an ASCII version of <♎️> namely <libra> 

#Plural and Singular names are handled as you would expect
    $a ♎️ -1;           #'-1 yard'

#To check what you have
    say $d.gist;        #Physics::Measure::Distance.new(value => 50e0, units => "m" ... )
    say $u.gist;        #Physics::Unit::Unit.new(name => "m", unitsof => "Distance" ...)
    say $d.Real;        #50   or use $d in Real context (Real includes Int|Rat|Num etc)
    say $d.Str;         #'50 m' or use $d in Str context,
    say "$d";           #'50 m'

#The usual arithmetic operators < + - * / > and () brackets just work
#i.e. units and values are normalized and converted automatically   
    $a ♎️ '4.3 m';      #'4.3 m' 
    $b ♎️ -2.3;         #'-2.3 m'
    $c = $a + $b;       #'2 m'
    $c = $a + '42 m';   #'46.3 m'
    $c = $b - $a;       #'-6.6 m'
    $c = '1 m' - $a;    #'-3.3 m' 
#Division like for like produces a Real value such as a Rat
    my Real $r = $a / $b; #-1.869565
#Multiply with (& Divide by) a Real imply a constant factor...
    $c = $b * 30;       #'-69 m'

#The Measure of Time has a perl6 Duration - i.e. the difference between two perl6 DateTime Instants:
    my $i1 = DateTime.now;
    my $i2 = DateTime.new( '2017-08-10T14:15:27.26Z' );
    my $i3 = DateTime.new( '2017-08-10T14:15:37.26Z' );
    my Duration $dur = $i3-$i2; #say "Duration of $dur seconds";

    my Unit $v  .=new( name => 's', unitsof => 'Time' );
    my Time $t0 .=new( value => 23.3, units => $v );    #'23.3 s'
    my Time $t1 .=new( value => $dur, units => $v );    #'10 s'
    
#Here's how to us the libra assignment operator ♎️ for Time...
    my Time $t2 ♎️ '5e1 s';      #'50 s'
    my Time $t3 ♎️ $t1;          #'10 s'
    my Time $t4 ♎️ 172;          #'172 s'

#...and to assign (coerce) from a Real or Str immediate value
    my Time $t5 ♎️ '3e1 s';      #'30 s'
    my Time $t6 ♎️ 42;           #'42 s'

    my $t7 = $t1 + $t2;         #'60 s'
    my $t8 = $t3 - $t4;         #'-162 s'
    my Duration $d8 = $t8.Duration;
    my Time $t10 ♎️ '2 hours';

#Unit Conversion uses the .in() method - specify the new units as a String parameter
    my Distance $d-fe ♎️ '12.0 feet';
    my $d-me3 = $d-fe.in( 'm' );            #'3.6576 m'
       $d-me3 = $d-fe.in: <m> ;             #'3.6576 m' alternate form

    my Temperature $deg-c ♎️ '39 °C';
    my $deg-k = $deg-c.in( 'K' );           #'312.15 K'
    my $deg-cr = $deg-k.in( '°C' );         #'39 °C'

#Use arithmetic to get high order or inverse Unit types such as Area, Volume, Frequency, etc.
    my Area    $a-m2 = $d * $d;              #'2500 m2'
    my Speed      $s = $d / $t6;             #'1.19047619047619 m/s'
    my Frequency  $f = 1  / $t6;             #'0.023810 Hz'
#Use powers & roots in a similar way
    my Volume  $v-m3 = $d ** 3;              #'125000 m3'
    my Distance $a-m = $v-m3 ** <1/3>;       #'50 m' -- <1/3> is a fraction(Rat)

#Conversion of high order or inverse Units of same Type also uses .in() 
    my Volume $v-y31 ♎️ '7 yards3';
    my $v-m31 = $v-y31.in( 'm3' );          #'5.35188400589 m3'

    my Speed $s-ms1 ♎️ '42 m/s';
    my $s-mph2 = $s-ms1.in( 'miles/hours' ); #'93.951324 miles/hours'
    #my $s-ms12 = $s-mph2.in( 'm/s' );       #'42 m/s'

    my $x2 = $a * $b;                       #Area '-9.89 m2'
    my $x3 = $a * $b * $b;                  #Volume '22.747 m3'
    my Speed $sp = $d / $t6;                #'1.19047619047619 m/s'
    my Acceleration $dsdt = $s / $t6;       #'0.028344671201814 m/s^2'

    my $d-fe2 = $d-fe * $d-fe;              #Area '144 feet2'
    my Speed $s-fe = $d-fe / $t6;           #'0.285714 feet.s-1'
    my $sm ♎️ '70 mph';                     #Speed '70 mph'
    my Force $fo2 ♎️ '27 kg m / s^2';       #Force '27 kg m / s^2'
    my Force $fo3 ♎️ '58 kg.m.s-2';         #Force '58 kg.m.s-2'
    my Force $fo1 = $fo2 + $fo3;            #Force '85 N'
    my Energy $en1 ♎️ '7 J';                #Energy '7 J'
    my Energy $en2 ♎️ '26 kg m^2 / s^2';    #Energy '26 kg m^2 / s^2'
    my Power $po1 ♎️ '7 W';                 #Power '7W'
    my Power $po2 ♎️ '27 kg m^2 / s^3';     #Power '27 kg m^2 / s^3'
    my $en3 = $po2 * $t6;                   #Energy '1134 m2.kg.s-2'

#Measures with a base type can be normalized with the .norm() method
    my $en4 = $en3.norm;                    #Energy '1134 J'

#Measures can be compared with $a cmp $b
    my $af = $a.in: 'feet';                 #'4.3 m' => '14.107612 feet'
    say $af cmp $a;                         #Same
#Measures can be tested for equality with Numeric ==,!=
    say $af == $a;                          #True
    say $af != $a;                          #False
#Use string equality eq,ne to distinguish different units with same type  
    say $af eq $a;                          #False
    say $af ne $a;                          #True

#Colloquial terms or unicode superscripts can be used for powers in unitname declarations 
    #square, sq, squared, cubic, cubed
    #x¹ x² x³ x⁴ and x⁻¹ x⁻² x⁻³ x⁻⁴

#EOF
```

# Inspired by
* Brian Duggan's perl6 jupyter-notebook at <https://github.com/bduggan/p6-jupyter-kernel>
