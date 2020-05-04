#!/usr/bin/env raku
#t/10-sap.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 19; 

use Physics::Measure;
use Physics::Unit;

my $a0 ♎️ '4.3 m';
is $a0, '4.3 m',                                                        '$a0-m';

my $a1 ♎️ '4.3 metres';
is $a1, '4.3 m',	                                                    '$a1-metres';

my $a2 = $a1.rebase;
is $a2, '4.3 m',                                                        '$a2-rebase-metres';

my $a3 ♎️ '3 newtons';
is $a3, '3 N',		                                                    '$a3-Newtons';
is $a3.WHAT, Force,                                                     '$a3-WHAT';

my $a4 = $a3.rebase;
is $a4, '3 N',                                                          '$a4-rebase-Newtons';
is $a4.WHAT, Force,                                                     '$a4-WHAT';

my $a5 ♎️ '5 kg m / s^2';
is $a5, '5 N',		                                                    '$a5-5 kg m / s^2';
is $a5.WHAT, Force,                                                     '$a5-WHAT';

my $a6 = $a5.rebase;
is $a6, '5 N',                                                          '$a6-rebase-Newtons';
is $a6.WHAT, Force,                                                     '$a6-WHAT';

my $r1 = $a3 + $a5;
is $r1, '8 N',                                                          '$r1-add-mixed';
is $r1.WHAT, Force,                                                     '$r1-WHAT';

my $r2 = $a3 - $a5;
is $r2, '-2 N',                                                         '$r2-sub-mixed';

my $r3 = $a3 * $a1;
is $r3, '12.9 J',			                                            '$r3-mul-mixed';
is $r3.WHAT, Energy,                                                    '$r3-WHAT';

my $r3n = $r3.rebase;
is $r3n, '12.9 J',                                                      '$r3-rebase-mul-mixed';

my $a7 ♎️ '10 s';
my $r4 = $r3 * $a7;
is $r4, '129 kg m^2/s',			                                        '$r4-mul-mixed';

my $r5 = $r3 / $a7;
is $r5, '1.29 W',				                                        '$r5-div-mixed';

#done-testing;

