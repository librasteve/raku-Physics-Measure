#!/usr/bin/env raku
#t/01-new.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 21; 

use Physics::Measure;

#Part 1: Default new Constructor

my $u = GetMeaUnit( 'm' );
is $u.name,'m',           '$u.name exists'; 
is ~$u.type,'Length',	  '$u.units made'; 

my Length $a .=new(value => 1e4, units => $u);
is $a.WHAT,   Length,     '$a.WHAT';
ok $a.value == 1e4,       '$a.value';
is $a.units.name,'m',     '$a.units';

#Part 2: Custom new Constructor multis

my Length $b .= new: '1e1 m';
ok $b.value == 10e0,      '$b.value';
is $b.units,  'm',        '$b.units';

my Length $c .= new: $b;
ok $c.value == 1e1,       '$c.value';
is $c.units,  'm',        '$c.units';

my Length $d-lib ♎️ '5e1 m';
is $d-lib, '50 m',        '$d-lib.libra';
my Length $b-lib ♎️ $a;
is $b-lib, '10000 m',         '$b-lib.libra';

my Length $d-tex libra '5e1 m';
is $d-tex, '50 m',            '$d-tex.texas';
my Length $b-tex libra $a;
is $b-tex, '10000 m',         '$b-tex.texas';

#Part 3: Untyped declarations - inferring type from rhs

my $e-lib ♎️ '5e1 m';
is $e-lib, '50 m',            '$e-lib.libra';
is $e-lib.WHAT,Length,        '$e.WHAT';

my $f-lib ♎️ '0.001 s';
is $f-lib, '0.001 s',         '$f-lib.libra';
is $f-lib.WHAT,   Time,       '$f.WHAT';

my $g-tex libra '5e1 m';
is $g-tex, '50 m',            '$g-tex.libra';
is $g-tex.WHAT,   Length,   '$g.WHAT';

my $h-tex libra '0.001 s';
is $h-tex, '0.001 s',         '$h-tex.libra';
is $h-tex.WHAT,   Time,       '$h.WHAT';

#done-testing

