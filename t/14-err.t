#!/usr/bin/env raku
#t/14-err.t
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 13;

use Physics::Measure :ALL;

#see https://github.com/p6steve/raku-Physics-Error/blob/master/README.md for explanation

#Option 1
#--------
my @o1-xs = ();
@o1-xs.push: 12.5nm ± 1;
@o1-xs.push: 12.5nm ± 10%;
@o1-xs.push: 12.5nm;

my @o1-re = <
12.5nm ±1.00e+00
12.5nm ±1.25e+00
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
12.5nm ±0.00e+00
0nm ±5.00e-01
12.5nm ±5.00e-01
12.5nm ±5.37e-01
>;
# @o2-xs.map( { .Str.say } );
is @o2-xs.map( {.Str } ) eq @o2-re, True,                        'option 2';

#Option 3
#--------
my @o3-xs = ();
@o3-xs.push: ♎️ '12.5 ft ±0.5';
@o3-xs.push: ♎️ '12.5 ft ±10.5%';
@o3-xs.push: ♎️ '12.5 ft';

my @o3-re = <
12.5ft ±5.00e-01
12.5ft ±1.31e+00
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
-12.5ft ±1.31e+00
12.50000410104987ft ±1.31e+00
3810001249.99999982404nm ±4.00e+08
29.5ft ±1.31e+00
12.3ft ±1.31e+00
1267nm ±5.37e+01
12.49999589895013ft ±1.31e+00
-3809998750.00000013402nm ±4.00e+08
0ft ±2.63e+00
0.000004763m^2 ±7.05e-07
212.5ft ±2.23e+01
3048000① ±4.51e+05
>;

is check-maths( @o3-xs[1] ) eq $maths31-re, True,                'maths ok';

my Time $t = Time.new(value => 10, units => 'ms', error => '4.3%');
is ~$t, '10ms ±4.30e-01',                                        'Time ms';
is ~( 17 / $t ), '1700Hz ±7.31e-01',                             'Frequency Hz' ;

is ~( $y / $t ), '0.000125m/s ±1.07e-05',                        'Speed m/s';

my Length $w = Length.new(value => 10, units => 'm', error => '2%');

my $z = $w ** 3;
is ~$z, '1000m^3 ±6.00e+01',                                     'power';

$z = $z ** <1/3>;
is ~$z, '10m ±2.00e-01',                                         'root';

is $w cmp $y, 'More',                                            'cmp';

# done-testing;
