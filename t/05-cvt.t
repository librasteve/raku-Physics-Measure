#!/usr/bin/env perl6
#t/05-cvt.t 
#TESTALL$ prove -e "perl6" ./t      [from root]
use v6;
use lib 'lib';
use lib '../lib';
use Test;
plan 56; 

use Physics::Measure;
use Physics::Measure::Unit; 
use Physics::Measure::Lang; 

my Distance $d-me ♎️ '10 m'; 
is "$d-me", '10 m',                                                         '$d.""';
is $d-me.WHAT, (Distance),                                                  '$d.WHAT';

my $d-me2 = $d-me.in( 'm' );
is $d-me2.Str, '10 m',                                                      '$d.in';
is $d-me2.WHAT, (Distance),                                                 '$d.WHAT';

my Distance $d-fe ♎️ '12.0 feet';
is $d-fe, '12 feet',                                                        '$d.new';

my $d-me3 = $d-fe.in( 'm' );
is $d-me3, '3.6576 m',                                                      '$d.in';

$d-me3 = $d-fe.in: <m> ;
is $d-me3, '3.6576 m',                                                      '$d.in-alt';

my Distance $d-y ♎️ '3 yards';
my $d-f2 = $d-y.in( 'feet' );
is $d-f2, '9 feet',                                                         '$d.in-feet';

my Distance $d-m3 ♎️ '43.3 m';
my $d-f3 = $d-m3.in( 'feet' );
is $d-f3, '142.060367 feet',                                                '$d.in-feet';

my $d-y2 = $d-m3.in( 'yards' );
is $d-y2, '47.353456 yards',                                                '$d.in-yards';

my Distance $d-mi ♎️ '10 miles';
is $d-mi, '10 miles',                                                       '$d.in-miles';
my $d-f = $d-mi.in( 'feet' );
is $d-f, '52800 feet',                                                      '$d.in-feet';
my $d-m = $d-mi.in( 'm' );
is $d-m, '16093.44 m',                                                      '$d.in-m';

my Distance $d-mi2 ♎️ '1 miles';
my $d-y3 = $d-mi2.in( 'yards' );
is $d-y3, '1760 yards',                                                     '$d.in-yards';

my Temperature $deg-c ♎️ '39 °C';
is $deg-c, '39 °C',                                                         '$t.in-C';

my $deg-k = $deg-c.in( 'K' );
is $deg-k, '312.15 K',                                                      '$t.in-K';
    
my $deg-cr = $deg-k.in( '°C' );
is $deg-cr, '39 °C',                                                        '$t.in-C';

my Temperature $deg-k2 ♎️ '300 K'; 
is $deg-k2, '300 K',                                                        '$t.in-K';

my $deg-f = $deg-k2.in( '°F' );
is $deg-f, '80.33 °F',                                                      '$t.in-F';
    
my $deg-k2r = $deg-f.in( 'K' );
is $deg-k2r, '300 K',                                                       '$t.in-K';
    
my Temperature $deg-f2 ♎️ '98.6 °F';
is $deg-f2, '98.6 °F',                                                      '$t.in-F';

my $deg-c2 = $deg-f2.in( '°C' );
is $deg-c2, '37 °C',                                                        '$t.in-C';
    
my $deg-f2r = $deg-c2.in( '°F' );
is $deg-f2r, '98.6 °F',                                                     '$t.in-F';

#Conversion of high order Units such as Area, Volume, etc. also uses .in()

my Distance $d ♎️ '5e1 m';
my Area $am2 = $d * $d;
is $am2, '2500 m2',                                                         '$a.in-m2';

my Area $a-m21 ♎️ '42 m2';
is $a-m21, '42 m2',                                                         '$a.new';

say "---------";
say "d=fe is $d-fe";
my Area $af2 = $d-fe * $d-fe;
is $af2, '144 feet2',                                                       '$a.$d*$d';

my Area $a-f21 ♎️ '36 feet2';
is $a-f21, '36 feet2',                                                      '$a.new-feet2';

