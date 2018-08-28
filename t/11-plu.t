#!/usr/bin/env perl6
#t/11-plu.t 
#TESTALL$ prove -e "perl6" ./t      [from root]
use v6;
use lib 'lib';
use lib '../lib';
use Test;
plan 13; 

use Physics::Measure;
use Physics::Unit;

my $n ♎️ '4.3 m';
is $n, '4.3 m',                                                         '$n';
$n ♎️ 1;
is $n, '1 m',                                                           '$n-s';
$n ♎️ 2;
is $n, '2 m',                                                           '$n-p';

my $s ♎️ '1 metres';
is $s, '1 metres',                                                      '$s';
$s ♎️ 2;
is $s, '2 metres',                                                      '$s-p';
$s ♎️ 1;
is $s, '1 metre',                                                       '$s-s';

my $p ♎️ '4.3 metres';
is $p, '4.3 metres',                                                    '$p';
$p ♎️ -1;
is $p, '-1 metre',                                                      '$p-s';
$p ♎️ 2;
is $p, '2 metres',                                                      '$p-p';

my $q ♎️ '1 metre';
is $q, '1 metre',                                                       '$q';
$q ♎️ 2;
is $q, '2 metres',                                                      '$q-p';

my $w ♎️ '4.3 metre';
is $w, '4.3 metre',                                                     '$w';
$w ♎️ 1;
is $w, '1 metre',                                                       '$w-s';

#done-testing;

