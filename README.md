# raku-Physics-Measure
A set of SI, Imperial and US Unit objects that are employed by Measure objects having value, units and error(tbd) and act as operands in most calculations. Some prefix and physical constants included where needed. Some use of unicode and operator overload.

*NB. Feedback in general and on the [♎️] interface in particular is very welcome!*

# Instructions
zef install --verbose https://github.com/p6steve/raku-Physics-Measure.git

# Synopsis
[https://github.com/p6steve/raku-Physics-Measure/bin/synopsis.raku](https://github.com/p6steve/raku-Physics-Measure/blob/master/bin/synopsis.raku)

```perl6
use Physics::Measure;
use Physics::Measure::Unit;

#Instances the usual way 
    my Unit     $u .=new(name => 'm', unitsof => 'Distance');      #Unit m
    my Distance $a .=new(value => 10, units => $u);                #Distance 10 m
        
#Introducing the libra operator ♎️ as shorthand to declare and load
    my $b ♎️ '50 m';                #Distance 50 m
       $b ♎️ '3 yards';             #Distance 3 yards

#The usual arithmetic operators < + - * / ** > and () brackets just work
    my $c = $a + $b;                #Distance 12.7432 m 

#Time is a perl6 Duration
    my $t ♎️ '42 s';                #Time 42 s

#Area, Speed, Frequency, Volume
    my $ab = $a * $b;               #Area 27.432 m2
    my $s  = $a / $t;               #Speed 0.238095 m.s-1
    my $f  = 1  / $t;               #Frequency 0.02381 Hz
    my $v  = $b ** 3;               #Volume 27 yards3

#Unit Conversion with the .in method
    $a.=in: <m>;                    #Distance 2.7432 m
    $s.=in: <mph>;                  #Speed 0.532604 mph 

#Normalization with the .norm method
    my $p ♎️ '27 kg m^2 / s^3';     #Power 27 kg m^2 / s^3 
    $p.=norm;                       #Power 27 W 

#Measure instances can be compared and tested as numbers or strings
    $a cmp $c;                      #Less
    $a == $a.in: <cm>;              #True  (i.e. 10 m == 1000 cm) 
    $a eq $b;                       #False (i.e. different units)

#Colloquial terms and unicode superscripts can be used
    #square, sq, squared, cubic, cubed
    #x¹ x² x³ x⁴ and x⁻¹ x⁻² x⁻³ x⁻⁴ 

say "$u $a $b $c $t $ab $s $f $v $p"; 
```
