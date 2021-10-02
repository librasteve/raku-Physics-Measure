#!/usr/bin/env raku
#t/14-err.t
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 16;

use Physics::Measure :ALL;

#see https://github.com/p6steve/raku-Physics-Error/blob/master/README.md for explanation

#Option 1
#--------
my @o1-xs = ();
@o1-xs.push: 12.5nm ± 1;
@o1-xs.push: 12.5nm ± 10%;
@o1-xs.push: 12.5nm;

my @o1-re = <
12.5nm ±1
12.5nm ±0.125
12.5nm
>;

# @o1-xs.map( {.Str.say } );
is @o1-xs.map( {.Str } ) eq @o1-re, True,                        'option 1';

#Option 2
#--------
my @o2-xs = ();
@o2-xs.push: Length.new(value => 12.5, units => 'nm');
@o2-xs.push: Length.new(value => 12.5, units => 'nm', error => 0);
@o2-xs.push: Length.new(value => 0, units => 'nm', error => 0.5);
@o2-xs.push: Length.new(value => 12.5, units => 'nm', error => 0.5);
@o2-xs.push: Length.new(value => 12.5, units => 'nm', error => '4.3%');

my @o2-re = <
12.5nm
12.5nm ±0
0nm ±0.5
12.5nm ±0.5
12.500000000000002nm ±0.5375
>;
#rakudo bug reported 02-10-21

# @o2-xs.map( { .Str.say } );
is @o2-xs.map( {.Str } ) eq @o2-re, True,                        'option 2';

#Option 3
#--------
my @o3-xs = ();
@o3-xs.push: ♎️ '12.5 ft ±0.5';
@o3-xs.push: ♎️ '12.5 ft ±10.5%';
@o3-xs.push: ♎️ '12.5 ft';

my @o3-re = <
12.5ft ±0.5
12.500000000000002ft ±0.13125
12.5ft
>;

# @o3-xs.map( { .Str.say } );
is @o3-xs.map( {.Str } ) eq @o3-re, True,                        'option 3';

sub check-monad( $_ ) {
    gather {
        .error.absolute.take;
        .error.relative.take;
        .error.percent.take;
        .error.relative.^name.take;
    }
}
# say check-monad( @o3-xs[1] );

my @monad10-re = <1 0.08 8% Rat>;
is check-monad( @o1-xs[0] ) eq @monad10-re, True,                'monad 1';

my @monad24-re = <0.5375 0.043 4.3% Rat>;
is check-monad( @o2-xs[4] ) eq @monad24-re, True,                'monad 2';

my @monad31-re = <1.3125 0.105 10.5% Rat>;
is check-monad( @o3-xs[1] ) eq @monad31-re, True,                'monad 3';

my $y = Length.new(value => 12.5e2, units => 'nm', error => '4.3%');

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
    }
}

# say check-maths( @o3-xs[1] );
my $maths31-re = <
-12.500000000000002ft ±0.13125
12.50000410104987ft ±0.13125001763451443
3810001250nm ±0.40005005375
29.500000000000004ft ±0.13125
12.3ft ±0.13125
1267nm ±0.5374999999999999
12.499995898950129ft ±0.13125001763451443
-3809998750nm ±0.40005005375
0ft ±0.2625
4.7625e-06m^2 ±0.70485e-6
212.50000000000003ft ±0.223125
3048000① ±451104
>;
is check-maths( @o3-xs[1] ) eq $maths31-re, True,                'maths ok';

my Time $t = Time.new(value => 10, units => 'ms', error => '4.3%');
is ~$t, '10ms ±0.43',                                            'Time ms';
is ~( 17 / $t ), '1700Hz ±0.731',                                'Frequency Hz' ;

is ~( $y / $t ), '0.000125m/s ±0.000010749999999999999e0',       'Speed m/s';

my Length $w = Length.new(value => 10, units => 'm', error => '2%');

my $z = $w ** 3;
is ~$z, '1000m^3 ±60',                                           'power';

$z = $z ** <1/3>;
is ~$z, '9.999999999999998m ±0.19999999999999996',               'root';

is $w cmp $y, 'More',                                            'cmp';

my $Em1 = 9.109_383_701_5e-31kg ±0.000_000_002_8e-31;
is $Em1, '9.1093837015e-31kg ±0.0000000028e-31',               'precision1';

my \Em2 = 9000kg ±900;
is ~Em2, '9000kg ±900',                                        'precision2';

my \Em3 = -.09kg ±0.009;
is ~Em3, '-0.09000000000000001kg ±0.009',                      'precision3';

# done-testing;
