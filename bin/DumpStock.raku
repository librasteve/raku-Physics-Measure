#!/usr/bin/env raku
use lib '../lib';
use Physics::Unit;

####### Stock Units #######
#|Stock Unit Guidance (aka fast-start)
#|
#|When editing the Physics::Unit module, raw data for units can be edited in the InitUnit 
#|section. The normal startup sequence is InitBaseUnit, InitPrefix, InitUnit, InitTypes. Many of
#|these unit definitions are ordered and may depend on previous ones. 
#|
#|However, current implementations of raku are quite slow around Grammars and take about 2mins
#|to start with this approach. Therefore a fast-start option is available in the form of pre-
#|baked stock units. This is enabled via $fast-start = 1 at ~ line 5 above. 
#|
#|This works by the DumpStockUnits subroutine - run this with bin/DumpStock.p6 > temp.txt
#|after any change to InitUnits and then paste the output at the end of this module between
#|the Start/End comments (these Unit.new definitions are not ordered)... 

DumpStockUnits();

#EOF
