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
my $y ♎️ '5e1 km';		say ~$y;
my $x = Measure.new(value => 21.006, units => 'μl'); say ~$x;
