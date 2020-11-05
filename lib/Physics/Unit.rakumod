unit module Physics::Unit:ver<0.0.4>:auth<Steve Roe (p6steve@furnival.net)>; 
#viz. https://en.wikipedia.org/wiki/International_System_of_Units

##Read the Stock Unit Guidance (~line 725 below) prior to editing this module##

my $db = 0;           #debug 
my $fast-start = 1;   #[off ~ 65s / on ~ 11s / precomp ~ 1.7s ] 

##### Constant Declarations ######
constant \locale = "imp";   #Imperial="imp"; US="us' FIXME v2 make tag
constant \NumBases = 8; 
my Str   @BaseNames;

my %unit-by-name;
my %prefix-by-name;
my %prototype-by-type;		#ie. Unit objects that exemplify each type 

#Power synonyms
my %pwr-preword   = ( square  => 2, sq => 2, cubic => 3, );   
my %pwr-postword  = ( squared => 2,          cubed => 3, );   

#Power superscripts ie. x¹ x² x³ x⁴ x⁻¹ x⁻² x⁻³ x⁻⁴  
my %pwr-superscript = (  
     '¹' =>  1,  '²' =>  2,  '³' =>  3,  '⁴' =>  4,   
    '⁻¹' => -1, '⁻²' => -2, '⁻³' => -3, '⁻⁴' => -4,  
);

######## Classes & Roles ########
class Unit is export {
    has Real $!factor = 1;
    has Real $!offset = 0;				#i.e. for K <=> °C
    has Str  $!defn   = '';
    has Str  $!type;
    has Str  @.names  is rw = [];
    has Int  @.dims   = 0 xx NumBases;
	has MixHash $.dmix is rw = ∅.MixHash;
    has Bool $!stock;					#for pre-cooked 'stock' units

    ### accessor methods ###		    #use 'self.attr: 42' not 'self.attr = 42'
    multi method factor($f) { self.CheckChange; $!factor = $f } 
    multi method factor     { $!factor }

    multi method offset($o) { self.CheckChange; $!offset = $o } 
    multi method offset     { $!offset }

    multi method defn($d)   { $!defn = $d.Str }
    multi method defn       { $!defn }

    multi method type($t)   { $!type = $t.Str }
    multi method type(:$just1) {    
        return $!type   if $!type;		#rarely set ... just to disambiguate

        return 'prefix' if %prefix-by-name{self.name};

        my @t;
        for %prototype-by-type.keys -> $k { 
            push @t, $k if self.dims eqv %prototype-by-type{$k}.dims
        }    
        #return value depends on whether we got zero, one or multiple types
		if @t == 0 { return '' }
		if @t == 1 { return @t[0] }
		if $just1  { return disambiguate(@t) }
		if @t > 1  { return @t.sort }
    }    

    ### new & clone methods ###

    #new as used by sub CreateUnit() to make a stub Unit
    multi method new( Bool:U :$stock ) { callsame }             #calls base Unit.new()
    multi submethod BUILD( Bool:U :$!stock ) { }                #then no-op in build phase

    #new for stock units avoids CreateUnit() for performance, never calls base Unit.new()
    multi method new( %args, Bool:D :$stock ) {
        self.bless( %args, :$stock )
    }
    #parameter capture does work binds named args to the (private) attributes
    multi submethod BUILD( :$!factor, :$!offset, :$!defn, :$!type,
                              :@!names, :@!dims, :$!dmix, Bool:D :$!stock ) {
        self.SetNames: @!names;
    }

    #new by deep cloning an existing Unit
    method clone {
        nextwith :names([]), :type(''), :dims(@.dims.clone)
    }
    multi method new( Unit:D $u: @names ) {
        my $n = $u.clone;
        $n.SetNames: @names;
        return $n
    }

    #new by named arguments 
    multi method new( :$defn!, :@names, Bool:U :$stock ) {
        my $n = CreateUnit( $defn );
        $n.SetNames: @names;
        return $n
    }

    ### output methods ###
    method Str { self.name }

    multi method name()         { @!names[0] || '' }
    multi method name( Str $n ) { self.SetNames([$n]) }

    method canonical {
        my ( $ds, @dim-str );
        for 0 ..^ NumBases -> $i {
            given @.dims[$i] {
                when 0  { $ds = '' }
                when 1  { $ds = "@BaseNames[$i]" }
                default { $ds = "@BaseNames[$i]$_" }
            }
            @dim-str.push: $ds if $ds;
        }
        return @dim-str.join('.')
    }
    method pretty {               #following SI recommendation
        my %pwr-sup-rev = %pwr-superscript.kv.reverse;
        my ( $ds, @dim-str );
        for 0 ..^ NumBases -> $i {
            given @.dims[$i] {
                when 0  { $ds = '' }
                when 1  { $ds = "@BaseNames[$i]" }
                default { $ds = "@BaseNames[$i]%pwr-sup-rev{$_}" }
            }
            @dim-str.push: $ds if $ds;
        }
        return @dim-str.join('⋅')
    }
    method raku( :$stock ) {								#can make stock units
		my $s-str = $stock ?? ', stock => True' !! '';
		my $t-str = $stock ?? "''" !! "'$!type'";			#suppress type if stock
        return qq:to/END/;
        Unit.new( factor => $.factor, offset => $.offset, defn => '$.defn', type => $t-str,
		  dims => [{@.dims.join(',')}], dmix => {$.dmix.raku}, 
		  names => [{@.names.map( ->$n {"'$n'"}).join(',')}]$s-str );
        END
    }

    ### behavioural methods ###
    method SetNames( @_ is copy, :$noplural ) {
        @.names = [];			#clears then sets
        for @_ -> $n {
            push @.names, $n;
            %unit-by-name{$n} = self;

            #naive plurals - append 's' unless...
            if     $n.chars > 2                 #...too short
                && $n.comb.first(:end) ne 's'   #...already ends with 's'
                && $n !~~ /<[\d\/^*]>/          #...contains a digit or a symbol
                && ! $noplural                  #...instructed not to
                && ! $!stock                    #...not a stock unit (already done)
            {
                my $ns = $n ~ 's';
                push @.names, $ns;
                %unit-by-name{$ns} = self;
            }
        }
    }
    method NewType( $t ) {
        $!type = $t;
        %prototype-by-type{$t} = self;
    }
    method CheckChange {
        die "You're not allowed to change named units!" if self.name;
    }

    ### mathematical mutating Module methods ###
    multi method times( Real $t ) {
        self.factor: self.factor * $t;
		return self
    }    
    multi method times( Unit $t ) {
        self.factor: self.factor * $t.factor;
        self.dims >>+=<< $t.dims;
		self.dmix = ( self.dmix (+) $t.dmix ).MixHash;
		self.type: '';
        return self 
    }  
    method invert {
        self.factor: 1 / self.factor;
        self.dims = -<< self.dims;
		self.dmix = ( ∅ (-) self.dmix ).MixHash; 
        return self 
    }    
    multi method share( Real $d ) {
        self.factor: self.factor / $d;
		return self
    }    
    multi method share( Unit $d ) {
        my $u = GetUnit($d).clone;
        self.times: $u.invert;
        return self 
    }    
    method raise( $d, $e ) {
		#raise a one-element unit ($e) to power of $d digits
        self.factor: self.factor ** $d;
        self.dims >>*=>> $d;
		self.dmix{$e} = $d;
        return self 
    }    

