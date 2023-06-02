#!/usr/bin/env raku
use lib '../lib';
use Physics::Measure :ALL;
use Data::Dump::Tree;


# First, we need to make some custom units...
{
    use Physics::Unit;

    # Units of heating density:
    Unit.new(defn => 'J / kg', names => ['J/kg']);
    Unit.new(defn => '1_000_000 J / kg', names => ['MJ/kg']);

    # And a new custom measurement type...
    class SpecificEnergy is Measure {}

    # And then link them together...
    GetUnit('J/kg').NewType('SpecificEnergy');

    # Since the dimensions are the same as radiation Dose we need a new type-hint too...
    %Physics::Unit::type-hints<SpecificEnergy> = <SpecificEnergy Dose>;

    # Units of fuel consumption rate:
    Unit.new(defn => 'm^3 / s', names => ['m^3ps']);
    Unit.new(defn => 'us-gallons per day', names => ['gpd']);

    class ConsumptionRate is Measure {}
    GetUnit('m^3ps').NewType('ConsumptionRate');
}

$Physics::Measure::round-val = 0.1;

role Fuel {
    has $.specific-energy;
}

role Trip {
    has $.distance;
    has $.speed;

    method time {
        $!distance * $!speed;
    }
}

role Container {
    has $.size;
}

class Vessel does Container does Trip {

}



say '---';
my $woody-biomass = Fuel.new( specific-energy => ♎️'19.8 MJ/kg' );
say "Woody biomass has an average heating density of {$woody-biomass.specific-energy}.";

say '---';
my $mass = 2kg;

say "So, if you burn " ~ {2kg} ~ " of it, then { ($mass * $woody-biomass.specific-energy).norm } of chemical energy is released as heat energy.";

say '---';
my $zz-load = ♎️'63907 tonnes';

say "The Zheng Zhi bulk carrier vessel transported $zz-load of Drax’s sustainable biomass from the US port of Baton Rouge in Louisiana.";

say '---';
my $distance = 8000km;
my $speed = ♎️'24 knots';
my $time = $distance / $speed;

my Trip $baton-rouge-to-yorkshire .= new: :$distance, :$speed;

given $baton-rouge-to-yorkshire {
    say "The Zheng Zhi's {$_.distance} round trip from Baton Rouge to Yorkshire is covered at a speed of {$_.speed} which takes about {$_.days}.";
}

say '---';

my $fuel-day = ♎️'63_000 gpd';
my $fuel-trip = $time * $fuel-day;

say "A Panamax ship can consume $fuel-day (us-gallons per day) of marine fuel at that speed, giving a total of { $fuel-trip.in('l').norm } for the round trip.";

say '---';

my $marine-fuel-energy-density = ♎️'36 MJ/kg';
my $total-trip-energy = $fuel-trip * $marine-fuel-energy-density;

say "Since marine fuel has an energy density of $marine-fuel-energy-density, the total fuel energy to move the shipment is { $total-trip-energy.norm }, quite a lot!";

say '---';

my $total-biomass-energy = $zz-load * $woody-biomass.specific-energy;
my $marine-fuel-percent = (+$total-trip-energy / +$total-biomass-energy) * 100;

say "And yet, the total heat energy from burning the woody biomass load is { $total-biomass-energy.norm }, so the marine fuel only contributes { $marine-fuel-percent.round(0.00001) }%, with a Carbon emission fraction of a similar order of magnitude.";