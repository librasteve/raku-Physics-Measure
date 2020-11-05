#!/usr/bin/env raku
use lib '../lib';
use Physics::UnitAffixDump;

#|uncomment tags as applicable...
my $want-tags = < 
    :DEFAULT
    #:mechanical
    #:electrical 
    #:universal 
    #:ALL
>.any;

DumpAffixUnits( $want-tags );

#EOF