	#### convert & compare methods ####
    method same-dims( Unit $u ) {
        return 0 unless $u.dmix eqv self.dmix;
        return 0 unless $u.factor == self.factor;
        return 1
    }
	method same-unit( Unit $u ) {
		return 0 unless $u.dims eqv self.dims;
        return 0 unless $u.factor == self.factor;
        return 1
	}

    ### mathematical Measure methods ###
    method multiply( Unit $r --> Unit ) {
		my $l = self.clone;
		my $x = $l.times( $r );
		my $t = $x.type( just1 => 1 );		#occasionally can be > one type
		return %prototype-by-type{$t};
    }
    method divide( Unit $r ) {
		my $l = self.clone;
		my $x = $l.share( $r );
		my $t = $x.type( just1 => 1 );		#occasionally can be > one type
		return %prototype-by-type{$t}
    }
	method root-extract( Int $n where 1 <= $n <= 4 ) {
        #only when all dims divisible by root
		my $l = self.clone;
		die "rebase failed" unless $l.factor == 1;
		$l.defn: '';
		$l.type: '';
		$l.dims = $l.dims.map({($_/$n).Int});
		for $l.dmix.kv -> $k,$v { $l.dmix{$k} = $v/$n }
		return %prototype-by-type{$l.type}
	}
}

######## Subroutines ########
sub ListUnits is export {		
    return sort keys %unit-by-name
}
sub ListTypes is export {
    return sort keys %prototype-by-type
}
sub ListBases is export {
    return @BaseNames
}
sub GetPrototype( Str $t ) is export {
	return %prototype-by-type{$t}
}
sub GetUnit( $u ) is export {
    return $u if $u ~~ Unit;

    for %unit-by-name.kv -> $k,$v { return $v if $k eq $u }
    for %prefix-by-name.kv -> $k,$v { return $v if $k eq $u }

	my $c = CreateUnit($u);				#finally, try as a definition

 	#look for same dims (shortest name wins if >1)
	my @same-by-name;
    for %unit-by-name.kv -> $k,$v { 
		@same-by-name.push($k) if $v.same-dims($c) 
	}
    if @same-by-name {	
		my @same-by-size = @same-by-name.sort({$^a.chars cmp $^b.chars});
		return %unit-by-name{@same-by-size[0]}	#shortest
	}
    return $c
}
sub disambiguate( @t ) {
	#bias rules to help when multiple types are found
	my %dh = %(
		<Energy>      => <Energy Torque>,
		<Frequency>   => <Angular-Speed Frequency>,
	);
	for %dh.kv -> $k,$v { return $k if @t.sort eq $v.sort } 
}

######## Grammars ########
sub CreateUnit( $defn is copy ) {
    #6.d faster regexes with Strings {<$str>} & slower with Arrays {<@arr>}
	#strip compound names to force dmix generation
    my $unit-names       = %unit-by-name.keys.grep({! /<[\s*^./]>/}).join('|');
    my $prefix-names     = %prefix-by-name.keys.join('|');
    my $pwr-prewords     = %pwr-preword.keys.join('|');
    my $pwr-postwords    = %pwr-postword.keys.join('|');
    my $pwr-superscripts = %pwr-superscript.keys.join('|');

    #escape quote non alphanum| charactersi...
    $unit-names       ~~ s:g/ ( <-[a..z A..Z 0..9 \|]> ) / '$0' /;
    $pwr-superscripts ~~ s:g/ ( <-[a..z A..Z 0..9 \|]> ) / '$0' /;

    my $u = Unit.new();         #stub unit we are creating
	$defn .= trim;

    ##use Grammar::Tracer;
    grammar UnitGrammar {
        token TOP         { ^  \s* <compound>
                              [\s* <divider> \s* <compound>]?
                              [\s*    '+'    \s* <offset>  ]? \s* $ } #'+' is hardwired
        token divider     { '/' || 'per' }
        token compound    { <element>+ % <sep> }
        token sep         { [ '*' || '.' || ' *' || ' .' || ' ' ] }
        token element     { <factor> || <pnp-before> || <pnp-after> }

        token factor      { <number> }
        token offset      { <number> }
        token number      { \S+ <?{ defined +"$/" }> } #get chars, assert coerce to Real via +

        token pnp-before  { <pwr-before>  \s+? <prefix-name> } #pnp=="prefix-name-power" combo
        token pnp-after   { <prefix-name> \s*? <pwr-after>?  }

        token prefix-name { <prefix>? \s*? <name> }
        token prefix      { <$prefix-names> }
        token name        { <$unit-names>   }

        token pwr-before  { <$pwr-prewords> }
        token pwr-after   { <pwr-postwd> || <pwr-supers> || <pwr-normal> }
        token pwr-postwd  { <$pwr-postwords>    }
        token pwr-supers  { <$pwr-superscripts> }

        token pwr-normal  { <pwr-symbol> \s*? <pwr-digits> }
        token pwr-digits  { <[-+]>? <[1..4]> }
        token pwr-symbol  { '**' || '^' }
    }

    my $ad = 0;         #after the divider?
    my Int  $d = 1;	    #digits from power
	my Str  $e = '';	#element name
    my Unit ($n,$p);    #new units for each element name & prefix
    class UnitActions   {
        method divider($/)     { $ad = 1 }
        method factor($/)      { !$ad ?? $u.times($/.Real) !! $u.share($/.Real) }
        method offset($/)      { $u.offset($/.Real) }

        method name($/)        { $e=$/.Str; $n=GetUnit($e).clone; $n.dmix=∅.MixHash }
        method prefix($/)      { $p=GetUnit($/.Str).clone; $p.dmix=∅.MixHash }
        method prefix-name($/) { $n.times($p) if $p       }

        method pwr-before($/)  { $d=%pwr-preword{$/.Str}     }
        method pwr-postwd($/)  { $d=%pwr-postword{$/.Str}    }
        method pwr-supers($/)  { $d=%pwr-superscript{$/.Str} }
        method pwr-normal($/)  { $d=$<pwr-digits>.Int        }

		method element($/)     { if $n { $n.raise($d, $e);
									     !$ad ?? $u.times($n) !! $u.share($n) }
								 $d=1; $e=''; $n=$p=Nil;     }
    }

    my $match = UnitGrammar.parse( $defn, :actions(UnitActions) );
    if $match.so {
        $u.defn: $defn;
        $u.SetNames: [$defn], :noplural;
        return $u
    } else {
        die "Couldn't parse defn Str $defn.";
    }
}

