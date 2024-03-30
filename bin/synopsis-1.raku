#!/usr/bin/env raku
use lib '../lib';
use Physics::Measure :ALL;

#see https://github.com/librasteve/raku-Physics-Measure/blob/master/README.md for explanation

my \d = 42m;				say ~d;		#42m
my \t = 10s;				say ~t;		#10s

my \u = d / t;				say ~u;		#4.2m/s
my \a = u / t;				say ~a;		#0.42m/s^2

my \m = 25kg;				say ~m;		#25kg
my \f = m * a;				say ~f;		#10.5N

my \v = u + a*t;			say ~v;		#8.4m/s
my \s = u*t + (1/2) * a * t*t;	say ~s;	#63m

my \pe = f * s;				say ~pe;	#661.5J

my \ke1 = (1/2) * m * u*u;
my \ke2 = (1/2) * m * v*v;

my \Δke = ke2 - ke1;
(pe cmp Δke).say;			#Same

#EOF
