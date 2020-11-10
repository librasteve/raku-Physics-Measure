#!/usr/bin/env raku 
use Physics::Constants;  #<== must use before Physics::Measure 
use Physics::Measure;
use Physics::UnitPostfix;

say ~plancks-h;                 #6.626070015e-34 J.s
say ~faraday-constant;          #96485.33212 C/mol
say ~fine-structure-constant;   #0.0072973525693   (dimensionless)
say ~μ0;                        #1.25663706212e-06 H/m
say ~ℏ;                         #1.054571817e-34 J.s

my \λ = 2.5nm; 
say "Wavelength of photon (λ) is " ~λ;

my \ν = c / λ; 
say "Frequency of photon (ν) is " ~ν.in('petahertz');

my \Ep = ℎ * ν; 
say "Energy of photon (Ep) is " ~Ep.in('attojoules');

#Wavelength of photon (λ) is 2.5 nm
#Frequency of photon (ν) is 119.9169832 petahertz
#Energy of photon (Ep) is 79.45783266707788 attojoules

#die;
say '----------------';
say @physics-constants.sort.join("\n");
say '----------------';
say @physics-constants-abbreviations.sort.join("\n");

