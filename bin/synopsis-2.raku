#!/usr/bin/env raku 
use lib '../lib';
use Physics::Measure :ALL;

#see https://github.com/p6steve/raku-Physics-Measure/blob/master/README.md for explanation 

#SYNOPSIS

#Measure objects such as Length and Time can be formally constructed:

# Metric / SI units
	my Length $l = Length.new(value => 42, units => 'μm'); say ~$l; #42 micrometre

# Non-metric US and Imperial units
	my Length $d = Length.new(value => 42, units => 'miles');   say ~$d;         #42 mile
	my Time   $t = Time.new(  value =>  7, units => 'hours');   say ~$t;         #7 hr
	my $s = $d / $t;                                  say ~$s.in('mph');         #6 mph

#The libra operator ♎️ is shorthand to construct objects...
	my $a ♎️ '4.3 m';								say "$a";		#4.3 m
    my $b ♎️ '5e1 m';								say "$b";		#50 m
    my $c ♎️ $a;									say "$c";		#10000 m
#Use the emoji editor provided on your system (or just cut and paste)

#About 230 built in units are included, for example...
    my $v2 ♎️ '7 yards^3';          #7 yard^3         (Volume)
    my $v3 = $v2.in( 'm3' );        #5.352 m^3        (Volume) 
    my $dsdt = $s / $t;             #0.009 m/s^2      (Acceleration)
    my $sm ♎️ '70 mph';             #70 mph           (Speed)
    my $fo ♎️ '27 kg m / s2';       #27 N             (Force)
    my $en ♎️ '26 kg m^2 / s^2';    #26 J             (Energy)
    my $po ♎️ '25 kg m^2 / s^3';    #25 W             (Power)

#Angles use degrees/minutes/seconds or decimal radians
    my $θ1 ♎️ <45°30′30″>;      #45°30′30″ (using <> to deconfuse quotation marks)
    my $θ2 ♎️ '2.141 radians';  #'2.141 radian'
#NB. The unit name 'rad' is reserved for the unit of radioactive Dose

#Trigonometric functions sin, cos and tan (and arc-x) handle Angles
    my $sine = sin( $θ1 );      #0.7133523847299412
    my $arcsin = asin( $sine, units => '°' ); #45°30′30″
#NB. Provide the units => '°' tag to tell asin you want degrees back

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
    $dur = $t4.Duration;         #7200

#Unit Conversion uses the .in() method - specify the new units as a String
    my Length $df ♎️ '12.0 feet';
    my $dm = $df.in( 'm' );				#3.658 m
       $dm = $df.in: <m> ;				#alternate form
    my Temperature $deg-c ♎️ '39 °C';
    my $deg-k = $deg-c.in( 'K' );       #312.15 K
    my $deg-cr = $deg-k.in( '°C' );     #39 °C
#Use arithmetic to get high order or inverse Unit types such as Area, Volume, Frequency, etc.
    my Area		  $x = $a * $a;         #18.49 m^2
    my Speed      $s1 = $a / $t2;       #0.43 m/s
    my Frequency  $f = 1  / $t2;        #0.1 Hz
#Use powers & roots in a similar way
    my Volume     $v = $a ** 3;         #79.507 m^3
    my Length	  $d2 = $v ** <1/3>;    #0.43 m

#Set rounding precision (or reset with Nil) - does not reduce internal precision
    $Physics::Measure::round-to = 0.01;
#Normalize SI Units to the optimal SI prefix
	my \λ = 2500pm;		say ~λ.norm;	#2.5 nm 
#Reset to SI base type with the .rebase() method
    my $v4 = $v2.rebase;                #5.35 m^3

#Measures can be compared with $a cmp $b
    my $af = $a.in: 'feet';             #4.3 m => 14.108 feet
    say $af cmp $a;                     #Same
#Measures can be tested for equality with Numeric ==,!=
    say $af == $a;                      #True
    say $af != $a;                      #False
#Use string equality eq,ne to distinguish different units with same type  
    say $af eq $a;                      #False
    say $af ne $a;                      #True

#To see what you have got, then go:
	my $po = 25W;   
	say ~$po; say "$po"; say $po.Str;       #25 W  (defaults to derived unit)
	say +$po; say $po.value; say $po.Real;  #25 
	say $po.WHAT;                           #(Power)
	say $po.canonical;                      #25 m2.s-3.kg   (SI base units)
	say $po.pretty;                         #25 m²⋅s⁻³⋅kg   (SI recommended style)

#EOF
