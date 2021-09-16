#!/usr/bin/env raku
#t/13-nrm.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 3;

#`[[
FIXME test corner cases
- name both PHz and petahertz (maybe subst?)
- check crossing 1
- check guardrails
- add autonorm (check use of bless)
#]]

use Physics::Measure :ALL;
$Physics::Measure::round-to = 0.01;

my $c ♎️ '299792458 m/s';
my $ℎ ♎️ '6.626070015e-34 J.s';

my \λ = 2.5nm; 
is ~λ, '2.5 nm',									'~λ';

my \ν = $c / λ;  
is ~ν.norm, '119.92 PHz',						    '~ν.norm';

my \Ep = $ℎ * ν;  
is ~Ep.norm, '79.46 aJ',						    '~Ep.norm';

#done-testing;
