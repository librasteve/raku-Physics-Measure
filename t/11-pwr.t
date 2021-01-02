#!/usr/bin/env raku
#t/11-pwr.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 5;

use Physics::Measure;

my $u = GetMeaUnit('m');
my Length $d .=new(value => 1e4, units => $u);

my $sq1 = $d ** 2;
is $sq1,'100000000 m^2',                                                          '**.square';

my $cu1 = $d ** 3;
is $cu1,'1000000000000 m^3',                                                      '**.cube';

my $sr1 = $sq1 ** <1/2>;
is $sr1,'10000 m',                                                                '**.sqrt';

my $cr1 = $cu1 ** <1/3>;
##is $cr1,'10000 m',                                                                '**.curt';
is $cr1,'9999.999999999995 m',                                                    '**.curt';

my $sq2 = $d ** 2;
is $sq2.sqrt, '10000 m',                                                          'sqrt.sqrt';

#done-testing;

