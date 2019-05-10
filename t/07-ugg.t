#!/usr/bin/env perl6
#t/06-cmp.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 72; 

use Physics::Measure;
use Physics::Measure::Unit;

my $x1 ♎️ '1 kg.m.s^2',
is $x1.WHAT, Physics::Measure::Measure,                                 '$x1.WHAT';
is $x1.units.unitsof, '🌀Time2.Mass.Distance',                          '$x1-unitsof';
is $x1, '1 kg.m.s^2',                                                   '$x1-kg.m.s^2';

my $x2 ♎️ '2 kg.m**-3',
is $x2.WHAT, Physics::Measure::Measure,                                 '$x2.WHAT';
is $x2.units.unitsof, '🌀Mass.Distance-3',                              '$x2-unitsof';
is $x2, '2 kg.m**-3',                                                   '$x2-kg.m**-3';

my $x3 ♎️ '3 kg m s-2',
is $x3.WHAT, Physics::Measure::Force,                                   '$x3.WHAT';
is $x3.units.unitsof, 'Force',                                          '$x3-unitsof';
is "$x3", '3 kg m s-2',                                                 '$x3-kgms-2';

my $x4 ♎️ '4 kg*m*s4';
is $x4.WHAT, Physics::Measure::Measure,                                 '$x4.WHAT';
is $x4.units.unitsof, '🌀Time4.Mass.Distance',                          '$x4-unitsof';
is $x4, '4 kg*m*s4',                                                    '$x4-kg*m*s4';

my $x5 ♎️ '5 m/s';
is $x5.WHAT, Physics::Measure::Speed,                                   '$x5.WHAT';
is $x5.units.unitsof, 'Speed',                                          '$x5-unitsof';
is $x5, '5 m/s',                                                        '$x5-m/s';

my $x6 ♎️ '6 m/s^2';
is $x6.WHAT, Physics::Measure::Acceleration,                            '$x6.WHAT';
is $x6.units.unitsof, 'Acceleration',                                   '$x6-unitsof';
is $x6, '6 m/s^2',                                                      '$x6-m/s^2';

my $x7 ♎️ '7 m per s';
is $x7.WHAT, Physics::Measure::Speed,                                   '$x7.WHAT';
is $x7.units.unitsof, 'Speed',                                          '$x7-unitsof';
is $x7, '7 m per s',                                                    '$x7-m per s';

my $v ♎️ '8 l',
is $v, '8 l',                                                           '$v-l';
is $v.WHAT, Physics::Measure::Volume,                                   '$v.WHAT';
is $v.units.unitsof, 'Volume',                                          '$v-unitsof';

my $x8 ♎️ '8 m sq',
is $x8, '8 m sq',                                                       '$x8-m sq';
is $x8.WHAT, Physics::Measure::Area,                                    '$x8.WHAT';
is $x8.units.unitsof, 'Area',                                           '$x8-unitsof';

my $x9 ♎️ '9 s cubed';
is $x9, '9 s cubed',                                                    '$x9-s cubed';
is $x9.WHAT, Physics::Measure::Measure,                                 '$x9.WHAT';
is $x9.units.unitsof, '🌀Time3',                                        '$x9-unitsof';

my $x10 ♎️ '10 kg.m squared';
is $x10, '10 kg.m squared',                                             '$x10-kg.m squared';
is $x10.WHAT, Physics::Measure::Moment-of-Inertia,                      '$x10.WHAT';
is $x10.units.unitsof, 'Moment-of-Inertia',                             '$x10-unitsof';

my $x11 ♎️ '11 sq m',
is $x11, '11 sq m',                                                     '$x11-sq m';
is $x11.WHAT, Physics::Measure::Area,                                   '$x11.WHAT';
is $x11.units.unitsof, 'Area',                                          '$x11-unitsof';