######## Initialization ########
sub InitBaseUnit( @_ ) {
    my $i = 0;
    for @_ -> %h {
        my ($type, $names) = %h.key, %h.value;

        my $u = Unit.new;
        $u.SetNames: $names;    #auto decont to list
        $u.defn: $u.name;
        @BaseNames.push: $u.name;

        #dimension vector has zeros in all but one place
        $u.dims[$i++] = 1;
		$u.dmix{$u.name} = 1;

        $u.NewType: $type;

        say "Initialized Base Unit $names[0]" if $db;
    }
}
sub InitPrefix( @_ ) {
    for @_ -> $name, $factor {
        my $u = Unit.new;
        $u.factor:     $factor;
        $u.defn:       $factor;
        $u.names.push: $name;
        $u.type:       'prefix';

        %prefix-by-name{$name} = $u;

        say "Initialized Prefix $name" if $db;
    }
}
sub InitUnit( @_ ) is export {
    for @_ -> $names, $defn {
        my $u = CreateUnit( $defn );
        $u.SetNames: $names;    #decont from scalar to list

        say "Initialized Unit $names[0]"  if $db;
        say "================ >>>"        if $db;
        say "UG.parsed: ≪$defn≫"          if $db;
        say "UG.result: "                 if $db;
        say $u.gist                       if $db;
    }
}
sub InitTypes( @_ )  {
    for @_ -> %p {
        my ($t, $u) = %p.key, %p.value;
		GetUnit($u).NewType($t)
    }
}

######## Unit Data ########
InitPrefix (
    #SI Prefixes
    #avoid 1e2 format to encourage Rats
    'deka',    10, 
    'deca',    10,
    'hecto',   100,
    'kilo',    1000,
    'mega',    1000000,
    'giga',    1000000000,
    'tera',    1000000000000,
    'peta',    1000000000000000,
    'exa',     1000000000000000000,
    'zetta',   1000000000000000000000,
    'yotta',   1000000000000000000000000,
    'deci',    0.1,
    'centi',   0.01,
    'milli',   0.001,
    'micro',   0.000001,
    'nano',    0.000000001,
    'pico',    0.000000000001,
    'femto',   0.000000000000001,
    'atto',    0.000000000000000001,
    'zepto',   0.000000000000000000001,
    'yocto',   0.000000000000000000000001,
);
InitBaseUnit (
    #SI Base Units 
    'Length'      => ['m', 'metre', 'meter'],
    'Mass'        => ['kg', 'kilogram'],
    'Time'        => ['s', 'second', 'sec'],
    'Current'     => ['A', 'amp', 'ampere', 'ampère'],  
    'Temperature' => ['K', 'kelvin'],   
    'Substance'   => ['mol', 'mole'],
    'Luminosity'  => ['cd', 'candela', 'candle'],
	'Angle'		  => ['radian'],		
);

if $fast-start {
    LoadStockUnits(); 
} else {
	InitUnit (

	# Dimensionless
	['pi'],          '3.1415926535897932385',
#FIXME try ['pi'], 'π', #or similar

	#SI Derived Units with special names & symbols
	['sr', 'steradian'],                    'radian^2',
	['Hz', 'hertz'],                        '1 / s',
	['N',  'newton'],                       'kg m / s^2',
	['Pa', 'pascal'],                       'N / m^2',
	['J',  'joule'],                        'kg m^2 / s^2',
	['W',  'watt'],                         'kg m^2 / s^3',
	['C',  'coulomb'],                      'A s',
	['V',  'volt'],                         'kg m^2 / A s^3',
	['F',  'farad'],                        'A^2 s^4 / kg m^2',
	['Ω',  'ohm'],                          'kg m^2 / A^2 s^3',
	['S',  'siemens'],                      'A^2 s^3 / kg m^2',
	['Wb', 'weber'],                        'kg m^2 / A s^2',
	['T',  'tesla'],                        'kg / A s^2',
	['H',  'henry'],                        'kg m^2 / A^2 s^2',
	['°C', 'celsius', 'Centigrade'],        'K + 273.15',
	['lm', 'lumen'],                        'cd sr',
	['lx', 'lux'],                          'm^-2 cd',
	['Bq', 'becquerel'],                    '1 Hz',
	['Gy', 'gray'],                         'J / kg',
	['Sv', 'sievert'],                      'J / kg',
	['kat', 'katal'],                       'mol s^-1',
	#SI coherent Derived Units in terms of base units - TBD [see url]
	#SI coherent Derived Units that include units with special names - TBD [see url]

	# Dimensionless
	['one', 'unity'],							'1',
	['semi','demi','hemi'],						'1/2',
	['%','percent'],							'1/100',
	['ABV'],									'1',   

	# Angle
	['°', 'degree', 'deg', 'º'],                'pi radians / 180',
	['ᵍ', 'gon'],                               'pi radians / 200',

	# Solid Angle
	['deg²'],									'deg^2',
	['sp','spat'],								'4 pi steradians',

	# Time
	['min', 'minute'],                          '60 s',
	['hr', 'hour'],                             '60 min',
	['day'],                                    '24 hr',
	['week'],                                   '7 days',
	['fortnight'],                              '2 week',
	['yr', 'year'],                             '365.25 days',
	['month'],                                  'year / 12',    # an average month
	['century', 'centuries'],                   '100 yr',
	['millenium', 'millenia'],                  '1000 yr',

	# Frequency
	['cycle'],                                  '1 Hz',
	['revolution'],                             '1',
	['rpm'],                                    'revolutions per minute',

	# Length 
	['km'],				                        'kilometre',
	['μ', 'micron'],                            '1e-6 m',
	['å', 'angstrom'],                          '1e-10 m',
	['au', 'astronomical-unit'],                '1.49598e11 m',
	['ly', 'light-year'],                       '9.46e15 m',
	['parsec'],                                 '3.083e16 m',
	['ft', 'foot', 'feet'],                     '0.3048 m',         
	['in', 'inch'],                             'ft/12',           
	['yard'],                                   '3 ft',            
	['fathom'],                                 '2 yards',         
	['rod', 'pole', 'perch'],                   '5.5 yards',       
	['furlong'],                                '40 rods',         
	['mile'],                                   '5280 ft',         
	['nmile', 'nautical-mile'],                 '1852 m',
	['ca', 'cable'],		                    '185.2 m',
	['pica'],                                   'in/6',	#chosen defn not unique 
	['point'],                                  'pica/12',         

	# Area
	['m^2', 'm2', 'm²'],                        'm^2',
	['are'],                                    '100 square metres',
	['hectare'],                                '100 ares',
	['barn'],                                   '1e-28 square metres',
	['acre'],                                   '43560 square feet',

	# Volume
	['m^3', 'm3', 'm³'],                        'm^3',
	['l', 'L', 'litre', 'liter'],               'm^3/1000',        
	['cc'],		                                'cubic centimetre',
	['bottle'],                                 '750 millilitre',
	['fluidram'],                               '3.5516 millilitre',
	['minim'],                                  '0.059194 millilitre',
	['alcohol-unit'],                           '10 millilitre',            # of pure alcohol
	# setting Imperial (imp-) or US (us-) from \locale
	['us-gallon'],                              '3.785411784 litre',
	['imp-gallon'],                             '4.54609 litre',
	['gallon'],									"1 {locale}-gallon",
	['firkin'],							        '9 gallons',
	['barrel'],							        '36 gallons',
	['quart'],                                  'gallon/4',
	['peck'],                                   '8 quarts',
	['bushel'],                                 '4 pecks',
	['fifth'],                                  'us-gallon/5',
	['us-pint'],                                'us-gallon/8',
	['imp-pint'],                               'imp-gallon/8',
	['pint'],									"1 {locale}-pint",
	['cup'],                                    'us-pint/2',
	['floz', 'fluid-ounce'],                    'cup/8',
	['gill'],                                   '4 fluid-ounces',
	['tablespoon', 'tbsp'],                     'fluid-ounce / 2',
	['teaspoon', 'tsp'],                        'tablespoon / 3',

	# Speed
	['m/s'],		                            'm/s',
	['mph'],                                    'miles per hour',
	['kph'],                                    'kilometre per hour',
	['kps'],                                    'kilometre per second',
	['fps'],                                    'feet per second',
	['knot'],                                   'nmile per hour',

	# Angular-Speed
	['radians per second'],			            'Hz',  #the SI unit (radians=1)
	['revs', 'revolutions per second'],         '2 pi * Hz',
	['rpm'],							        '60 revs',

	# Acceleration
	['m/s^2'],                                  'm/s^2',
	['g0', 'earth-gravity'],                    '9.80665 m/s^2',   

	# Mass
	['g', 'gram', 'gm', 'gramme'],              'kg / 1000',       
	['u', 'atomic-mass-unit'],                  '1.6605402e-27 kg',
	['metric-ton', 'tonne'],                    '1000 kg',         
	['grain'],                                  '0.0648 gm',
	['lbm', 'pounds-mass'],                     '0.45359237 kg',   
	['oz', 'ounce'],                            'lbm/16',          
	['stone'],                                  '14 lbm',          
	['hundredweight'],                          '100 lbm',        
	['ton', 'short-ton'],                       '2000 lbm',       
	['long-ton'],                               '2240 lbm',       
	['slug'],                                   'lbm g0 s^2/ft',   
	['dram'],                                   'ounce / 16',      
	['troy-pound'],                             '0.373 kg',
	['troy-ounce'],                             '31.103 gm',
	['pennyweight'],                            '1.555 gm',
	['scruple'],                                '1.296 gm',
	['carat', 'karat'],                         '200 milligram',
	['j-point'],                                '2 carat',        

	# Moment-of-Inertia
	['kg m^2'],                                 'kg m^2',

	# Momentum
	['kg m/s'],                                 'kg m/s',
	['slug ft/s'],                              'slug feet/s',

	# Angular-Momentum
	['kg m^2/s'],                               'kg m^2 / s',

	# Force
	['lb', 'lbs', 'pound', 'pound-force'],      'slug foot / s^2', 
	['ounce-force'],                            'pound-force / 16',
	['dyne'],                                   'gm centimetre / s^2',     
	['gram-force'],                             'gm g0',           
	['kgf'],                                    'kilo gram-force', 

	# Torque
	['Nm', 'newton-metre'],                     'N m',
	['ft-lb', 'footpound'],                     'foot pound-force',

	# Impulse
	['Ns'],                                     'N * s',
	['pound-second'],                           'pound * s',

	# Pressure
	['bar'],                                    '1e5 pascal',
	['torr'],                                   '133.322368 pascal',  #(101325 / 760)
	['psi'],                                    'pounds per inch^2',
	['atm', 'atmosphere'],                      '101325 pascal',            

	# Density
	['kg/m^3'],                                 'kg / m^3',
	['°proof'],                                 '923 kg / m^3',       
	#UK metric https://en.wikipedia.org/wiki/Alcohol_proof (US version is just 2x ABV)

	# Energy
	['eV', 'electron-volt'],                    '1.60217733e-19 joule',
	['MeV'],                                    'mega electron-volt',
	['GeV'],                                    'giga electron-volt',
	['TeV'],                                    'tera electron-volt',
	['cal', 'calorie'],                         '4.184 joules', 
	['kcal'],                                   'kilocalories',  
	['btu', 'british-thermal-unit'],            '1055.056 joule',
	['therm'],                                  '1.0e5 btu',
	['erg'],                                    '1.0e-7 joule',
	['kWh'],                                    'kilowatt hour',

	# Power
	['us-horsepower', 'us-hp'],                 '550 foot pound-force / s',
	['PS', 'horsepower', 'hp'],                 '75 kg * g0 * m / s',

	# Current (Base Unit)

	# Potential (Derived Unit)

	# Conductance
	['mho'],                                    '1 / ohm',

	# Capacitance (Derived Unit)

	# Inductance (Derived Unit)

	# Magnetic_flux
	['Mx', 'maxwell'],                          '1e-8 weber',

	# Magnetic_field
	['gauss'],                                  '1e-4 tesla',

	# Temperature
	['°R', 'Rankine'],                          '5/9 * K',    
	['°F', 'Fahrenheit'],                       '5/9 * K + 459.67',

	# Dose
	['rad'],           'gray / 100',
	['rem'],           'sievert / 100',
);
} #end of fast-start else

