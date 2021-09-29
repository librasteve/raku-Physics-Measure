#!/usr/bin/env raku
#t/13-nrm.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 6;

use Physics::Measure :ALL;

my \Em = 9.109_383_7015e-31kg ±0.000_000_0028e-31;
is ~Em.norm, '0.0009109383701500001yg ±2.8000000000000007e-13',     '± ~Em,norm';

my \Xh = 9.109_383_7015e-31m ±0.000_000_0028e-31;
is ~Xh.norm, '9.1093837015e-07ym ±2.8e-16',                         '± ~Xh lower';

my \Xl = 9109_383_7015e30kg ±28e30;
is ~Xl.norm, '9.1093837015e+19Yg ±28000000000.000004',              '± ~Xh lower';

$Physics::Measure::round-to = 0.01;

my $c = ♎️ '299792458 m/s';
my $ℎ = ♎️ '6.626070015e-34 J.s';

my \λ = 2.5nm; 
is ~λ, '2.5nm',									'~λ';

my \ν = $c / λ;  
is ~ν.norm, '119.92PHz',						'~ν.norm';

my \Ep = $ℎ * ν;  
is ~Ep.norm, '79.46aJ',						    '~Ep.norm';

#done-testing;
