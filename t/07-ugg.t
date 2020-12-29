#!/usr/bin/env raku
#t/07-ugg.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 36; 

use Physics::Measure;
use Physics::Unit;

my $x2 ♎️ '1 N';

my $x3 ♎️ '3 kg m s^-2',
is $x3.WHAT, Physics::Measure::Force,                                   '$x3.WHAT';
is $x3.units.type, 'Force',	                                            '$x3-unitsof';
is "$x3", '3 N',	                                                    '$x3-kgms-2';

my $x5 ♎️ '5 m/s';
is $x5.WHAT, Physics::Measure::Speed,                                   '$x5.WHAT';
is $x5.units.type, 'Speed',                                             '$x5-unitsof';
is $x5, '5 m/s',                                                        '$x5-m/s';

my $x6 ♎️ '6 m/s^2';
is $x6.WHAT, Physics::Measure::Acceleration,                            '$x6.WHAT';
is $x6.units.type, 'Acceleration',                                      '$x6-unitsof';
is $x6, '6 m/s^2',                                                      '$x6-m/s^2';

my $x7 ♎️ '7 m per s';
is $x7.WHAT, Physics::Measure::Speed,                                   '$x7.WHAT';
is $x7.units.type, 'Speed',                                             '$x7-unitsof';
is $x7, '7 m/s',					                                    '$x7-m per s';

my $v ♎️ '8 l',
is $v, '8 l',                                                           '$v-l';
is $v.WHAT, Physics::Measure::Volume,                                   '$v.WHAT';
is $v.units.type, 'Volume',			                                    '$v-unitsof';

#`[[ FIXME postwords not parsing
my $x8 ♎️ '8 m squared',
is $x8, '8 m^2',                                                        '$x8-m sq';
is $x8.WHAT, Physics::Measure::Area,                                    '$x8.WHAT';
is $x8.units.type, 'Area',                                              '$x8-unitsof';

my $x10 ♎️ '10 kg.m squared';
is $x10, '10 kg.m squared',                                             '$x10-kg.m squared';
is $x10.WHAT, Physics::Measure::Moment-of-Inertia,                      '$x10.WHAT';
is $x10.units.type, 'Moment-of-Inertia',								'$x10-unitsof';
#]]

#`[[ FIXME this returns both 'kg m^2' and 'kg.m^2' 
my $x10 ♎️ '10 kg.m^2';
is $x10, '10 kg.m^2',		                                            '$x10-kg.m squared';
is $x10.WHAT, Physics::Measure::Moment-of-Inertia,                      '$x10.WHAT';
is $x10.units.type, 'Moment-of-Inertia',                                '$x10-unitsof';
#]]

my $x11 ♎️ '11 sq m',
is $x11, '11 sq m',                                                     '$x11-sq m';
is $x11.WHAT, Physics::Measure::Area,                                   '$x11.WHAT';
is $x11.units.type, 'Area',                                             '$x11-unitsof';

my $x12 ♎️ '12 kg m2';
is $x12, '12 kg m2',		                                            '$x12-kg.m squared';
is $x12.WHAT, Physics::Measure::Moment-of-Inertia,                      '$x12.WHAT';
is $x12.units.type, 'Moment-of-Inertia',	                            '$x12-unitsof';

my $x14 ♎️ '14 m¹';
is $x14, '14 m',                                                        '$x14-m¹';
is $x14.WHAT, Physics::Measure::Length,                                 '$x14.WHAT';
is $x14.units.type, 'Length',				                            '$x14-unitsof';

my $x15a ♎️ '15 kg m^2'; 
#`[[ FIXME this returns both '15 kg m²' and '15 kg m2'
my $x15 ♎️ '15 kg m²';
is $x15, '15 kg m²',                                                    '$x15-kg m²';
is $x15.WHAT, Physics::Measure::Moment-of-Inertia,                      '$x15.WHAT';
is $x15.units.type, 'Moment-of-Inertia',	                            '$x15-unitsof';
#]]

my $x16 ♎️ '16 m³';
is $x16, '16 m^3',                                                      '$x16-m³';
is $x16.WHAT, Physics::Measure::Volume,                                 '$x16.WHAT';
is $x16.units.type, 'Volume',				                            '$x16-unitsof';

my $x17 ♎️ '1 m/s'; 

my $x18 ♎️ '18 m s⁻¹';
is $x18, '18 m/s',                                                      '$x18-m s⁻¹';
is $x18.WHAT, Physics::Measure::Speed,                                  '$x18.WHAT';
is $x18.units.type, 'Speed',                                            '$x18-unitsof';

my $x22 ♎️ '22 m³  ';
is "$x22", '22 m³',                                                     '$x22-m³  ';
is $x22.WHAT, Physics::Measure::Volume,                                 '$x22.WHAT';
is $x22.units.type, 'Volume',	                                        '$x22-unitsof';

my $x24 ♎️ '18 m.s⁻¹';
is $x24.pretty, '18 m⋅s⁻¹',                                            '$x24-m.s⁻¹';
is $x24.WHAT, Physics::Measure::Speed,                                 '$x24.WHAT';
is $x24.units.type, 'Speed',                                           '$x24-unitsof';

#done-testing;