my $x12 ♎️ '12 kg.m squared';
is $x12, '12 kg.m squared',                                             '$x12-kg.m squared';
is $x12.WHAT, Physics::Measure::Moment-of-Inertia,                      '$x12.WHAT';
is $x12.units.unitsof, 'Moment-of-Inertia',                             '$x12-unitsof';

my $x13 ♎️ '13 cubic s';
is $x13, '13 cubic s',                                                  '$x13-cubic s';
is $x13.WHAT, Physics::Measure::Measure,                                '$x13.WHAT';
is $x13.units.unitsof, '🌀Time3',                                       '$x13-unitsof';

my $x14 ♎️ '14 m¹';
is $x14, '14 m¹',                                                       '$x14-m¹';
is $x14.WHAT, Physics::Measure::Distance,                               '$x14.WHAT';
is $x14.units.unitsof, 'Distance',                                      '$x14-unitsof';

my $x15 ♎️ '15 kg m²';
is $x15, '15 kg m²',                                                    '$x15-kg m²';
is $x15.WHAT, Physics::Measure::Moment-of-Inertia,                      '$x15.WHAT';
is $x15.units.unitsof, 'Moment-of-Inertia',                             '$x15-unitsof';

my $x16 ♎️ '16 m³';
is $x16, '16 m³',                                                       '$x16-m³';
is $x16.WHAT, Physics::Measure::Volume,                                 '$x16.WHAT';
is $x16.units.unitsof, 'Volume',                                        '$x16-unitsof';

my $x17 ♎️ '17 m⁴';
is $x17, '17 m⁴',                                                       '$x17-m⁴';
is $x17.WHAT, Physics::Measure::Measure,                                '$x17.WHAT';
is $x17.units.unitsof, '🌀Distance4',                                   '$x17-unitsof';

my $x18 ♎️ '18 m s⁻¹';
is $x18, '18 m s⁻¹',                                                   '$x18-m s⁻¹';
is $x18.WHAT, Physics::Measure::Speed,                                 '$x18.WHAT';
is $x18.units.unitsof, 'Speed',                                        '$x18-unitsof';

my $x19 ♎️ '19 s⁻²';
is $x19, '19 s⁻²',                                                     '$x19-s⁻²';
is $x19.WHAT, Physics::Measure::Measure,                               '$x19.WHAT';
is $x19.units.unitsof, '🌀Time-2',                                     '$x19-unitsof';

my $x20 ♎️ '20 s⁻³';
is $x20, '20 s⁻³',                                                     '$x20-s⁻³';
is $x20.WHAT, Physics::Measure::Measure,                               '$x20.WHAT';
is $x20.units.unitsof, '🌀Time-3',                                     '$x20-unitsof';

my $x21 ♎️ '21 s⁻⁴';
is $x21, '21 s⁻⁴',                                                     '$x21-s⁻⁴';
is $x21.WHAT, Physics::Measure::Measure,                               '$x21.WHAT';
is $x21.units.unitsof, '🌀Time-4',                                     '$x21-unitsof';

my $x22 ♎️ '22 m³  ';
is "$x22", '22 m³',                                                     '$x22-m³  ';
is $x22.WHAT, Physics::Measure::Volume,                                 '$x22.WHAT';
is $x22.units.unitsof, 'Volume',                                        '$x22-unitsof';

#`[[ FIXME work around m s and ms (millisec)
my $x23 ♎️ '18 ms ⁻¹';
is $x23, '18 ms ⁻¹',                                                   '$x23-ms ⁻¹';
is $x23.WHAT, Physics::Measure::Frequency,                             '$x23.WHAT';
is $x23.units.unitsof, 'Frequency',                                    '$x23-unitsof';
#]]

my $x24 ♎️ '18 m.s⁻¹';
is $x24, '18 m.s⁻¹',                                                   '$x24-m.s⁻¹';
is $x24.WHAT, Physics::Measure::Speed,                                 '$x24.WHAT';
is $x24.units.unitsof, 'Speed',                                        '$x24-unitsof';

#done-testing;

