Dear reader - this is a work in progress compete rewrite of the README.md...

[![Build Status](https://travis-ci.com/p6steve/raku-Physics-Measure.svg?branch=master)](https://travis-ci.com/p6steve/raku-Physics-Measure)
# raku-Physics-Measure
Provides raku Measure objects that have value, units and error(tbd) and that can be used in common physics calculations. Uses [Physics::Unit](https://github.com/p6steve/raku-Physics-Unit).

# Instructions
```zef install --verbose https://github.com/p6steve/raku-Physics-Measure.git```
and, conversely, ```zef uninstall Physics::Measure```

# Synopsis

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

# Use Cases

The Physics::Measure and Physics::Unit modules were designed with the following use cases in mind:
* convenient use for practical science - lab calculations and interactive presentation of data sets
* a framework for educators and students to interactively explore basic physics via a modern OO language
* an everyday unit conversion and calculation tool (not much point if it can't convert miles to km and so on)

Some other use cases - use for physical chemistry calculations (eg. environmental) and for historic data ingestion - have also been seen on the horizon and the author would be happy to work with you to help adapt to meet a wider set of needs.

# Design Model

To address the Use Cases, the following consistent functional parts have been created:
* a raku Class and Object model to represent Units and Measurements
* methods for Measure math operations, output, comparison, conversion, normalisation and rebasing
* a Unit Grammar to parse unit expressions and cope with textual variants such as ‘miles per hour’ or ‘mph’, or ‘m/s’, ‘ms^-1’, ‘m.s-1’
* an extensible library of about 800 built in unit types covering SI base, derived, US and imperial
* a set of "API" options to meet a variety of consumption needs

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

# Three Consumer Options
## OPtion 1: Postfix Operator Syntax (SI Units)

As seen above, if you just want SI prefixes, base and derived units (cm, kg, ml and so on), the :ALL export label provides them as raku postfix:<> custom operators.  This option is intended for scientist / coders who want fast and concise access to a modern Unit library. Here is another example, basic wave mechanics, bringing in the Physics::Constants module:

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

The following SI units are provided in all Prefix-Unit combinations:

| SI Base Unit (7)  | SI Derived Unit (20)                           | SI Prefix (20) |
|-------------------|------------------------------------------------|----------------|
| 'm',   'metre',   | 'Hz',  'hertz',                                | 'da', 'deka',  |
| 'g',   'gram',    | 'N',   'newton',                               | 'h',  'hecto', |
| 's',   'second',  | 'Pa',  'pascal',                               | 'k',  'kilo',  |
| 'A',   'amp',     | 'J',   'joule',                                | 'M',  'mega',  |
| 'K',   'kelvin',  | 'W',   'watt',                                 | 'G',  'giga',  |
| 'mol', 'mol',     | 'C',   'coulomb',                              | 'T',  'tera',  |
| 'cd',  'candela', | 'V',   'volt',                                 | 'P',  'peta',  |
|                   | 'F',   'farad',                                | 'E',  'exa',   |
|                   | 'Ω',   'ohm',                                  | 'Z',  'zetta', |
|                   | 'S',   'siemens',                              | 'Y',  'yotta', |
|                   | 'Wb',  'weber',                                | 'd',  'deci',  |
|                   | 'T',   'tesla',                                | 'c',  'centi', |
|                   | 'H',   'henry',                                | 'm',  'milli', |
|                   | 'lm',  'lumen',                                | 'μ',  'micro', |
|                   | 'lx',  'lux',                                  | 'n',  'nano',  |
|                   | 'Bq',  'becquerel',                            | 'p',  'pico',  |
|                   | 'Gy',  'gray',                                 | 'f',  'femto', |
|                   | 'Sv',  'sievert',                              | 'a',  'atto',  |
|                   | 'kat', 'katal',                                | 'z',  'zepto', |
|                   | 'l',   'litre',                                | 'y',  'yocto', |

#litre included due to common use of ml, dl, etc.

## Option 2: Object Constructor Syntax

In addition to the SI units listed above, Physics::Measure (and Physics::Unit) offers a comprehensive library of non-metric units. US units and Imperial units include feet, miles, knots, hours, chains, tons and over 200 more. The non-metric units are not exposed as postfix operators.

```perl6
my Length $l = Length.new(value => 42, units => 'miles');   say ~$l;         #42 mile
my Time   $t = Time.new(  value =>  7, units => 'hours');   say ~$t;         #7 hr
my $s = $d / $t;                                  say ~$s.in('mph');         #6 mph
```

A flexible unit expression parser is included to cope with textual variants such as ‘miles per hour’ or ‘mph’; or ‘m/s’, ‘ms^-1’, ‘m.s-1’ (the SI derived unit representation) or ‘m⋅s⁻¹’ (the SI recommended string representation, with superscript powers). The unit expression parser decodes a valid unit string into its roots, extracting unit dimensions and inferring the appropriate type.

Of course, the standard raku object constructor syntax may be used for SI units too:

```perl6
my Length $l = Length.new(value => 42, units => 'μm'); say ~$l; #42 micrometre
```

The option is the most structured, allowing educators for example to use units and basic physics exercises as a way to introduce students to formal raku Object Orientation principles.

## Option 3: Libra Shorthand Syntax

In many cases, coders will want the flexibility of the unit expression parser and the wider range of non-metric units but they want a concise notation. In this case, the unicode libra emoji ♎️ can be used as shorthand for object construction:

```perl6
#The libra ♎️ is shorthand to construct objects...
    my $a ♎️ '4.3 m';						say "$a";		#4.3 m
    my $b ♎️ '5e1 m';						say "$b";		#50 m
    my $c ♎️ $a;                       say "$c";		#10000 m
    my Length $l ♎️ 42;						say "$l";		#42 m (default to base unit of Length)
#...there is an ASCII variant of <♎️> namely <libra> 
```
_Use the emoji editor provided on your system (or just cut and paste)_

```perl6
#About 230 built in units are included, for example...
    my $v2 ♎️ '7 yards^3';          #7 yard^3         (Volume)
    my $v3 = $v2.in( 'm3' );        #5.352 m^3        (Volume) 
    my $dsdt = $s / $t1;            #0.009 m/s^2      (Acceleration)
    my $sm ♎️ '70 mph';             #70 mph           (Speed)
    my $fo ♎️ '27 kg m / s2';       #27 N             (Force)
    my $en ♎️ '26 kg m^2 / s^2';    #26 J             (Energy)
    my $po ♎️ '25 kg m^2 / s^3';    #25 W             (Power)
```

# Special Measure Types

## Angles

```perl6
#Angles use degrees/minutes/seconds or decimal radians
    my $θ1 ♎️ <45°30′30″>;      #45°30′30″ (using <> to deconfuse quotation marks)
    my $θ2 ♎️ '2.141 radians';  #'2.141 radian'
#NB. The unit name 'rad' is reserved for the unit of radioactive Dose

# Trigonometric functions sin, cos and tan (and arc-x) handle Angles
    my $sine = sin( $θ1 );      #0.7133523847299412
    my $arcsin = asin( $sine, units => '°' ); #45°30′30″
#NB. Provide the units => '°' tag to tell asin you want degrees back
```

## Time

```perl6
#The Measure of Time has a raku Duration - i.e. the difference between two DateTime Instants:
    my $i1 = DateTime.now;
    my $i2 = DateTime.new( '2020-08-10T14:15:27.26Z' );
    my $i3 = DateTime.new( '2020-08-10T14:15:37.26Z' );
    my Duration $dur = $i3-$i2;

#Here's how to us the libra assignment operator ♎️ for Time...
    my Time $t1 ♎️ '5e1 s';     	#50 s
    my Time $t2 ♎️ $dur;        	#10 s
    my $t3 = $t1 + $t2;         	#60 s
    my Time $t4 ♎️ '2 hours';   	#2 hr
    $dur = $t4.Duration;		   #7200
```

# Unit Conversion

```perl6
#Unit Conversion uses the .in() method - specify the new units as a String
    my Length $df ♎️ '12.0 feet';
    my $dm = $df.in( 'm' );		         #3.658 m
       $dm = $df.in: <m> ;		            #alternate form
    my Temperature $deg-c ♎️ '39 ºC';
    my $deg-k = $deg-c.in( 'K' );         #312.15 K
    my $deg-cr = $deg-k.in( 'ºC' );       #39 ºC

#Use arithmetic to get high order or inverse Unit types such as Area, Volume, Frequency, etc.
    my Area	      $x = $a * $a;           #18.49 m^2
    my Speed      $s = $a / $t2;          #0.43 m/s
    my Frequency  $f = 1  / $t2;          #0.1 Hz

#Use powers & roots in a similar way
    my Volume     $v = $a ** 3;           #79.507 m^3
    my Length	   $d = $v ** <1/3>;       #0.43 m
```


#Measures can be converted to base type with the .rebase() method
    my $v4 = $v3.rebase;		#5.352 m^3
#Measures can be compared with $a cmp $b
    my $af = $a.in: 'feet';             #4.3 m => 14.108 feet
    say $af cmp $a;                     #Same
#Measures can be tested for equality with Numeric ==,!=
    say $af == $a;                      #True
    say $af != $a;                      #False
#Use string equality eq,ne to distinguish different units with same type  
    say $af eq $a;                      #False
    say $af ne $a;                      #True

#Colloquial terms or unicode superscripts can be used for powers in unitname declarations 
    #square, sq, squared, cubic, cubed
    #x¹ x² x³ x⁴ and x⁻¹ x⁻² x⁻³ x⁻⁴





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



(4) Right now there are 3 ways provided to make child objects:
(a) ```my Length $s = Length.new(value => 5.1, units => 'm');``` which is good raku (and OO in general), but is quite long hand where you want to work with many Measure objects in your code. .
(b) Thus the 'libra' notation came about as a short hand trick to cut out the constructor boilerplate that will take a unit Str and auto 'look up' the child type thusly ```my $s ♎️ '5.1m'; say $s.WHAT; #(Length)```


So, while I agree it is a little odd with the ♎️ emoji code, it is a very quick way to do something like ```my $s ♎️ '5.1 feet ±2%'; say ~$s.in('m');``` Basically it's a 

In summary - very much appreciate the feedback ... I hope that you are in tune with the class model benefits. My main use cases are teaching (thus having most non SI in the mix for historical aspects) and to provide a scientific / navigation / engineering calculator tool. 

I am wondering how best to balance (b) and (c) ... based on your (and other) f/back probably I will push the emoji option way down in the doc as there are many other concepts to convey first...

Meantime I have reopened this ticket and will keep open as a reminder to fix the docs for v0.0.4.

(2) I 100% agree about errors and this will be added to the module in a future release ... the initial f/back I got was that the Postfix notation ```my $x = 20ml;``` e.g. to give ```Volume.new( value => 20, units => 'ml' );``` was higher priority ... so that was the last big addition to this module.
