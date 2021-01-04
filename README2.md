Dear reader - this is a work in progress compete rewrite of the README.md...

[![Build Status](https://travis-ci.com/p6steve/raku-Physics-Measure.svg?branch=master)](https://travis-ci.com/p6steve/raku-Physics-Measure)
# raku-Physics-Measure
Provides raku Measure objects that have value, units and error(tbd) and that can be used in common physics calculations. Uses [Physics::Unit](https://github.com/p6steve/raku-Physics-Unit).

# Instructions
zef install --verbose https://github.com/p6steve/raku-Physics-Measure.git
and, conversely, zef uninstall Physics::Measure

# Concept

```perl6
use lib '../lib';
use Physics::Measure :ALL;

# Some basic mechanics examples...

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

# Design

Physics::Measure is a raku module that combines values, 

class Unit {
   has Str $.defn;
   #... 
}
class Measure {
   has Real $.value;
   has Unit $.units;
   has Error $.error;  #version 2
   #...
}
class Length is Measure {}
class Time is Measure { ... }
class Speed is Measure {}
#and so on

Hi @IlRoccOne 

Once again, many thanks for persisting with this and for your great feedback!!

(1) on the 'mm' vs 'm' point - this is a real bug that crept in (sorr y)- I hot-fixed this yesterday ... but have not yet released to CPAN  so you please follow the re-install directly from the Master branch of this GitHub repo ...
```zef uninstall Physics::Measure``` then ```zef install --verbose https://github.com/p6steve/raku-Physics-Measure.git``` before this will work...

(2) I 100% agree about errors and this will be added to the module in a future release ... the initial f/back I got was that the Postfix notation ```my $x = 20ml;``` e.g. to give ```Volume.new( value => 20, units => 'ml' );``` was higher priority ... so that was the last big addition to this module.

(3) I think we are slightly at cross purposes on the class model - the underlying design intent is:
```perl6
class Unit {
   has Str $.defn;
   #... 
}
class Measure {
   has Real $.value;
   has Unit $.units;
   has Error $.error;  #version 2
   #...
}
class Length is Measure {}
class Time is Measure { ... }
class Speed is Measure {}
#and so on
```
The benefit of all this is that you can do math on Measure objects - Length can add/subtract to Length, Time can add/subtract to Time, but adding a Length to a Time gives a raku type error. I can, however, divide Length by Time and then I get a Speed type back. Length ** 3 => Volume. And so on. Your students may want to know what you get when you go: ```my $w = $s / ( $t * $t ); say ~$w; say $w.WHAT;``` for example. ;-)

Therefore you are not getting the main benefit of Physics::Measure if you just make Measure objects per your example. You need to be making the child objects.
I SEE THAT THIS IS A WEAKNESS OF THE MODULE DOCUMENTATION AND I WILL FIX THIS AS SOON AS I CAN. ;-)

(4) Right now there are 3 ways provided to make child objects:
(a) ```my Length $s = Length.new(value => 5.1, units => 'm');``` which is good raku (and OO in general), but is quite long hand where you want to work with many Measure objects in your code. .
(b) Thus the 'libra' notation came about as a short hand trick to cut out the constructor boilerplate that will take a unit Str and auto 'look up' the child type thusly ```my $s ♎️ '5.1m'; say $s.WHAT; #(Length)```
(c) The Postfix notation does a similar but different trick using raku Postfixes ```my $s = 5.1m; say ~$s.WHAT;``` this is super handy BUT this is limited to common combinations of SI prefixes and unit names for performance reasons.

So, while I agree it is a little odd with the ♎️ emoji code, it is a very quick way to do something like ```my $s ♎️ '5.1 feet ±2%'; say ~$s.in('m');``` Basically it's a 

In summary - very much appreciate the feedback ... I hope that you are in tune with the class model benefits. My main use cases are teaching (thus having most non SI in the mix for historical aspects) and to provide a scientific / navigation / engineering calculator tool. 

I am wondering how best to balance (b) and (c) ... based on your (and other) f/back probably I will push the emoji option way down in the doc as there are many other concepts to convey first...

Meantime I have reopened this ticket and will keep open as a reminder to fix the docs for v0.0.4.