InitTypes (
	#sets name of prototype unit
    'Dimensionless'      => 'unity',
    'Angle'              => 'radian',
	'Angular-Speed'		 => 'radians per second',
    'Solid-Angle'        => 'steradian',
    'Frequency'          => 'hertz',
    'Area'               => 'm^2',
    'Volume'             => 'm^3',
    'Speed'              => 'm/s',
    'Acceleration'       => 'm/s^2',
    'Momentum'           => 'kg m/s',
    'Force'              => 'newton',
    'Torque'             => 'Nm',
    'Impulse'            => 'Ns',
    'Moment-of-Inertia'  => 'kg m^2',
    'Angular-Momentum'   => 'kg m^2/s',
    'Pressure'           => 'pascal',
	'Density'			 => 'kg/m^3',
    'Energy'             => 'joule',
    'Power'              => 'watt',
    'Charge'             => 'coulomb',
    'Potential'			 => 'volt',
    'Resistance'         => 'ohm',
    'Conductance'        => 'siemens',
    'Capacitance'        => 'farad',
    'Inductance'         => 'henry',
    'Magnetic_Flux'      => 'weber',
    'Magnetic_Field'     => 'tesla',
    'Dose'               => 'gray',
);

#mop up remaining ambiguous types
GetUnit('eV').type:    'Energy';
GetUnit('MeV').type:   'Energy';
GetUnit('GeV').type:   'Energy';
GetUnit('TeV').type:   'Energy';
GetUnit('cal').type:   'Energy';
GetUnit('kcal').type:  'Energy';
GetUnit('btu').type:   'Energy';
GetUnit('erg').type:   'Energy';
GetUnit('kWh').type:   'Energy';
GetUnit('ft-lb').type: 'Torque';

if $db {
say "+++++++++++++++++++";
say "INITIALIZATION DONE";
say "+++++++++++++++++++";
say "";
}


####### Stock Unit Guidance (aka fast-start)#######

#|When editing this module, then the raw data for units can be edited in the InitUnit section
#|above. The normal startup sequence is InitBaseUnit, InitPrefix, InitUnit, InitTypes. Many of
#|these unit definitions are ordered and may depend on previous ones. Set $fast-start = 0; 
#|
#|However, current implementations of raku are quite slow around Grammars and take about 2mins
#|to start with this approach. Therefore a fast-start option is available in the form of pre-
#|baked stock units. This is enabled via $fast-start = 1 at ~ line 5 above. 
#|
#|This works by the DumpStockUnits subroutine - run this with bin/DumpStock.raku > temp.txt
#|after any change to Unit Data and then paste the output at the end of this module between
#|the Start/End comments...

