#!/usr/bin/env raku
#t/12-uax.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 17;

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

my $c = 17cm;           
is ~$c,'17 cm',																'cm';

my $d = 7°;
is ~$d,<7°0′0″>,															'°';

my $y ♎️ '5e1 km';
is ~$y,'50 km',																'km';

my $v1 = 42μl;
is ~$v1,'42 μl',															'42 μl';

my $v2 ♎️ '91 μl';
is ~$v2,'91 μl',															'91 μl';

my $x = Volume.new(value => 21.006, units => 'μl');
is ~$x,'21.006 μl',															'21.006 μl';

my $z ♎️ '18 μ';
is ~$z,'18 μ',																'18 μ'; 

#done-testing;
