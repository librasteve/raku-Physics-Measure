#!/usr/bin/env perl6
#t/14-pwr.t 
#TESTALL$ prove -e "perl6" ./t  [from root]
use v6;
use lib 'lib';
use lib '../lib';
use Test;
plan 7;

use Physics::Measure;
use Physics::Measure::Unit;
use Physics::Measure::Lang;

my Unit $u     .=new(name => 'm');                  #get Unit object to construct a Measure
my Distance $d .=new(value => 1e4, units => $u);

my $sq1 = $d ** 2;
is $sq1,'100000000 m2',                                                          '**.square';

my $cu1 = $d ** 3;
is $cu1,'1000000000000 m3',                                                      '**.cube';

my $fo1 = $d ** 4;
is $fo1,'1e+16 m4',                                                              '**.fourth';

my $sr1 = $sq1 ** <1/2>;
is $sr1,'10000 m',                                                                '**.sqrt';

my $cr1 = $cu1 ** <1/3>;
is $cr1,'10000 m',                                                                '**.curt';

my $fr1 = $fo1 ** <1/4>;
is $fr1,'10000 m',                                                                '**.fort';

my $sq2 = $d ** 2;
is $sq2.sqrt, '10000 m',                                                          'sqrt.sqrt';

#done-testing;

