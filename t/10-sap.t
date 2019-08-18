#!/usr/bin/env perl6
#t/10-sap.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 26; 

use Physics::Measure;
use Physics::Measure::Unit;

my $a0 ♎️ '4.3 m';
is $a0, '4.3 m',                                                        '$a0-m';
is $a0.units.base-name, 'm',                                            '$a0-base-name';
is $a0.units.plur-name, Str,                                            '$a0-plur-name';
is $a0.units.sing-name, Str,                                            '$a0-sing-name';

my $a1 ♎️ '4.3 metres';
is $a1, '4.3 metres',                                                   '$a1-metres';
is $a1.units.base-name, 'm',                                            '$a1-base-name';
is $a1.units.plur-name, 'metres',                                       '$a1-plur-name';
is $a1.units.sing-name, 'metre',                                        '$a1-sing-name';

my $a2 = $a1.norm;
is $a2, '4.3 m',                                                        '$a2-norm-metres';

my $a3 ♎️ '3 Newtons';
is $a3, '3 Newtons',                                                    '$a3-Newtons';
is $a3.WHAT, Force,                                                     '$a3-WHAT';

my $a4 = $a3.norm;
is $a4, '3 N',                                                          '$a4-norm-Newtons';
is $a4.WHAT, Force,                                                     '$a4-WHAT';

my $a5 ♎️ '5 kg m / s^2';
is $a5, '5 kg m / s^2',                                                 '$a5-5 kg m / s^2';
is $a5.WHAT, Force,                                                     '$a5-WHAT';

my $a6 = $a5.norm;
is $a6, '5 N',                                                          '$a6-norm-Newtons';
is $a6.WHAT, Force,                                                     '$a6-WHAT';

my $r1 = $a3 + $a5;
is $r1, '8 N',                                                          '$r1-add-mixed';
is $r1.WHAT, Force,                                                     '$r1-WHAT';

my $r2 = $a3 - $a5;
is $r2, '-2 N',                                                         '$r2-sub-mixed';

my $r3 = $a3 * $a1;
is $r3, '12.9 Newtons.metres',                                          '$r3-mul-mixed';
is $r3.WHAT, Energy,                                                    '$r3-WHAT';

my $r3n = $r3.norm;
is $r3n, '12.9 J',                                                      '$r3-norm-mul-mixed';

my $a7 ♎️ '10 s';
my $r4 = $r3 * $a7;
is $r4, '129 Newtons.metres.s',                                         '$r4-mul-mixed';

#`[[ #FIXME cannot work out how (or whether) to normalize from Newtons.metres.s to J.s
my $r4n = $r4.norm;
is $r4n, '129 J.s',                                                     '$r4n-norm-mul-mixed';
#]]

my $r5 = $r3 / $a7;
is $r5, '1.29 Newtons.metres.s-1',                                     '$r5-div-mixed';
is $r5.norm, '1.29 W',                                                 '$r5-norm-div-mixed';

#done-testing;

