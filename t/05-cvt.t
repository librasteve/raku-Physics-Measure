#!/usr/bin/env raku
#t/05-cvt.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
# plan 43;

use Physics::Measure;

$Physics::Measure::round-val = 0.000001;

my Length $d-me = ♎️ '10 m';
is "$d-me", '10m',                                                          '$d.""';
is $d-me.WHAT, (Length),                                                    '$d.WHAT';

my $d-me2 = $d-me.in( 'm' );
is $d-me2.Str, '10m',                                                       '$d.in';
is $d-me2.WHAT, (Length),                                                   '$d.WHAT';

my Length $d-fe = ♎️ '12.0 feet';
is $d-fe, '12ft',                                                           '$d.new';

my $d-me3 = $d-fe.in( 'm' );
is $d-me3, '3.6576m',                                                       '$d.in';

$d-me3 = $d-fe.in: <m> ;
is $d-me3, '3.6576m',                                                       '$d.in-alt';

my Length $d-y = ♎️ '3 yards';
my $d-f2 = $d-y.in( 'feet' );
is $d-f2, '9ft',                                                            '$d.in-feet';

my Length $d-m3 = ♎️ '43.3 m';
my $d-f3 = $d-m3.in( 'feet' );
is $d-f3, '142.060367ft',	                                                '$d.in-feet';

my $d-y2 = $d-m3.in( 'yards' );
is $d-y2, '47.353456yard',	                                                '$d.in-yards';

my Length $d-mi = ♎️ '10 miles';
is $d-mi, '10mile',                                                         '$d.in-miles';
my $d-f = $d-mi.in( 'feet' );
is $d-f, '52800ft',                                                         '$d.in-feet';
my $d-m = $d-mi.in( 'm' );
is $d-m, '16093.44m',                                                       '$d.in-m';

my Length $d-mi2 = ♎️ '1 miles';
my $d-y3 = $d-mi2.in( 'yards' );
is $d-y3, '1760yard',                                                       '$d.in-yards';

my Temperature $deg-c = ♎️ '39 °C';
is $deg-c, '39°C',                                                          '$t.in-C';
my $deg-k = $deg-c.in( 'K' );
is $deg-k, '312.15K',                                                       '$t.in-K';
my $deg-cr = $deg-k.in( '°C' );
is $deg-cr, '39°C',                                                         '$t.in-C';

my Temperature $deg-k2 = ♎️ '300 K';
is $deg-k2, '300K',                                                         '$t.in-K';
my $deg-f = $deg-k2.in( '°F' );
is $deg-f, '80.33°F',	                                                    '$t.in-F';
my $deg-k2r = $deg-f.in( 'K' );
is $deg-k2r, '300K',                                                        '$t.in-K';
    
my Temperature $deg-f2 = ♎️ '98.6 °F';
is $deg-f2, '98.6°F',                                                       '$t.in-F';

my $deg-c2 = $deg-f2.in( '°C' );
is $deg-c2, '37°C',	                                                        '$t.in-C';
    
my $deg-f2r = $deg-c2.in( '°F' );
is $deg-f2r, '98.6°F',                                                      '$t.in-F';

#Conversion of high order Units such as Area, Volume, etc. also uses .in()

my Length $d = ♎️ '5e1 m';
my Area $am2 = ( $d * $d );
is $am2, '2500m^2',                                                         '$a.in-m2';

my Area $a-m21 = ♎️ '42 m2';
is $a-m21, '42m^2',                                                         '$a.new';

my Area $af2 = ($d-fe * $d-fe).in('sq ft');
is $af2, '144sq ft',                                                        '$a.$d*$d';

my Area $a-f21 = ♎️ '36 sq ft';
is $a-f21, '36sq ft',                                                       '$a.new-feet2';

my $a-f22 = $a-m21.in( 'sq ft' );
is $a-f22, '452.084238sq ft',                                               '$a.in-feet2';

my Volume $v-y31 = ♎️ '7 cubic yard';
is $v-y31, '7cubic yard',                                                   '$v.new-yards3';

my $v-m31 = $v-y31.in( 'm3' );
is $v-m31, '5.351884m^3',                                                   '$v.in-m3';

my $v-y32 = $v-m31.in( 'cubic yard' );
is $v-y32, '7cubic yard',                                                   '$v.in-cubic yard';

my Volume $v-l1 = ♎️ '6 l';
is $v-l1, '6l',                                                             '$v.new-l';

my $v-y33 = $v-l1.in( 'cubic yard' );
is $v-y33, '0.007848cubic yard',                                        '$v.in-cubic yard';

my $v-l2 = $v-y33.in( 'l' );
is $v-l2, '6l',                                                             '$v.in-l';

#Conversion of inverse order Units such as Frequency, etc. also uses .in()
my Frequency $f-h1 = ♎️ '78 Hz';
is $f-h1.WHAT, (Frequency),                                                 '$f.WHAT';
is $f-h1, '78Hz',                                                           '$f.new';

my $f-c1 = $f-h1.in( 'cycles' );
is $f-c1, '78cycle',                                                        '$f.in-cycles';

my $f-h2 = $f-c1.in( 'Hz' );
is $f-h2, '78Hz',                                                           '$f.in-Hz';

my Time $t-s1 = ♎️ '30 s';
is $t-s1, '30s',                                                            '$t.new';

my $t-s2 = $t-s1 + 28;
is $t-s2, '58s',                                                            '$t.add-R';

my $t-m1 = $t-s1.in( 'mins' );
is $t-m1, '0.5min',                                                         '$t.in-mins';

my Measure $m-s1 = ♎️ '30 s';
my $m-h12 = $m-s1.in( 'hours' );
my $m-s12 = $m-h12.in( 's' );

my Force $fo1 = ♎️ '27 kg m s^-2';
my $fo2 = $fo1.in( 'N' );
is $fo2, '27N',                                                             '$fo1.in-N';

my Density $de1 = ♎️ '2 kg.m^-3';
my $de2 = $de1.in( 'gm per m^3' );
is $de2, '2000gm per m^3',                                                  '$de1.in-gm per m^3';

#Some new units
my Pressure $pre1 = ♎️ '20 psi';
my $pre2 = $pre1.in('mmHg');
is $pre2, '1034.30151mmHg',                                                 '$pre1.in-mmHg';


my Volume $vol1 = ♎️ '2 gallons';
my Length $dis1 = ♎️ '60 miles';

my $fc1 = ( $dis1 / $vol1 );
say $fc1; say $fc1.^name;


my Volume $vol2 = ♎️ '2 l';
my Length $dis2 = ♎️ '60 km';

#iamerejh - make disam be a setting

# my $fc2 = ( $vol2 / $dis2 ).in('L/100km');
# say $fc2; say $fc2.^name;


# my FuelConsumption $fc2 = ♎️ '30 mpg';
# my $fc3 = $fc2.in('l/100km'); say $fc3;
# is $pre2, '1034.30151mmHg',                                                 '$pre1.in-mmHg';

done-testing;

