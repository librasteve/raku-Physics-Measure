#!/usr/bin/env raku
#t/06-com.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 37; 

use Physics::Measure;

my Speed $s-mph1 = ♎️ '17 miles/hours';
is ~$s-mph1, '17miles/hours',                                                   '$s-mph1';
 
my Speed $s-ms1 = ♎️ '42 m/s';
is ~$s-ms1, '42m/s',                                                            '$s-ms1';

my $s-mph2 = $s-ms1.in( 'miles/hours' );
is ~$s-mph2, '93.951324miles/hours',                                            '$s-mph2';

my $s-ms12 = $s-mph2.in( 'm/s' );
is ~$s-ms12, '42m/s',                                                           '$s-ms12';

my Speed $s-fpm1 = ♎️ '78 feet/mins';
is ~$s-fpm1, '78feet/mins',                                                     '$s-fpm1';

my Speed $s-mph3 = $s-fpm1.in( 'miles/hours' );
is ~$s-mph3, '0.886364miles/hours',                                             '$s-mph3';

my Length $a = ♎️ '4.3 m';      #'4.3 m'
my Length $b = ♎️ '-2.3m';      #'-2.3 m'

my $x2 = $a * $b;
is ~$x2, '-9.89m^2',                                                            '$x2-m2';

my $x3 = $a * $b * $b;
is ~$x3, '22.747m^3',                                                           '$x3-m3';

my $d = ♎️ '5e1 m';
my Time $t6 = ♎️ '42s';
my Speed $sp = $d / $t6;
is ~$sp, '1.1904761904761905m/s',                                               '$sp-m.s-1';

my Acceleration $dsdt = $sp / $t6;
is ~$dsdt, '0.02834467120181406m/s^2',                                          '$dsdt-m.s-2';

my Acceleration $dsdt2 = ♎️ '9.8 m/s^2';
is ~$dsdt2, '9.8m/s^2',                                                         '$dsdt2-m/s^2';

#`[FIXME - fails]
my Length $d-fe = ♎️ '12.0 feet';
my $d-fe2 = ($d-fe * $d-fe).in('sq ft');
is ~$d-fe2, '144sq ft',                                                         '$d-fe2-feet2';

#`[FIXME - fails]
my $d-fe3 = ($d-fe * $d-fe2).in('cubic ft');
is ~$d-fe3, '1728cubic ft',                                                     '$d-fe3-feet3';

my Speed $s-fe = ($d-fe / $t6).in('ft/s');
is ~$s-fe, '0.285714ft/s',                                                      '$s-fe-feet.s-1';

my $nudi = $x2 / $a;
is ~$nudi, '-2.3m',                                                             '$nudi';

my $adia = $x2 / $x2;
is ~$adia, '1①',                                                                '$adia';

my $inv6 = 1 / $t6;
is ~$inv6, '0.02381Hz',                                                         '$inv6';
is $inv6.WHAT, (Frequency),                                                     '$inv6-WHAT';

my Force $fo1 = ♎️ '7 N';
is ~$fo1, '7N',                                                                 '$fo1-N';

my Force $fo2 = ♎️ '27 kg m / s^2';
is ~$fo2, '27N',		                                                        '$fo2-N';

my Force $fo3 = ♎️ '58 kg * m * s^-2';
is ~$fo3, '58N',															    '$fo3-N';

$fo1 = $fo2 + $fo3;
is ~$fo1, '85N',                                                                '$fo1-add-N';

$fo1 = $fo2 - $fo3;
is ~$fo1, '-31N',                                                               '$fo1-sub-N';

my Energy $en1 = ♎️ '7 J';
is ~$en1, '7J',                                                                 '$en1-J';

my Energy $en2 = ♎️ '26 kg m^2 / s^2';
is ~$en2, '26J',		                                                        '$en2-J';

my Power $po1 = ♎️ '7 W';
is ~$po1, '7W',                                                                 '$po1-W';

my Power $po2 = ♎️ '27 kg m^2 / s^3',
is ~$po2, '27W',		                                                        '$po2-W';

my $en3 = $po2 * $t6;
is ~$en3, '1134J',																'$en3-J';

my $en4 = $en3.rebase;
is ~$en4, '1134J',                                                              '$en4-J';

my $mo1 = ♎️ '27 kg m/s';

my $mo2 = ♎️ '27 kg m s^ -1  ';
is "$mo2", '27kg m/s',		                                                    '$mo2-kg m/s';
is $mo2.WHAT, Physics::Measure::Momentum,                                       '$mo2-WHAT';

my $fo5 = $mo2 / $t6;
is ~$fo5, '0.642857N',													        '$fo5-N';

my $sm = ♎️ '70 mph';
is ~$sm, '70mph',                                                               '$sm-mph';
is $sm.WHAT, Physics::Measure::Speed,                                           '$sm-WHAT';
my $sms = $sm.in( 'm/s' );
is ~$sms, '31.2928m/s',                                                         '$sms-m/s';

my $t1 = ♎️ '10 s';
my $t2 = ♎️ '2 hours';
my $t3 = $t1 + $t2;         #   
is ~$t3, '7210s',                                                               '$t-add.diff';

my $dn1 = ♎️ '2 m';
my $dn2 = ♎️ '3 feet';
my $dn3 = $dn1 + $dn2;
is ~$dn3, '2.9144m',                                                            '$dn-add.diff';

#done-testing;

