#!/usr/bin/env perl6
#t/09-cmp.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 17; 

use Physics::Measure;
use Physics::Measure::Unit;

my $a ♎️ '4.3 m';
my $c = $a;
is $a cmp $c, Order::Same,                                                      '$a cmp $c';

my $b ♎️ '-2.3 m';
is $a cmp $b, Order::More,                                                      '$a cmp $b';

$b ♎️ 23;
is $a cmp $b, Order::Less,                                                      '$a cmp $b';

my $t ♎️ '10 s';
is $a cmp $t, Nil,                                                              '$a cmp $t';

my $s ♎️ '27 feet.s-3';
is $a cmp $s, Nil,                                                              '$a cmp $s';

my $t2 ♎️ '42 hours-2';
is $a cmp $t2, Nil,                                                             '$a cmp $t2';

my $t3 ♎️ '43 hours';
is $t cmp $t3, Less,                                                            '$t cmp $t3';

my $d ♎️ '44 feet';
is $a cmp $d, Less,                                                             '$a cmp $d';

my $e = $a.in: 'feet';
is $a cmp $e, Same,                                                             '$a cmp $e';

is $a eq $b, Bool::False,                                                       '$a eq $b';
is $a ne $b, Bool::True,                                                        '$a ne $b';
is $a eq $e, Bool::False,                                                       '$a eq $e';
is $a ne $e, Bool::True,                                                        '$a ne $e';

is $a == $b, Bool::False,                                                       '$a == $b';
is $a != $b, Bool::True,                                                        '$a != $b';
is $a == $e, Bool::True,                                                        '$a == $e';
is $a != $e, Bool::False,                                                       '$a != $e';


#done-testing;

