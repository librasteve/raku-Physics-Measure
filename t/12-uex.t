#!/usr/bin/env raku
#t/12-uex.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 10;

use Physics::UnitEx;
use Physics::Measure;

my $l = 1km;
is ~$l,'1 km',																'km';
is $l.^name,'Physics::Measure::Length',										'Length';

my $t = 1ms;
is ~$t,'1 ms',																'ms';
is $t.^name,'Physics::Measure::Time',										'Time';

my $s = $l/$t;
is ~$s,'1000000 m/s',														'm/s';
is $s.^name,'Physics::Measure::Speed',										'Speed';

my $f = $l.in: <ft>;
is ~$f,'3280.839895 ft',													'ft';
is $f.^name,'Physics::Measure::Length',										'.in';

my $m = 1kg;
is ~$m,'1 kg',																'kg';
is $m.^name,'Physics::Measure::Mass',										'Mass';

#done-testing;

