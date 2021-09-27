#!/usr/bin/env raku
#t/12-uax.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
#plan 17;

use Physics::Measure :ALL;

my $l = 1km;
is ~$l,'1km',																'km';
is $l.^name,'Physics::Measure::Length',										'Length';

my $t = 1ms;
is ~$t,'1ms',																'ms';
is $t.^name,'Physics::Measure::Time',										'Time';

my $s = $l/$t;
is ~$s,'1000000m/s',														'm/s';
is $s.^name,'Physics::Measure::Speed',										'Speed';

my $f = $l.in: <ft>;
is ~$f,'3280.839895ft',													'ft';
is $f.^name,'Physics::Measure::Length',										'.in';

my $m = 1kg;
is ~$m,'1kg',																'kg';
is $m.^name,'Physics::Measure::Mass',										'Mass';

my $c = 17cm;           
is ~$c,'17cm',																'cm';

#`[[FIXME - fails
my $d = 7°;
is ~$d,<7°0′0″>,															'°';
]]

my $y = ♎️ '5e1 km';
is ~$y,'50km',																'km';

my $v1 = 42μl;
is ~$v1,'42μl',															'42 μl';

my $v2 = ♎️ '91 μl';
is ~$v2,'91μl',															'91 μl';

my $x = Volume.new(value => 21.006, units => 'μl');
is ~$x,'21.006μl',															'21.006 μl';

my $z = ♎️ '18 μ';
is ~$z,'18μ',																'18 μ';

done-testing;
