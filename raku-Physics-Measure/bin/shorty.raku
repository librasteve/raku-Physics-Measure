#!/usr/bin/env raku 
use lib '../lib';
use Physics::Measure;
use Physics::ShortUnit;

my $l = 1km;
say ~$l;
say $l.WHAT; 

my $t = 1ms;
say ~$t;
say $t.WHAT; 

my $s = $l/$t;
say ~$s;
say $s.WHAT; 

my $f = $l.in: <ft>;
say ~$f;
say $f.WHAT; 

my $m = 1kg;
say ~$m;
say $m.WHAT; 

