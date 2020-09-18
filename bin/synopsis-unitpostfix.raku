#!/usr/bin/env raku 
use lib '../lib';
use Physics::Measure;
use Physics::UnitPostfix;

my $l = 1km;			say ~$l;
my $t = 1ms;			say ~$t;
my $s = $l/$t;			say ~$s;
my $f = $l.in: <ft>;	say ~$f;
my $m = 1kg;			say ~$m;
my $c = 17cm;			say ~$c;
my $a-d = 7°;			say ~$a-d;
my $a-m = 7′;			say ~$a-m;
my $a-s = 7″;			say ~$a-s;

