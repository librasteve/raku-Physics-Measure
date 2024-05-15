#!/usr/bin/env raku
use lib '../lib';
use Physics::Unit;
use Physics::Measure :ALL;

use Test;

my $d = 42m;
my $t = 21s;

my $id = Measure.unit-find( '1 / m' );     # FIXME
class iddy is Measure {}
$id.type-bind('iddy');


my $im = 37.0 / $d;


ok $im.value == <37/42>,         'div:R/M';
is $im.units.name, '1 / m',      'units.name';


#say my Length $x = Length.new(units => 'm', value => 42);

