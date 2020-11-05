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

DumpAffixOps( $want-tags );

#EOF
