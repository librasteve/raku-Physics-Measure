#t/08-syn.t 
#TESTALL$ prove -e "perl6" ./t      [from root]
use v6;
use lib 'lib';
use lib '../lib';
use Test;
plan 16; 

use Physics::Measure;
use Physics::Unit;

#test simple +-*/ diff units 
my $d1 ♎️ '2 m';
my $d2 ♎️ '3 feet';

my $a1 = $d1 * $d2;
is $a1, '1.8288 m2',                                                            '$a-mul-mixed';

my $di1 = $d1 / $d2;
is "$di1", '2.187227',                                                          '$di1-div-mixed';

my $ad1 = $d1 + $d2;
is "$ad1", '2.9144 m',                                                          '$ad1-add-mixed';

my $su1 = $d1 - $d2;
is "$su1", '1.0856 m',                                                          '$su1-sub-mixed';

my $a2 = $d1 * $d1;
is $a2, '4 m2',                                                                 '$a2-mul-m';

my $a3 = $d2 * $d2;
is $a3, '9 feet2',                                                              '$a3-mul-feet';

#test simple +-*/ diff syn 
my $t1 ♎️ '4 hours3';
my $t2 ♎️ '5 s3';

my $tt2 = $t1 * $t1;
is $tt2, '16 hours6',                                                           '$tt2-mul-hours3';
is $tt2.units.unitsof, '🌀Time6',                                               '$tt2-WHAT';

my $tt3 = $t2 * $t2;
is $tt3, '25 s6',                                                               '$tt3-mul-s3';
is $tt3.units.unitsof, '🌀Time6',                                               '$tt3-WHAT';

#test compound w syn - not supported as no general way to define type base for synth unitsof 

#test compound wo syn 
my $x2 ♎️ '3 m.s-1';
is $x2.WHAT, Physics::Measure::Speed,                                           '$x2-WHAT';

my $y2 ♎️ '4 feet.mins-1';
is $y2.WHAT, Physics::Measure::Speed,                                           '$y2-WHAT';

my $z2;
$z2 = $x2 * $y2;
is $z2, '0.06096 m2.s-2',                                                       '$z2-mul-m.s-1*feet.mins-1';

$z2 = $x2 / $y2;
is $z2, '147.637795',                                                           '$z2-div-m.s-1/feet.mins-1';

$z2 = $x2 + $y2;
is $z2, '3.02032 m/s',                                                          '$z2-add-m.s-1+feet.mins-1';

$z2 = $x2 - $y2;
is $z2, '2.97968 m/s',                                                          '$z2-sub-m.s-1+feet.mins-1';


#done-testing;

