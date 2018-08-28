#!/usr/bin/env perl6
#t/04-uni.t 
#TESTALL$ prove -e "perl6" ./t      [from root]
use v6;
use lib 'lib';
use lib '../lib';
use Test;
plan 26;

use Physics::Measure;
use Physics::Unit;

my Unit $u     .=new(name => 'm');                  #get Unit object to construct a Measure
my Distance $a .=new(value => 1e4, units => $u);

ok $a.value == 10000,                                                       '$a.value';
is $a.units.name, 'm',                                                      '$a.units';

my $i1 = DateTime.now;
my $i2 = DateTime.new( '2017-08-10T14:15:27.26Z' );
my $i3 = DateTime.new( '2017-08-10T14:15:37.26Z' );
my Duration $dur = $i3-$i2;

my Unit $v  .=new(name => 's', unitsof => 'Time');
my Time $t1 .=new(value => $dur, units => $v);    #'10 s'

ok $dur == 10,                                                              'dur';
is $t1.units.name, 's',                                                     '$t.units';
is "$t1", '10 s',                                                           '$t.Str';

ok $t1.Duration == 10,                                                      '$t.Duration';
ok $t1.Real == 10,                                                          '$t.Real';

my Time $t2 ♎️ '5e1 s';      #'50 s'
is $t2, '50 s',                                                             '$t.default-S';
my Time $t3 ♎️ $t1;          #'10 s'
is $t3, '10 s',                                                             '$t.default-M';
my Time $t4 ♎️ 172;          #'10 s'
is $t4, '172 s',                                                            '$t.default-R';
my Time $t5 ♎️ '3e1 s';      #'30 s'
is $t5, '30 s',                                                             '$t.assign-S';
my Time $t6 ♎️ 42;           #'42 s'
is $t6, '42 s',                                                             '$t.assign-R';

my $t7 = $t1 + $t2;         #60 s
is $t7, '60 s',                                                             '$t.add-T';
my $t8 = $t3 - $t4;         #-162 s
is $t8, '-162 s',                                                           '$t-sub-T';
my Duration $d8 = $t8.Duration;
is $d8, -162,                                                               '$t-get Duration';
my Time $t9 ♎️ 42;
$t9.Duration( $dur );
is $t9.Duration, 10,                                                        '$t-set Duration';
$t9.value = 5e1;
is $t9.value, 50,                                                           '$t-get value';
is $t9.Real, 50,                                                            '$t-get Real';
is $t9.Str, '50 s',                                                         '$t-get Str';
my Time $t10 ♎️ '2 hours';
is $t10, '2 hours',                                                         '$t.units';

#Speed = Distance / Time
my Speed $s1;
my Unit $su1 .=new( name=>'m/s', unitsof => 'Speed' );
$s1 .=new( value => 14, units => $su1 );
is "$s1", '14 m/s',                                                         '$s.named';

my Speed $s2;
$s2 ♎️ $s1;
is "$s2", '14 m/s',                                                         '$s.assign-M';
my Speed $s3 ♎️ '17.234 m/s';
is "$s3", '17.234 m/s',                                                     '$s.assign-S';

my Distance $d ♎️ '5e1 m';      #'50 m'
$s2 = $d / $t6;
is "$s2", '1.19047619047619 m.s-1',                                         'div.mixed';
#is "$s2", '1.19047619047619 m/s',                                         'div.mixed';

my $x = $d * $d;
say $x.perl;
is "$x", '2500 m2',                                                         'mul.same';
is $x.WHAT, (Physics::Measure::Area),                                       'mul.type';
# this should fail $s1 = $d * $d;


#done-testing

