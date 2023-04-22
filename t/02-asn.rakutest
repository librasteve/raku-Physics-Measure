#!/usr/bin/env raku
#t/02-asn.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 11;

use Physics::Measure;

my $u  = GetMeaUnit('m');                  #get Unit object to construct a Measure
my Length $a .=new(value => 1e4, units => $u);

is $a.WHAT,   Length,              'ass:2xdef';
ok $a.value == 10000,              'ass:2xdef';
is $a.units.name, 'm',             'ass:2xdef';

my Length $b = ♎️ '5e1 m';
my Length $c = $a;

is $b.WHAT,   Length,              'ass:lunit:rstr';
ok $b.value == 50e0,               'ass:lunit:rstr';
is $b.units.name, 'm',             'ass:lunit:rstr';

is $c.WHAT,   Length,              'ass:lunit:rmea';
ok $c.value == 10000e0,            'ass:lunit:rmea';
is $c.units.name, 'm',             'ass:lunit:rmea';

$b = ♎️ '3e1 m';
ok $b.value == 3e1,                'ass:lunit:rstr';

$b = libra '3e1 m';
ok $b.value == 3e1,                'ass:libra:rstr';

# done-testing;

