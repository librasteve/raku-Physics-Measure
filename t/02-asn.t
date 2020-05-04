#!/usr/bin/env raku
#t/02-asn.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 15;

use Physics::Measure;
use Physics::Unit;

my Unit   $u  = GetUnit('m');                  #get Unit object to construct a Measure
my Length $a .=new(value => 1e4, units => $u);

is $a.WHAT,   Length,              'ass:2xdef';
ok $a.value == 10000,              'ass:2xdef';
is $a.units.name, 'm',             'ass:2xdef';

my Length $b ♎️ '5e1 m';
my Length $c ♎️  $a;

is $b.WHAT,   Length,              'ass:luninit:rstr';
ok $b.value == 50e0,               'ass:luninit:rstr';
is $b.units.name, 'm',             'ass:luninit:rstr';

is $c.WHAT,   Length,              'ass:luninit:rreal';
ok $c.value == 10000e0,            'ass:luninit:rreal';
is $c.units.name, 'm',             'ass:luninit:rreal';

$b ♎️ '3e1 m'; 
ok $b.value == 3e1,                'ass:luninit:rstr';
$b ♎️ 98;
ok $b.value == 98,                 'ass:luninit:rstr';

$b libra '3e1 m';
ok $b.value == 3e1,                'ass:libra:rstr';
$b libra 98;  
ok $b.value == 98,                 'ass:libra:rstr';

ok $b.Str eq '98 m',               'coerce:Str';
ok $b.Real ==  98 ,                'coerce:Real';

#done-testing;

