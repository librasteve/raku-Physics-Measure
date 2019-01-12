#!/usr/bin/env perl6
#t/02-asn.t 
#TESTALL$ prove -e "perl6" ./t   [from root]
use v6;
use lib 'lib';
use lib '../lib';
use Test;
plan 15;

use Physics::Measure;
use Physics::Measure::Unit;
use Physics::Measure::Lang;

my Unit $u     .=new(name => 'm');                  #get Unit object to construct a Measure
my Distance $a .=new(value => 1e4, units => $u);
my Distance $b .=new(value => 42);
$b = $a; 
my Distance $c;
$c = $a; 

is $b.WHAT,   Distance,                                                         'ass:2xdef';
ok $b.value == 10000,                                                           'ass:2xdef';
is $b.units.name, 'm',                                                          'ass:2xdef';

my Distance $d ♎️ '5e1 m';
my Distance $e ♎️  $a;

is $d.WHAT,   Distance,                                                         'ass:luninit:rstr';
ok $d.value == 50e0,                                                            'ass:luninit:rstr';
is $d.units.name, 'm',                                                          'ass:luninit:rstr';
is $e.WHAT,   Distance,                                                         'ass:luninit:rreal';
ok $e.value == 10000e0,                                                         'ass:luninit:rreal';
is $e.units.name, 'm',                                                          'ass:luninit:rreal';

$d ♎️ '3e1 m'; 
ok $d.value == 3e1,                                                             'ass:luninit:rstr';
$d ♎️ 98;  
ok $d.value == 98,                                                              'ass:luninit:rstr';

$d libra '3e1 m'; 
ok $d.value == 3e1,                                                             'ass:libra:rstr';
$d libra 98;  
ok $d.value == 98,                                                              'ass:libra:rstr';

ok $d.Str eq '98 m',                                                            'coerce:Str';
ok $d.Real ==  98 ,                                                             'coerce:Real';

#done-testing;

