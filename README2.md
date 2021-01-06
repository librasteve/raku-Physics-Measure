Dear reader - this is a work in progress compete rewrite of the README.md...

[![Build Status](https://travis-ci.com/p6steve/raku-Physics-Measure.svg?branch=master)](https://travis-ci.com/p6steve/raku-Physics-Measure)
# raku-Physics-Measure
Provides raku Measure objects that have value, units and error(tbd) and that can be used in common physics calculations. Uses [Physics::Unit](https://github.com/p6steve/raku-Physics-Unit).

# Instructions
```zef install --verbose https://github.com/p6steve/raku-Physics-Measure.git```
and, conversely, ```zef uninstall Physics::Measure```

# Use Case Concept

```perl6
use lib '../lib';
use Physics::Measure :ALL;

# Basic mechanics example (SI units)...

# Define a distance and a time
my \d = 42m;                say ~d;     #42 m      (Length)
my \t = 10s;                say ~t;     #10 s      (Time)

# Calculate speed and acceleration
my \u = d / t;              say ~u;     #4.2 m/s   (Speed)
my \a = u / t;              say ~a;     #0.42 m/s^2 (Acceleration)

# Define mass and calculate force
my \m = 25kg;               say ~m;     #25 kg     (Mass)
my \f = m * a;              say ~f;     #10.5 N    (Force)

# Calculate final speed and distance travelled
my \v = u + a*t;            say ~v;     #8.4 m/s   (Speed)
my \s = u*t + (1/2) * a * t*t;  say ~s; #63 m      (Length)

# Calculate potential energy 
my \pe = f * s;             say ~pe;    #661.5 J   (Energy)

# Calculate kinetic energy
my \ke1 = (1/2) * m * u*u;
my \ke2 = (1/2) * m * v*v;

# Calculate the delta in kinetic energy
my \Δke = ke2 - ke1;

# Compare potential vs. delta kinetic energy
(pe cmp Δke).say;                      #Same
```

This example shows some key features of Physics::Measure...
* support for SI prefixes, base and derived units (cm, kg, ml and so on)
* imported as raku postfix operators for convenience and clarity
* custom math operators ```(+-*/)``` for easy inclusion in calculations
* inference of type class (Length, Time, Mass, etc.) from units
* derivation of type class of results (Speed, Acceleration, etc.)

# Design Model

Together Physics::Measure and Physics::Unit follow this high level class design model:

```perl6
class Unit {
   has Str $.defn;
   #... 
}
class Measure {
   has Real $.value;
   has Unit $.units;
   has Error $.error;  #tbd in version 2
   #...
}
class Length is Measure {}
class Time   is Measure {}
class Speed  is Measure {}
#and so on
```
Type classes represent physical measurement such as (Length), (Time), (Speed), etc. They are child classes of the (Measure) parent class. 

You can do math operations on (Measure) objects - (Length) can add/subtract to (Length), (Time) can add/subtract to (Time), and so on. A mismatch like adding a (Length) to a (Time) gives a raku Type error _cannot convert in to different type Length_. You can, however, divide e.g. (Length) by (Time) and then get a (Speed) type back. (Length) ** 2 => (Area). (Length) ** 3 => (Volume). And so on. There are 36 pre-defined types provided. Methods are provided to create custom units and types.

Therefore, in the normal course, please make your objects as instances of the Child type classes.

# Output Methods

To see what you have got, then go:
```perl6
my $po = 25W;   
say ~$po; say "$po"; say $po.Str;       #25 W  (defaults to derived unit)
say +$po; say $po.value; say $po.Real;  #25 
say $po.WHAT;                           #(Power)
say $po.canonical;                      #25 m2.s-3.kg   (SI base units)
say $po.pretty;                         #25 m²⋅s⁻³⋅kg   (SI recommended style)
```

# Three ways to consume Physics::Measure
## 1 Raku postfixes (SI Units)

As seen above, if you just want SI prefixes, base and derived units (cm, kg, ml and so on), the :ALL export label provides them as raku postfix:<> custom operators. Here is another example, basic wave mechanics, bringing in the Physics::Constants module:
```perl6
use Physics::Constants;  #<== must use before Physics::Measure 
use Physics::Measure :ALL;

$Physics::Measure::round-to = 0.01;

my \λ = 2.5nm; 
my \ν = c / λ;  
my \Ep = ℎ * ν;  

say "Wavelength of photon (λ) is " ~λ;              #2.5 nm
say "Frequency of photon (ν) is " ~ν.norm;          #119.92 petahertz 
say "Energy of photon (Ep) is " ~Ep.norm;           #79.46 attojoule
```

The following SI units are provided in this way:
![image](https://github.com/p6steve/raku-Physics-Measure/blob/master/images/SIUnitPrefixTable.png)

## 2 Raku object constructors & methods

All of the postfix SI Units can also be used in the standard raku object constructor syntax:
```perl6
my Length $l = Length.new(value => 42, units => 'μm'); say ~$l; #42 micrometre
```
In addition, the Physics::Measure / Physics::Unit modules provide a comprehensive set of US units and Imperial units (feet, miles, knots, hours, ergs, eV and over 200 more).
```perl6
my Length $d = Length.new(value => 42, units => 'miles'); say ~$d; #42 micrometre
my Time $t = Time.new(value => 7, units => 'hours'); say ~$t; #7 minutes
```


(4) Right now there are 3 ways provided to make child objects:
(a) ```my Length $s = Length.new(value => 5.1, units => 'm');``` which is good raku (and OO in general), but is quite long hand where you want to work with many Measure objects in your code. .
(b) Thus the 'libra' notation came about as a short hand trick to cut out the constructor boilerplate that will take a unit Str and auto 'look up' the child type thusly ```my $s ♎️ '5.1m'; say $s.WHAT; #(Length)```


So, while I agree it is a little odd with the ♎️ emoji code, it is a very quick way to do something like ```my $s ♎️ '5.1 feet ±2%'; say ~$s.in('m');``` Basically it's a 

In summary - very much appreciate the feedback ... I hope that you are in tune with the class model benefits. My main use cases are teaching (thus having most non SI in the mix for historical aspects) and to provide a scientific / navigation / engineering calculator tool. 

I am wondering how best to balance (b) and (c) ... based on your (and other) f/back probably I will push the emoji option way down in the doc as there are many other concepts to convey first...

Meantime I have reopened this ticket and will keep open as a reminder to fix the docs for v0.0.4.

(2) I 100% agree about errors and this will be added to the module in a future release ... the initial f/back I got was that the Postfix notation ```my $x = 20ml;``` e.g. to give ```Volume.new( value => 20, units => 'ml' );``` was higher priority ... so that was the last big addition to this module.
