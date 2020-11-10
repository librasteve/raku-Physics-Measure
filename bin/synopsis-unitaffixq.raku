#!/usr/bin/env raku 
use lib '../lib';
use Physics::UnitAffixQ;
use Physics::Measure;

#`[[
The Physics::UnitAffix module (see https://en.wikipedia.org/wiki/Affix) combines the notions of:
1. SI Prefixes e.g. c(centi-), m(milli-), k(kilo-) that make compound units such as cm, mm, kg 
2. Raku Postfixes e.g. $x++ syntax for operators which work on the preceeding value

We use the term Affix to indicate that both concepts are provided by this module:
1. Construction of the cross product of SI Prefixes (20) and SI Base (7) and Derived (20) Units
2. Declaration of the resulting ~600 Unit instances and matching Raku Postfix operators

Now you can simply go 'my $l = 1km;' to declare a new Measure with value => 1 and units => 'km'

'use Physics::UnitAffixQ;' is the QUICK variant, equivalent to 'use Physics::UnitAffix :DEFAULT;'
#]]

my $l = 1m;				say ~$l;
my $m = 1kg;			say ~$m;
my $t = 1ms;			say ~$t;
my $s = $l/$t;			say ~$s;
my $f = $l.in: <ft>;	say ~$f;
my $c = 17cm;			say ~$c;
my $a-d = 7°;			say ~$a-d;
my $y ♎️ '5e1 km';		say ~$y;
my $x = Volume.new(value => 21.006, units => 'μl'); say ~$x;
