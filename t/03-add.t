#!/usr/bin/env perl6
#t/03-add.t 
#TESTALL$ prove -e "perl6" ./t  [from root]
use v6;
use lib 'lib';
use lib '../lib';
use Test;
plan 65;

use Physics::Measure;
use Physics::Measure::Unit;

my Unit $u     .=new(name => 'm');                  #get Unit object to construct a Measure
my Distance $d .=new(value => 1e4, units => $u);
my Distance $e .=new(value => 42, units => $u);
my Distance $f .=new();

$f = $d + '42 m';
ok $f.value == 10042,                                                           'add:M+S';

$f = $d + $e;
ok $f.value == 10042,                                                           'add:M+S';

my Distance $a ♎️ '23 m'; 
my Distance $b ♎️ '42 m'; 
my Distance $c;
my Area $area;
my Rat $r;
my Measure $m;

$c = $a + $b;  
ok $a.value == 23,                                                              'add:M+S';
ok $b.value == 42,                                                              'add:M+S';
ok $c.value == 65,                                                              'add:M+S';
$c = $a + 17;
ok $a.value == 23,                                                              'add:M+R';
ok $b.value == 42,                                                              'add:M+R';
ok $c.value == 40,                                                              'add:M+R';
$c = 1.12 + $b;
ok $a.value == 23,                                                              'add:R+M';
ok $b.value == 42,                                                              'add:R+M';
ok $c.value == 43.12,                                                           'add:R+M';
$c = $a - $b;
ok $a.value == 23,                                                              'sub:M-M';
ok $b.value == 42,                                                              'sub:M-M';
ok $c.value == -19,                                                             'sub:M-M';
$c = $a - '1 m';
ok $a.value == 23,                                                              'sub:M-S';
ok $b.value == 42,                                                              'sub:M-S';
ok $c.value == 22,                                                              'sub:M-S';
$c = '1 m' - $a;
ok $a.value == 23,                                                              'sub:S-M';
ok $b.value == 42,                                                              'sub:S-M';
ok $c.value == -22,                                                             'sub:S-M';
$area = $a * $b;
ok $a.value == 23,                                                              'mul:M*M'; 
ok $b.value == 42,                                                              'mul:M*M';
ok $area.value == 966,                                                          'mul:M*M';
$area = '22 m' * $b;
ok $a.value == 23,                                                              'mul:S*M'; 
ok $b.value == 42,                                                              'mul:S*M';
ok $area.value == 924,                                                          'mul:S*M';
$c = $a * 2;
ok $a.value == 23,                                                              'mul:M*R'; 
ok $b.value == 42,                                                              'mul:M*R';
ok $c.value == 46,                                                              'mul:M*R';
$r = $a / $b;
ok $a.value == 23,                                                              'div:M/M'; 
ok $b.value == 42,                                                              'div:M/M';
ok $r == <23/42>,                                                               'div:M/M';
$c = $a / 37.0;
ok $a.value == 23,                                                              'div:M/S'; 
ok $b.value == 42,                                                              'div:M/S';
ok $c.value == <23/37>,                                                         'div:M/S';
is $c.units.name, 'm',                                                          'div:M/S';
$m = 37.0 / $b;
ok $a.value == 23,                                                              'div:R/M'; 
ok $b.value == 42,                                                              'div:R/M';
ok $m.value == <37/42>,                                                         'div:R/M';
is $m.units.name, 'm-1',                                                        'div:R/M';
$c = - $b;
ok $a.value == 23,                                                              'neg:M'; 
ok $b.value == 42,                                                              'neg:M';
ok $c.value == -42,                                                             'neg:M';
is $c.units.name, 'm',                                                          'neg:M';
$m = $b.reciprocal;
ok $a.value == 23,                                                              'inv:M'; 
ok $b.value == 42,                                                              'inv:M'; 
ok $m.value == <1/42>,                                                          'inv:M';
is $m.units.name, 'm-1',                                                        'inv:M';
$c = $b.negate;
ok $a.value == 23,                                                              'neg:M'; 
ok $b.value == -42,                                                             'neg:M';
ok $c.value == -42,                                                             'neg:M';
is $b.units.name, 'm',                                                          'neg:M';
is $c.units.name, 'm',                                                          'neg:M';
$a ♎️ '4.3 m';
$b ♎️ '42 m';
$c = - $a + $b;
ok $a.value == 4.3,                                                             '2op:M'; 
ok $b.value == 42,                                                              '2op:M';
ok $c.value == 37.7,                                                            '2op:M';
$c = - $a - $b;
ok $a.value == 4.3,                                                             '2op:M'; 
ok $b.value == 42,                                                              '2op:M';
ok $c.value == -46.3,                                                           '2op:M';
$c = - $a + - $b;
ok $a.value == 4.3,                                                             '2op:M'; 
ok $b.value == 42,                                                              '2op:M';
ok $c.value == -46.3,                                                           '2op:M';
$c = ( $a + $b ) * 30;
ok $a.value == 4.3,                                                             '3op:M'; 
ok $b.value == 42,                                                              '3op:M';
ok $c.value == 1389,                                                            '3op:M';

#done-testing;

