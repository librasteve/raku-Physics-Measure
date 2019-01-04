#!/usr/bin/env perl6

use v6;
use lib '../lib';
use Test;
plan 1;

my $auth-check = ?%*ENV<PSIXSTEVE>; 

if $auth-check { 
    require Test::META <&meta-ok>;
    meta-ok;
    done-testing;
}
else {
     skip-rest "Skipping author test";
     exit;
}
