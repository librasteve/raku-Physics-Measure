#t/06-com.t 
#TESTALL$ prove -e "perl6" ./t      [from root]
use v6;
use lib 'lib';
use lib '../lib';
use Test;
plan 43; 

use Physics::Measure;
use Physics::Unit;

my Speed $s-mph1 ♎️ '17 miles/hours';
is $s-mph1, '17 miles/hours',                                                   '$s-mph1';
 
my Speed $s-ms1 ♎️ '42 m/s';
is $s-ms1, '42 m/s',                                                            '$s-ms1';

my $s-mph2 = $s-ms1.in( 'miles/hours' );
is $s-mph2, '93.951324 miles/hours',                                            '$s-mph2';

my $s-ms12 = $s-mph2.in( 'm/s' );
is $s-ms12, '42 m/s',                                                           '$s-ms12'; 

my Speed $s-fpm1 ♎️ '78 feet/mins';
is $s-fpm1, '78 feet/mins',                                                     '$s-fpm1';

my Speed $s-mph3 = $s-fpm1.in( 'miles/hours' );
is $s-mph3, '0.886364 miles/hours',                                             '$s-mph3';    

my $f3pm ♎️ '32 feet3.mins-1';
is $f3pm, '32 feet3.mins-1',                                                    '$f3pm';
is $f3pm.WHAT, (Measure),                                                       '$f3pm-WHAT';

my Distance $a ♎️ '4.3 m';      #'4.3 m'
my Distance $b ♎️ -2.3;         #'-2.3 m'

my $x2 = $a * $b;
is $x2, '-9.89 m2',                                                             '$x2-m2';

my $x3 = $a * $b * $b;
is $x3, '22.747 m3',                                                            '$x3-m3'; 

my $d ♎️ '5e1 m';
my Time $t6 ♎️ 42;
my Speed $sp = $d / $t6;
is $sp, '1.19047619047619 m.s-1',                                               '$sp-m.s-1';

my Acceleration $dsdt = $sp / $t6;
is $dsdt, '0.0283446712018141 m.s-2',                                           '$dsdt-m.s-2'; 

my Acceleration $dsdt2 ♎️ '9.8 m/s^2';
is $dsdt2, '9.8 m/s^2',                                                         '$dsdt2-m/s^2';

my Distance $d-fe ♎️ '12.0 feet';
my $d-fe2 = $d-fe * $d-fe;
is $d-fe2, '144 feet2',                                                         '$d-fe2-feet2';

my $d-fe3 = $d-fe * $d-fe2;
is $d-fe3, '1728 feet3',                                                        '$d-fe3-feet3';

my Speed $s-fe = $d-fe / $t6;
is $s-fe, '0.285714 feet.s-1',                                                  '$s-fe-feet.s-1';

my $nudi = $x2 / $a;
is $nudi, '-2.3 m',                                                             '$nudi';

my $adia = $x2 / $x2;
is $adia, '1',                                                                  '$adia';

my $inv6 = 1 / $t6;
#is $inv6, '0.023810 s-1',                                                       '$inv6'; #not Hz?
is $inv6, '0.023810 Hz',                                                       '$inv6'; #not Hz?
is $inv6.WHAT, (Frequency),                                                     '$inv6-WHAT';

my Force $fo1 ♎️ '7 N';
is $fo1, '7 N',                                                                 '$fo1-N';

my Force $fo2 ♎️ '27 kg m / s^2';
is $fo2, '27 kg m / s^2',                                                       '$fo2-kg m / s^2';

my Force $fo3 ♎️ '58 kg.m.s-2';
is $fo3, '58 kg.m.s-2',                                                         '$fo3-kg.m.s-2';

$fo1 = $fo2 + $fo3;
is $fo1, '85 N',                                                                '$fo1-add-N';

$fo1 = $fo2 - $fo3;
is $fo1, '-31 N',                                                               '$fo1-sub-N';

my Energy $en1 ♎️ '7 J';
is $en1, '7 J',                                                                 '$en1-J'; 

my Energy $en2 ♎️ '26 kg m^2 / s^2';
is $en2, '26 kg m^2 / s^2',                                                     '$en2-kg m^2 / s^2';

my Power $po1 ♎️ '7 W';
is $po1, '7 W',                                                                 '$po1-W';

my Power $po2 ♎️ '27 kg m^2 / s^3',
is $po2, '27 kg m^2 / s^3',                                                     '$po2-kg m^2 / s^3';

my $en3 = $po2 * $t6;
is $en3, '1134 m2.kg.s-2',                                                      '$en3-m2.kg.s-2'; 

my $en4 = $en3.norm;
is $en4, '1134 J',                                                              '$en4-J';

my $fo4 = $en2 * $a;
is $fo4, '111.8 m3.kg.s-2',                                                     '$fo4-m3.kg.s-2';
is $fo4.WHAT, Physics::Measure::Measure,                                        '$fo4-WHAT';
is $fo4.units.unitsof, '🌀Volume.Mass.Time-2',                                  '$fo4-unitsof';

my $mo2 ♎️ '27 kg .m.s -1  ';
is "$mo2", '27 kg .m.s -1',                                                     '$mo2-kg .m.s -1';
is $mo2.WHAT, Physics::Measure::Momentum,                                       '$mo2-WHAT';

my $fo5 = $mo2 / $t6;
is $fo5, '0.642857 kg.m.s-2',                                                   '$fo5-kg.m.s-2';
is $fo5.norm, '0.642857 N',                                                     '$fo5.norm';

my $sm ♎️ '70 mph';
is $sm, '70 mph',                                                               '$sm-mph';
is $sm.WHAT, Physics::Measure::Speed,                                           '$sm-WHAT';
my $sms = $sm.in( 'm/s' );
is $sms, '31.2928 m/s',                                                         '$sms-m/s';

my $t1 ♎️ '10 s';
my $t2 ♎️ '2 hours';
my $t3 = $t1 + $t2;         #   
is $t3, '7210 s',                                                               '$t-add.diff';

my $dn1 ♎️ '2 m';
my $dn2 ♎️ '3 feet';
my $dn3 = $dn1 + $dn2;
is $dn3, '2.9144 m',                                                            '$dn-add.diff';

#done-testing;

