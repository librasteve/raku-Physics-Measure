#!/usr/bin/env perl6
#t/01-new.t 
#TESTALL$ prove -e "perl6" ./t      [from root]
use v6;
use lib 'lib';
use lib '../lib';
use Test;
plan 33; 

use Physics::Measure;
use Physics::Measure::Unit;
use Physics::Measure::Lang;

#Part 1: Default new Constructor

my Unit $u .=new(name => 'm');
is $u.name,'m',           '$u.name exists'; 
is $u.unitsof,'Distance', '$u.unitsof made'; 

my Distance $a .=new(value => 1e4, units => $u);
my Distance $b .=new(value => 42);
my Distance $c .=new();
my Distance $d;

say "a.value is " ~ $a.value;
say "a.value is " ~ $a.value.Str;

#all params
is $a.WHAT,   Distance,   '$a.WHAT';
ok $a.value == 1e4,       '$a.value';
is $a.units.name,'m',     '$a.units';

#one param
is $b.WHAT,   Distance,   '$b.WHAT';
is $b.defined,True,       '$b.defined';
ok $b.value == 42,        '$b.value';
is $b.units.name,'m',     '$b.units';
#is $b.units,  'm',        '$b.units';

#no params
is $c.WHAT,   Distance,   '$c.WHAT';
is $c.defined,True,       '$c.defined';
is $c.value,  Real,       '$c.value';
is $c.units,  'm',        '$c.units';

#declaration only
is $d.WHAT,   Distance,   '$d.WHAT';
is $d.defined,False,      '$d.defined';

#Part 2: Custom new Constructor multis

my Distance $e .= new: '1e1 m';
my Distance $f .= new: $e;
my Distance $g .= new: 4e2;

ok $e.value == 10e0,      '$e.value';
is $e.units,  'm',        '$e.units';
ok $f.value == 1e1,       '$f.value';
is $f.units,  'm',        '$f.units';
ok $g.value == 400e0,     '$g.value';
is $g.units,  'm',        '$g.units';

my Distance $d-lib ♎️ '5e1 m';
is $d-lib, '50 m',        '$d-lib.libra';
my Distance $e-lib ♎️ $a;
is $e-lib, '10000 m',         '$e-lib.libra';

my Distance $d-tex libra '5e1 m';
is $d-tex, '50 m',            '$d-tex.texas';
my Distance $e-tex libra $a;
is $e-tex, '10000 m',         '$e-tex.texas';

#Part 3: Untyped declarations - inferring type from rhs

my $h-lib ♎️ '5e1 m';
is $h-lib, '50 m',            '$h-lib.libra';
is $h-lib.WHAT,   Distance,   '$h.WHAT';

my $i-lib ♎️ '0.001 s';
is $i-lib, '0.001 s',         '$i-lib.libra';
is $i-lib.WHAT,   Time,       '$i.WHAT';

my $h-tex libra '5e1 m';
is $h-tex, '50 m',            '$h-tex.libra';
is $h-tex.WHAT,   Distance,   '$h.WHAT';

my $i-tex libra '0.001 s';
is $i-tex, '0.001 s',         '$i-tex.libra';
is $i-tex.WHAT,   Time,       '$i.WHAT';

#done-testing