sub DumpStockUnits is export {
    my %unique-unit{Unit} = %unit-by-name.kv.reverse;
	my @unique-sort = %unique-unit.keys.sort({$^a.name cmp $^b.name});	
    for @unique-sort -> $u {
        say $u.raku( :stock );
    }
}

#|Now you can set $fast-start = 1; ;-)

sub LoadStockUnits {

#approx. 230 units == ~920 more lines...
####### Stock Unit Start #######
Unit.new( factor => 0.01, offset => 0, defn => '1/100', type => '',
	  dims => [0,0,0,0,0,0,0,0], dmix => ().MixHash, 
	  names => ['%','percent','percents'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'A', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("A"=>1).MixHash, 
	  names => ['A','amp','amps','ampere','amperes','ampère','ampères'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => '1', type => '',
	  dims => [0,0,0,0,0,0,0,0], dmix => ().MixHash, 
	  names => ['ABV','ABVs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => '1 Hz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("Hz"=>1).MixHash, 
	  names => ['Bq','becquerel','becquerels'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'A s', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("A"=>1,"s"=>1).MixHash, 
	  names => ['C','coulomb','coulombs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'A^2 s^4 / kg m^2', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("s"=>4,"A"=>2,"m"=>-2,"kg"=>-1).MixHash, 
	  names => ['F','farad','farads'] , stock => True  );

Unit.new( factor => 1.60217733e-10, offset => 0, defn => 'giga electron-volt', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("electron-volt"=>1).MixHash, 
	  names => ['GeV','GeVs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'J / kg', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("kg"=>-1,"J"=>1).MixHash, 
	  names => ['Gy','gray','grays'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m^2 / A^2 s^2', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("m"=>2,"kg"=>1,"A"=>-2,"s"=>-2).MixHash, 
	  names => ['H','henry','henrys'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => '1 / s', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("s"=>-1).MixHash, 
	  names => ['Hz','hertz','hertzs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m^2 / s^2', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("kg"=>1,"m"=>2,"s"=>-2).MixHash, 
	  names => ['J','joule','joules'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'K', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("K"=>1).MixHash, 
	  names => ['K','kelvin','kelvins'] , stock => True  );

Unit.new( factor => 1.60217733e-13, offset => 0, defn => 'mega electron-volt', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("electron-volt"=>1).MixHash, 
	  names => ['MeV','MeVs'] , stock => True  );

Unit.new( factor => 1e-08, offset => 0, defn => '1e-8 weber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['Mx','maxwell','maxwells'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m / s^2', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("m"=>1,"kg"=>1,"s"=>-2).MixHash, 
	  names => ['N','newton','newtons'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'N m', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("m"=>1,"N"=>1).MixHash, 
	  names => ['Nm','newton-metre','newton-metres'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'N * s', type => '',
	  dims => [1,1,-1,0,0,0,0,0], dmix => ("N"=>1,"s"=>1).MixHash, 
	  names => ['Ns'] , stock => True  );

Unit.new( factor => 735.49875, offset => 0, defn => '75 kg * g0 * m / s', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("s"=>-1,"m"=>1,"kg"=>1,"g0"=>1).MixHash, 
	  names => ['PS','horsepower','horsepowers','hp'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'N / m^2', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("N"=>1,"m"=>-2).MixHash, 
	  names => ['Pa','pascal','pascals'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'A^2 s^3 / kg m^2', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("m"=>-2,"kg"=>-1,"A"=>2,"s"=>3).MixHash, 
	  names => ['S','siemens'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'J / kg', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("kg"=>-1,"J"=>1).MixHash, 
	  names => ['Sv','sievert','sieverts'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg / A s^2', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("A"=>-1,"kg"=>1,"s"=>-2).MixHash, 
	  names => ['T','tesla','teslas'] , stock => True  );

Unit.new( factor => 1.60217733e-07, offset => 0, defn => 'tera electron-volt', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("electron-volt"=>1).MixHash, 
	  names => ['TeV','TeVs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m^2 / A s^3', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("A"=>-1,"kg"=>1,"m"=>2,"s"=>-3).MixHash, 
	  names => ['V','volt','volts'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m^2 / s^3', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("s"=>-3,"m"=>2,"kg"=>1).MixHash, 
	  names => ['W','watt','watts'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m^2 / A s^2', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("s"=>-2,"kg"=>1,"m"=>2,"A"=>-1).MixHash, 
	  names => ['Wb','weber','webers'] , stock => True  );

Unit.new( factor => 4046.856422, offset => 0, defn => '43560 square feet', type => '',
	  dims => [2,0,0,0,0,0,0,0], dmix => ("feet"=>2).MixHash, 
	  names => ['acre','acres'] , stock => True  );

Unit.new( factor => 0.00001, offset => 0, defn => '10 millilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['alcohol-unit','alcohol-units'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => '100 square metres', type => '',
	  dims => [2,0,0,0,0,0,0,0], dmix => ("metres"=>2).MixHash, 
	  names => ['are','ares'] , stock => True  );

Unit.new( factor => 101325, offset => 0, defn => '101325 pascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['atm','atms','atmosphere','atmospheres'] , stock => True  );

Unit.new( factor => 149598000000, offset => 0, defn => '1.49598e11 m', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("m"=>1).MixHash, 
	  names => ['au','astronomical-unit','astronomical-units'] , stock => True  );

Unit.new( factor => 100000, offset => 0, defn => '1e5 pascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['bar','bars'] , stock => True  );

Unit.new( factor => 1e-28, offset => 0, defn => '1e-28 square metres', type => '',
	  dims => [2,0,0,0,0,0,0,0], dmix => ("metres"=>2).MixHash, 
	  names => ['barn','barns'] , stock => True  );

Unit.new( factor => 0.16365924, offset => 0, defn => '36 gallons', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("gallons"=>1).MixHash, 
	  names => ['barrel','barrels'] , stock => True  );

Unit.new( factor => 0.00075, offset => 0, defn => '750 millilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['bottle','bottles'] , stock => True  );

Unit.new( factor => 1055.056, offset => 0, defn => '1055.056 joule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['btu','btus','british-thermal-unit','british-thermal-units'] , stock => True  );

Unit.new( factor => 0.03636872, offset => 0, defn => '4 pecks', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("pecks"=>1).MixHash, 
	  names => ['bushel','bushels'] , stock => True  );

Unit.new( factor => 185.2, offset => 0, defn => '185.2 m', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("m"=>1).MixHash, 
	  names => ['ca','cable','cables'] , stock => True  );

Unit.new( factor => 4.184, offset => 0, defn => '4.184 joules', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joules"=>1).MixHash, 
	  names => ['cal','cals','calorie','calories'] , stock => True  );

Unit.new( factor => 0.0002, offset => 0, defn => '200 milligram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['carat','carats','karat','karats'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'cubic centimetre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("metre"=>3).MixHash, 
	  names => ['cc'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'cd', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("cd"=>1).MixHash, 
	  names => ['cd','candela','candelas','candle','candles'] , stock => True  );

Unit.new( factor => 3155760000, offset => 0, defn => '100 yr', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("yr"=>1).MixHash, 
	  names => ['century','centurys','centuries'] , stock => True  );

Unit.new( factor => 0.0002365882365, offset => 0, defn => 'us-pint/2', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("us-pint"=>1).MixHash, 
	  names => ['cup','cups'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => '1 Hz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("Hz"=>1).MixHash, 
	  names => ['cycle','cycles'] , stock => True  );

Unit.new( factor => 86400, offset => 0, defn => '24 hr', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("hr"=>1).MixHash, 
	  names => ['day','days'] , stock => True  );

Unit.new( factor => 0.00030461741978670857, offset => 0, defn => 'deg^2', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("deg"=>2).MixHash, 
	  names => ['deg²','deg²s'] , stock => True  );

Unit.new( factor => 0.001771845195, offset => 0, defn => 'ounce / 16', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("ounce"=>1).MixHash, 
	  names => ['dram','drams'] , stock => True  );

Unit.new( factor => 0.00001, offset => 0, defn => 'gm centimetre / s^2', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("gm"=>1,"s"=>-2,"metre"=>1).MixHash, 
	  names => ['dyne','dynes'] , stock => True  );

Unit.new( factor => 1.60217733e-19, offset => 0, defn => '1.60217733e-19 joule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['eV','electron-volt','electron-volts'] , stock => True  );

Unit.new( factor => 1e-07, offset => 0, defn => '1.0e-7 joule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['erg','ergs'] , stock => True  );

Unit.new( factor => 1.8288, offset => 0, defn => '2 yards', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("yards"=>1).MixHash, 
	  names => ['fathom','fathoms'] , stock => True  );

Unit.new( factor => 0.0007570823568, offset => 0, defn => 'us-gallon/5', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("us-gallon"=>1).MixHash, 
	  names => ['fifth','fifths'] , stock => True  );

Unit.new( factor => 0.04091481, offset => 0, defn => '9 gallons', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("gallons"=>1).MixHash, 
	  names => ['firkin','firkins'] , stock => True  );

Unit.new( factor => 0.000029573529563, offset => 0, defn => 'cup/8', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("cup"=>1).MixHash, 
	  names => ['floz','flozs','fluid-ounce','fluid-ounces'] , stock => True  );

Unit.new( factor => 0.0000035516, offset => 0, defn => '3.5516 millilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['fluidram','fluidrams'] , stock => True  );

Unit.new( factor => 1209600, offset => 0, defn => '2 week', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("week"=>1).MixHash, 
	  names => ['fortnight','fortnights'] , stock => True  );

Unit.new( factor => 0.3048, offset => 0, defn => 'feet per second', type => '',
	  dims => [1,0,-1,0,0,0,0,0], dmix => ("second"=>-1,"feet"=>1).MixHash, 
	  names => ['fps'] , stock => True  );

Unit.new( factor => 0.3048, offset => 0, defn => '0.3048 m', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("m"=>1).MixHash, 
	  names => ['ft','foot','foots','feet','feets'] , stock => True  );

Unit.new( factor => 1.3558179483314004, offset => 0, defn => 'foot pound-force', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("pound-force"=>1,"foot"=>1).MixHash, 
	  names => ['ft-lb','ft-lbs','footpound','footpounds'] , stock => True  );

Unit.new( factor => 201.168, offset => 0, defn => '40 rods', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("rods"=>1).MixHash, 
	  names => ['furlong','furlongs'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'kg / 1000', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("kg"=>1).MixHash, 
	  names => ['g','gram','grams','gm','gramme','grammes'] , stock => True  );

Unit.new( factor => 9.80665, offset => 0, defn => '9.80665 m/s^2', type => '',
	  dims => [1,0,-2,0,0,0,0,0], dmix => ("s"=>-2,"m"=>1).MixHash, 
	  names => ['g0','earth-gravity','earth-gravitys'] , stock => True  );

Unit.new( factor => 0.00454609, offset => 0, defn => '1 imp-gallon', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("imp-gallon"=>1).MixHash, 
	  names => ['gallon','gallons'] , stock => True  );

Unit.new( factor => 0.0001, offset => 0, defn => '1e-4 tesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['gauss'] , stock => True  );

Unit.new( factor => 0.00011829411825, offset => 0, defn => '4 fluid-ounces', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("fluid-ounces"=>1).MixHash, 
	  names => ['gill','gills'] , stock => True  );

Unit.new( factor => 0.0000648, offset => 0, defn => '0.0648 gm', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gm"=>1).MixHash, 
	  names => ['grain','grains'] , stock => True  );

Unit.new( factor => 0.00980665, offset => 0, defn => 'gm g0', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("gm"=>1,"g0"=>1).MixHash, 
	  names => ['gram-force','gram-forces'] , stock => True  );

Unit.new( factor => 10000, offset => 0, defn => '100 ares', type => '',
	  dims => [2,0,0,0,0,0,0,0], dmix => ("ares"=>1).MixHash, 
	  names => ['hectare','hectares'] , stock => True  );

Unit.new( factor => 3600, offset => 0, defn => '60 min', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("min"=>1).MixHash, 
	  names => ['hr','hour','hours'] , stock => True  );

Unit.new( factor => 45.359237, offset => 0, defn => '100 lbm', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("lbm"=>1).MixHash, 
	  names => ['hundredweight','hundredweights'] , stock => True  );

Unit.new( factor => 0.00454609, offset => 0, defn => '4.54609 litre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['imp-gallon','imp-gallons'] , stock => True  );

Unit.new( factor => 0.0005682613, offset => 0, defn => 'imp-gallon/8', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("imp-gallon"=>1).MixHash, 
	  names => ['imp-pint','imp-pints'] , stock => True  );

Unit.new( factor => 0.0254, offset => 0, defn => 'ft/12', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("ft"=>1).MixHash, 
	  names => ['in','inch','inchs'] , stock => True  );

Unit.new( factor => 0.0004, offset => 0, defn => '2 carat', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("carat"=>1).MixHash, 
	  names => ['j-point','j-points'] , stock => True  );

Unit.new( factor => 3600000, offset => 0, defn => 'kilowatt hour', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("watt"=>1,"hour"=>1).MixHash, 
	  names => ['kWh','kWhs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'mol s^-1', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("mol"=>1,"s"=>-1).MixHash, 
	  names => ['kat','kats','katal','katals'] , stock => True  );

Unit.new( factor => 4184, offset => 0, defn => 'kilocalories', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("calories"=>1).MixHash, 
	  names => ['kcal','kcals'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("kg"=>1).MixHash, 
	  names => ['kg','kilogram','kilograms'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m/s', type => '',
	  dims => [1,1,-1,0,0,0,0,0], dmix => ("s"=>-1,"kg"=>1,"m"=>1).MixHash, 
	  names => ['kg m/s'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m^2', type => '',
	  dims => [2,1,0,0,0,0,0,0], dmix => ("m"=>2,"kg"=>1).MixHash, 
	  names => ['kg m^2'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m^2 / s', type => '',
	  dims => [2,1,-1,0,0,0,0,0], dmix => ("m"=>2,"kg"=>1,"s"=>-1).MixHash, 
	  names => ['kg m^2/s'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg / m^3', type => '',
	  dims => [-3,1,0,0,0,0,0,0], dmix => ("kg"=>1,"m"=>-3).MixHash, 
	  names => ['kg/m^3'] , stock => True  );

Unit.new( factor => 9.80665, offset => 0, defn => 'kilo gram-force', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("gram-force"=>1).MixHash, 
	  names => ['kgf','kgfs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['km'] , stock => True  );

Unit.new( factor => 0.514444, offset => 0, defn => 'nmile per hour', type => '',
	  dims => [1,0,-1,0,0,0,0,0], dmix => ("nmile"=>1,"hour"=>-1).MixHash, 
	  names => ['knot','knots'] , stock => True  );

Unit.new( factor => 0.277778, offset => 0, defn => 'kilometre per hour', type => '',
	  dims => [1,0,-1,0,0,0,0,0], dmix => ("metre"=>1,"hour"=>-1).MixHash, 
	  names => ['kph','kphs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilometre per second', type => '',
	  dims => [1,0,-1,0,0,0,0,0], dmix => ("second"=>-1,"metre"=>1).MixHash, 
	  names => ['kps'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'm^3/1000', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("m"=>3).MixHash, 
	  names => ['l','L','litre','litres','liter','liters'] , stock => True  );

Unit.new( factor => 4.4482216152605, offset => 0, defn => 'slug foot / s^2', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("slug"=>1,"foot"=>1,"s"=>-2).MixHash, 
	  names => ['lb','lbs','pound','pounds','pound-force','pound-forces'] , stock => True  );

Unit.new( factor => 0.45359237, offset => 0, defn => '0.45359237 kg', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("kg"=>1).MixHash, 
	  names => ['lbm','lbms','pounds-mass'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'cd sr', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("sr"=>1,"cd"=>1).MixHash, 
	  names => ['lm','lumen','lumens'] , stock => True  );

Unit.new( factor => 1016.0469088, offset => 0, defn => '2240 lbm', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("lbm"=>1).MixHash, 
	  names => ['long-ton','long-tons'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'm^-2 cd', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("m"=>-2,"cd"=>1).MixHash, 
	  names => ['lx','lux','luxs'] , stock => True  );

Unit.new( factor => 9.46e+15, offset => 0, defn => '9.46e15 m', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("m"=>1).MixHash, 
	  names => ['ly','light-year','light-years'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'm', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("m"=>1).MixHash, 
	  names => ['m','metre','metres','meter','meters'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'm/s', type => '',
	  dims => [1,0,-1,0,0,0,0,0], dmix => ("m"=>1,"s"=>-1).MixHash, 
	  names => ['m/s'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'm/s^2', type => '',
	  dims => [1,0,-2,0,0,0,0,0], dmix => ("m"=>1,"s"=>-2).MixHash, 
	  names => ['m/s^2'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'm^2', type => '',
	  dims => [2,0,0,0,0,0,0,0], dmix => ("m"=>2).MixHash, 
	  names => ['m^2','m2','m²'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'm^3', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("m"=>3).MixHash, 
	  names => ['m^3','m3','m³'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => '1000 kg', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("kg"=>1).MixHash, 
	  names => ['metric-ton','metric-tons','tonne','tonnes'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => '1 / ohm', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("ohm"=>-1).MixHash, 
	  names => ['mho','mhos'] , stock => True  );

Unit.new( factor => 1609.344, offset => 0, defn => '5280 ft', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("ft"=>1).MixHash, 
	  names => ['mile','miles'] , stock => True  );

Unit.new( factor => 31557600000, offset => 0, defn => '1000 yr', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("yr"=>1).MixHash, 
	  names => ['millenium','milleniums','millenia','millenias'] , stock => True  );

Unit.new( factor => 60, offset => 0, defn => '60 s', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("s"=>1).MixHash, 
	  names => ['min','mins','minute','minutes'] , stock => True  );

Unit.new( factor => 0.000000059194, offset => 0, defn => '0.059194 millilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['minim','minims'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'mol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['mol','mols','mole','moles'] , stock => True  );

Unit.new( factor => 2629800, offset => 0, defn => 'year / 12', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("year"=>1).MixHash, 
	  names => ['month','months'] , stock => True  );

Unit.new( factor => 0.44704, offset => 0, defn => 'miles per hour', type => '',
	  dims => [1,0,-1,0,0,0,0,0], dmix => ("miles"=>1,"hour"=>-1).MixHash, 
	  names => ['mph','mphs'] , stock => True  );

Unit.new( factor => 1852, offset => 0, defn => '1852 m', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("m"=>1).MixHash, 
	  names => ['nmile','nmiles','nautical-mile','nautical-miles'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => '1', type => '',
	  dims => [0,0,0,0,0,0,0,0], dmix => ().MixHash, 
	  names => ['one','ones','unity','unitys'] , stock => True  );

Unit.new( factor => 0.278013850953781, offset => 0, defn => 'pound-force / 16', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("pound-force"=>1).MixHash, 
	  names => ['ounce-force','ounce-forces'] , stock => True  );

Unit.new( factor => 0.02834952313, offset => 0, defn => 'lbm/16', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("lbm"=>1).MixHash, 
	  names => ['oz','ounce','ounces'] , stock => True  );

Unit.new( factor => 3.083e+16, offset => 0, defn => '3.083e16 m', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("m"=>1).MixHash, 
	  names => ['parsec','parsecs'] , stock => True  );

Unit.new( factor => 0.00909218, offset => 0, defn => '8 quarts', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("quarts"=>1).MixHash, 
	  names => ['peck','pecks'] , stock => True  );

Unit.new( factor => 0.001555, offset => 0, defn => '1.555 gm', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gm"=>1).MixHash, 
	  names => ['pennyweight','pennyweights'] , stock => True  );

Unit.new( factor => 3.1415926535897932385, offset => 0, defn => '3.1415926535897932385', type => '',
	  dims => [0,0,0,0,0,0,0,0], dmix => ().MixHash, 
	  names => ['pi'] , stock => True  );

Unit.new( factor => 0.004233, offset => 0, defn => 'in/6', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("in"=>1).MixHash, 
	  names => ['pica','picas'] , stock => True  );

Unit.new( factor => 0.0005682613, offset => 0, defn => '1 imp-pint', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("imp-pint"=>1).MixHash, 
	  names => ['pint','pints'] , stock => True  );

Unit.new( factor => 0.0003528, offset => 0, defn => 'pica/12', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("pica"=>1).MixHash, 
	  names => ['point','points'] , stock => True  );

Unit.new( factor => 4.4482216152605, offset => 0, defn => 'pound * s', type => '',
	  dims => [1,1,-1,0,0,0,0,0], dmix => ("pound"=>1,"s"=>1).MixHash, 
	  names => ['pound-second','pound-seconds'] , stock => True  );

Unit.new( factor => 6894.75729316836, offset => 0, defn => 'pounds per inch^2', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pounds"=>1,"inch"=>-2).MixHash, 
	  names => ['psi','psis'] , stock => True  );

Unit.new( factor => 0.0011365225, offset => 0, defn => 'gallon/4', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("gallon"=>1).MixHash, 
	  names => ['quart','quarts'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'gray / 100', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['rad','rads'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'radian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['radian','radians'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'Hz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("Hz"=>1).MixHash, 
	  names => ['radians per second','radians per seconds'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'sievert / 100', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['rem','rems'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => '1', type => '',
	  dims => [0,0,0,0,0,0,0,0], dmix => ().MixHash, 
	  names => ['revolution','revolutions'] , stock => True  );

Unit.new( factor => 6.283185307179586477, offset => 0, defn => '2 pi * Hz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("pi"=>1,"Hz"=>1).MixHash, 
	  names => ['revs','revolutions per second','revolutions per seconds'] , stock => True  );

Unit.new( factor => 5.0292, offset => 0, defn => '5.5 yards', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("yards"=>1).MixHash, 
	  names => ['rod','rods','pole','poles','perch','perchs'] , stock => True  );

Unit.new( factor => 0.016667, offset => 0, defn => 'revolutions per minute', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("revolutions"=>1,"minute"=>-1).MixHash, 
	  names => ['rpm','rpms'] , stock => True  );

Unit.new( factor => 376.99111843077518862, offset => 0, defn => '60 revs', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("revs"=>1).MixHash, 
	  names => ['rpm','rpms'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 's', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("s"=>1).MixHash, 
	  names => ['s','second','seconds','sec','secs'] , stock => True  );

Unit.new( factor => 0.001296, offset => 0, defn => '1.296 gm', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gm"=>1).MixHash, 
	  names => ['scruple','scruples'] , stock => True  );

Unit.new( factor => 0.5, offset => 0, defn => '1/2', type => '',
	  dims => [0,0,0,0,0,0,0,0], dmix => ().MixHash, 
	  names => ['semi','semis','demi','demis','hemi','hemis'] , stock => True  );

Unit.new( factor => 14.5939029372064, offset => 0, defn => 'lbm g0 s^2/ft', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("ft"=>-1,"s"=>2,"lbm"=>1,"g0"=>1).MixHash, 
	  names => ['slug','slugs'] , stock => True  );

Unit.new( factor => 4.4482216152605, offset => 0, defn => 'slug feet/s', type => '',
	  dims => [1,1,-1,0,0,0,0,0], dmix => ("feet"=>1,"slug"=>1,"s"=>-1).MixHash, 
	  names => ['slug ft/s'] , stock => True  );

Unit.new( factor => 12.566370614359172954, offset => 0, defn => '4 pi steradians', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("pi"=>1,"steradians"=>1).MixHash, 
	  names => ['sp','spat','spats'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'radian^2', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("radian"=>2).MixHash, 
	  names => ['sr','steradian','steradians'] , stock => True  );

Unit.new( factor => 6.35029318, offset => 0, defn => '14 lbm', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("lbm"=>1).MixHash, 
	  names => ['stone','stones'] , stock => True  );

Unit.new( factor => 0.000014786764781, offset => 0, defn => 'fluid-ounce / 2', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("fluid-ounce"=>1).MixHash, 
	  names => ['tablespoon','tablespoons','tbsp','tbsps'] , stock => True  );

Unit.new( factor => 0.000004928921594, offset => 0, defn => 'tablespoon / 3', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("tablespoon"=>1).MixHash, 
	  names => ['teaspoon','teaspoons','tsp','tsps'] , stock => True  );

Unit.new( factor => 105505600, offset => 0, defn => '1.0e5 btu', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("btu"=>1).MixHash, 
	  names => ['therm','therms'] , stock => True  );

Unit.new( factor => 907.18474, offset => 0, defn => '2000 lbm', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("lbm"=>1).MixHash, 
	  names => ['ton','tons','short-ton','short-tons'] , stock => True  );

Unit.new( factor => 133.322368, offset => 0, defn => '133.322368 pascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['torr','torrs'] , stock => True  );

Unit.new( factor => 0.031103, offset => 0, defn => '31.103 gm', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gm"=>1).MixHash, 
	  names => ['troy-ounce','troy-ounces'] , stock => True  );

Unit.new( factor => 0.373, offset => 0, defn => '0.373 kg', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("kg"=>1).MixHash, 
	  names => ['troy-pound','troy-pounds'] , stock => True  );

Unit.new( factor => 1.6605402e-27, offset => 0, defn => '1.6605402e-27 kg', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("kg"=>1).MixHash, 
	  names => ['u','atomic-mass-unit','atomic-mass-units'] , stock => True  );

Unit.new( factor => 0.003785411784, offset => 0, defn => '3.785411784 litre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['us-gallon','us-gallons'] , stock => True  );

Unit.new( factor => 745.69987158227022, offset => 0, defn => '550 foot pound-force / s', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("pound-force"=>1,"s"=>-1,"foot"=>1).MixHash, 
	  names => ['us-horsepower','us-horsepowers','us-hp','us-hps'] , stock => True  );

Unit.new( factor => 0.000473176473, offset => 0, defn => 'us-gallon/8', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("us-gallon"=>1).MixHash, 
	  names => ['us-pint','us-pints'] , stock => True  );

Unit.new( factor => 604800, offset => 0, defn => '7 days', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("days"=>1).MixHash, 
	  names => ['week','weeks'] , stock => True  );

Unit.new( factor => 0.9144, offset => 0, defn => '3 ft', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("ft"=>1).MixHash, 
	  names => ['yard','yards'] , stock => True  );

Unit.new( factor => 31557600, offset => 0, defn => '365.25 days', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("days"=>1).MixHash, 
	  names => ['yr','year','years'] , stock => True  );

Unit.new( factor => 0.017453292519943295, offset => 0, defn => 'pi radians / 180', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("pi"=>1,"radians"=>1).MixHash, 
	  names => ['°','degree','degrees','deg','degs','º'] , stock => True  );

Unit.new( factor => 1, offset => 273.15, defn => 'K + 273.15', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("K"=>1).MixHash, 
	  names => ['°C','celsius','Centigrade','Centigrades'] , stock => True  );

Unit.new( factor => 0.555556, offset => 459.67, defn => '5/9 * K + 459.67', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("K"=>1).MixHash, 
	  names => ['°F','Fahrenheit','Fahrenheits'] , stock => True  );

Unit.new( factor => 0.555556, offset => 0, defn => '5/9 * K', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("K"=>1).MixHash, 
	  names => ['°R','Rankine','Rankines'] , stock => True  );

Unit.new( factor => 923, offset => 0, defn => '923 kg / m^3', type => '',
	  dims => [-3,1,0,0,0,0,0,0], dmix => ("m"=>-3,"kg"=>1).MixHash, 
	  names => ['°proof','°proofs'] , stock => True  );

Unit.new( factor => 1e-10, offset => 0, defn => '1e-10 m', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("m"=>1).MixHash, 
	  names => ['å','angstrom','angstroms'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kg m^2 / A^2 s^3', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("s"=>-3,"kg"=>1,"m"=>2,"A"=>-2).MixHash, 
	  names => ['Ω','ohm','ohms'] , stock => True  );

Unit.new( factor => 1e-06, offset => 0, defn => '1e-6 m', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("m"=>1).MixHash, 
	  names => ['μ','micron','microns'] , stock => True  );

Unit.new( factor => 0.015707963267948967, offset => 0, defn => 'pi radians / 200', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radians"=>1,"pi"=>1).MixHash, 
	  names => ['ᵍ','gon','gons'] , stock => True  );

######## Stock Unit End ########
}

#EOF