my $a-f22 = $a-m21.in( 'feet2' );
is $a-f22, '452.084238 feet2',                                              '$a.in-feet2';

my Volume $v-y31 ♎️ '7 yards3';
is $v-y31, '7 yards3',                                                      '$v.new-yards3';

my $v-m31 = $v-y31.in( 'm3' );
is $v-m31, '5.35188400589 m3',                                              '$v.in-m3';

my $v-y32 = $v-m31.in( 'yards3' );
is $v-y32, '7 yards3',                                                      '$v.in-yards3';

my Volume $v-l1 ♎️ '6 l';
is $v-l1, '6 l',                                                            '$v.new-l';

my $v-y33 = $v-l1.in( 'yards3' );
is $v-y33, '0.0078477037 yards3',                                           '$v.in-yards3';

my $v-l2 = $v-y33.in( 'l' );
is $v-l2, '6 l',                                                            '$v.in-l';

#Conversion of inverse order Units such as Frequency, etc. also uses .in()
my Frequency $f-h1 ♎️ '78 Hz';
is $f-h1.WHAT, (Frequency),                                                 '$f.WHAT';
is $f-h1, '78 Hz',                                                          '$f.new';

my $f-c1 = $f-h1.in( 'cycles' );
is $f-c1, '78 cycles',                                                      '$f.in-cycles';

my $f-h2 = $f-c1.in( 'Hz' );
is $f-h2, '78 Hz',                                                          '$f.in-Hz';

my Time $t-s1 ♎️ '30 s';
is $t-s1, '30 s',                                                           '$t.new';

my $t-s2 = $t-s1 + 28;
is $t-s2, '58 s',                                                           '$t.add-R';

my $t-m1 = $t-s1.in( 'mins' );
is $t-m1, '0.5 mins',                                                       '$t.in-mins';

my Measure $m-s1 ♎️ '30 s1';
is $m-s1, '30 s',                                                           '$t.new-strip1';

my $m-h12 = $m-s1.in( 'hours1' );
is $m-h12, '0.00833333333333333 hours',                                     '$t.in-hours';

my $m-s12 = $m-h12.in( 's1' );
is $m-s12, '30 s',                                                          '$t.in-strip';

my Measure $m-s2 ♎️ '30 s2';
is $m-s2, '30 s2',                                                          '$M.new-s2';

my $m-h22 = $m-s2.in( 'hours2' );
is $m-h22, '0.0000023 hours2',                                              '$M.in-hours2';

my $m-h2 = $m-h22.in( 's2' );
is $m-h2, '30 s2',                                                          '$M.in-s2';

my Measure $m-hm1 ♎️ '30 hours-1';
is $m-hm1, '30 hours-1',                                                    '$M.new-hours-1';

my Measure $m-sm1 ♎️ '30 s-1';
is $m-sm1, '30 s-1',                                                        '$M.new-s-1';

my Frequency $m-h2m1;
$m-h2m1 = $m-sm1.in( 'hours-1' );
is $m-h2m1, '108000 hours-1',                                               '$F.in-hours-1';

my $m-s2m1 = $m-h2m1.in( 's-1' );
is $m-s2m1, '30 s-1',                                                       '$f.in-s-1';

my Measure $m-hm2 ♎️ '30 hours-2';
is $m-hm2, '30 hours-2',                                                    '$t-2.hours-2';

my Measure $m-sm2 ♎️ '30 s-2';
is $m-sm2, '30 s-2',                                                        '$t-2.s-2';

my $m-h2m2 = $m-sm2.in( 'hours-2' );
is $m-h2m2, '388800000 hours-2',                                            '$t-2.in-hours-2';

my $m-s3m2 = $m-h2m2.in( 's-2' );
is $m-s3m2, '30 s-2',                                                       '$t-2.in-s-2';    

my Force $fo1 ♎️ '27 kg.m.s-2';
my $fo2 = $fo1.in( 'N' );
is $fo2, '27 N',                                                            '$fo1.in-N';
    
#done-testing
#
