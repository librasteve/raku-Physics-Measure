#!/usr/bin/env raku 
use lib '../lib';
use Physics::Unit;
use Physics::Measure;

#SYNOPSIS

#Unit objects can be selected or created with GetUnit:
	my Unit   $u  = GetUnit( 'm' );
#Define your own unit named "ff" (named args)
	my $ff = Unit.new( defn => 'furlong / fortnight', names => ['ff'] );

#Measure objects such as Length can be formally constructed:
	my Length $a .=new(value => 1e4, units => $u);	say "$a";		#10000 m

#The libra operator ♎️ is a handy way to construct objects...
    my $b ♎️ '5e1 m';								say "$b";		#50 m
    my $c ♎️ $a;									say "$c";		#10000 m
	my Length $l ♎️ 42;								say "$l";		#42 m
#...and to assign objects a value:
    $a ♎️ 3e1;          #'30 m'
    $a ♎️ '3 yards';    #'3 yards'
    $a ♎️ 5;            #'5 yards'
#...there is an ASCII version of <♎️> namely <libra> 

#To see what you have
    say $a.Real;        #50   or use $a in Real context (Real includes Int|Rat|Num etc)
    say $a.Str;         #50 m or use $a in Str context
    say "$a";           #50 m

#The usual arithmetic operators < + - * / > and () brackets just work
#i.e. units and magnitudes are checked, calculated and errors are calculated automatically    
    $a ♎️ '4.3 m';      #'4.3 m' 
    $b ♎️ -2.3;         #'-2.3 m'
    $c = $a + $b;       #'2 m'
    $c = $a + '42 m';   #'46.3 m'
    $c = $b - $a;       #'-6.6 m'
    $c = '1 m' - $a;    #'-3.3 m' 
#Division like for like produces a Real value such as a Rat
    my Real $r = $a / $b; #'-1.869565'
#Multiply with & Divide by a Real imply a constant factor...
    $c = $b * 30;       #'-69 m'

#The package variable $Physics::Measure::round-to is applied to Str output if defined
	$Physics::Measure::round-to = 0.01;
 
#Angles use degrees/minutes/seconds or decimal radians
	my $θ1 ♎️ <45°30′30″>;		#45°30′30″ (using <> to deconfuse quotation marks)
	my $θ2 ♎️ '2.141 radians';  #'2.141 radian'
#NB. The unit name 'rad' is reserved for the unit of radioactive Dose

# Trigonometric functions sin, cos and tan (and arc-x) handle Angles 
	my $sine = sin( $θ1 );		#0.7133523847299412
	my $arcsin = asin( $sine, units => '°' ); #45°30′30″
#NB. Provide the units => '°' tag to tell asin you want degrees back

#The Measure of Time has a raku Duration - i.e. the difference between two DateTime Instants:
    my $i1 = DateTime.now;
    my $i2 = DateTime.new( '2020-08-10T14:15:27.26Z' );
    my $i3 = DateTime.new( '2020-08-10T14:15:37.26Z' );
    my Duration $dur = $i3-$i2;

#Here's how to us the libra assignment operator ♎️ for Time...
    my Time $t1 ♎️ '5e1 s';     #50 s
    my Time $t2 ♎️ $dur;        #10 s
    my $t3 = $t1 + $t2;         #60 s
    my Time $t4 ♎️ '2 hours';   #2 hr
    $dur = $t4.Duration;		#7200

#Unit Conversion uses the .in() method - specify the new units as a String
    my Length $df ♎️ '12.0 feet';
    my $dm = $df.in( 'm' );				#3.658 m
       $dm = $df.in: <m> ;				#alternate form
    my Temperature $deg-c ♎️ '39 °C';
    my $deg-k = $deg-c.in( 'K' );       #312.15 K
    my $deg-cr = $deg-k.in( '°C' );     #39 °C
#Use arithmetic to get high order or inverse Unit types such as Area, Volume, Frequency, etc.
    my Area		  $x = $a * $a;         #18.49 m^2
    my Speed      $s = $a / $t2;        #0.43 m/s
    my Frequency  $f = 1  / $t2;        #0.1 Hz
#Use powers & roots in a similar way
    my Volume     $v = $a ** 3;         #79.507 m^3
    my Length	  $d = $v ** <1/3>;     #0.43 m

#About 230 built in units are included, for example...
    my $v2 ♎️ '7 yards^3';				#7 yard^3		(Volume)
    my $v3 = $v2.in( 'm3' );			#5.352 m^3		(Volume) 
    my $dsdt = $s / $t1;				#0.009 m/s^2	(Acceleration)
    my $sm ♎️ '70 mph';                 #70 mph			(Speed)
    my $fo ♎️ '27 kg m / s^2';			#27 N			(Force)
    my $en1 ♎️ '26 kg m^2 / s^2';		#26 J			(Energy)
    my $po ♎️ '25 kg m^2 / s^3';		#25 W			(Power)
    my $en2 = $po * $t1;                #1250 J			(Energy)
	say $po.canonical;					#25 m2.s-3.kg   (SI base units)
	say $po.pretty;						#25 m²⋅s⁻³⋅kg   (SI recommends)
	say ListBases(); say ListTypes(); say ListUnits();

#Measures can be converted to base type with the .rebase() method
    my $v4 = $v3.rebase;				#5.352 m^3
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

#EOF
