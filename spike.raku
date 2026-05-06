use Physics::Measure :ALL;
$Physics::Measure::round-val = Nil;

my $x = ^'12.5 ft ±10.5%';
my $y = Length.new(value => 1250, units => 'nm', error => '4.3%');
#my $y = Length.new(value => 12.5e2, units => 'nm', error => '4.3%');
dd $x;
dd $y;

my $z = $x-$x;
dd $z;
say $z;
say $z.value.^name;

#iamerejh see 14-err line 110
#prevent small Rats from going to Num (say 0.000_001 < * <1_000_000)

#`[
sub check-maths( $x ) {
    gather {
        take(( -$x     ).Str);
        take(( $x + $y ).Str);
        take(( $y + $x ).Str);
        take(( $x + 17 ).Str);
        take(( .2 - $x ).Str);
        take(( 17 + $y ).Str);
        take(( $x - $y ).Str);
        take(( $y - $x ).Str);
        take(( $x - $x ).Str);
        take(( $x * $y ).Str);
        take(( 17 * $x ).Str);
        take(( $x / $y ).Str);
    }.Array
}

-12.5ft ±1.313
1.25e1ft ±1.313                <= prefer small values to be Rat
3.81000125e9nm ±0.40020245e8   <= make e's the same
29.5ft ±1.313
12.3ft ±1.313
1.267e3nm ±53.75
1.25e1ft ±1.313
-3.80999875e9nm ±0.40020245e8
0ft ±2.626
4.763e-6m^2 ±0.71e-6
212.5ft ±0.22321e1
3.048e6① ±0.45122592e5
#]

#`[
Note: the value will round trip, however the error will float around a little
- multiply/divide-const

#4.763e-06m^2 ±0.71e-6
#4.763e-06m^2 ±0.00000071
]


#`[
# Output Rounding

Measure output is rounded when `.Str` is called. This does not affect stored value (and error) precision or type for subsequent operations. Num and FatRat values (and errors) are rendered in (unlimited precision) Num format for ease of reading.

## Operations

Math operations always try to maintain exact precision. Default is to produce a FatRat as the type of the value of the result. Where the value is irrational, this will fallback to a Num.

## Error Controlled

The precision of the output is controlled by the significant digits of the error. To select this mode, set `$Physics::Measure::round-val = Nil;` (the default).

### Small Values

Small values can be specified as Num or FatRat types.

Num is what you get with the postfix operator syntax if the value has an exponent.

e.g.
9.1093837015e-31kg ±0.0000000028e-31       \   are the same
9.1093837015e-31kg ±2.8e-40                /

9.1093837015e-31kg ±0.0000000028e-31       \   look the same
9.1093837015e-3122222kg ±0.0000000028e-31  /

FatRat is what you get when the Measure is specified as a String via the FatRatStr module.

^<9.1093837015e-31 kg ±0.0000000028e-31>  also the same

all give =>
 9.1093837015e-31kg ±0.0000000028e-31

### Large Values


### Modest Values

Measure considers values in the range 0.000_001 < * <1_000_000 to be modest and outputs these as decimal Rats regardless of the way they were specified and stored. Errors are output in the same format and alignment to the decimal point.


Design
Large & Small
 - value & error are coerced to FatRatStr
 - value is normalized   (add \n?)  IS THIS TRUE
 - value is rounded to LSP of error
 - error is denormalized
 - scale (any Real) is coerced to a FatRatStr
 - round operation is performed by FatRatStr.round
 Modest

# Snagging
HMMMs
design non Num / FatRat solution
rat round (ie as well as FatRat) - ie test with Rat
move m-round over to FRS
dont forget gist etc
consider brackets format
release all FatRatStr Physics::Error Physics::Measure
adjust Physics::Constants App::Crag
#]

