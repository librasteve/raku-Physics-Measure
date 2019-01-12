#lib/Physics/Measure/Unit.pm6 
unit module Physics::Unit:ver<0.0.2>:auth<Steve Roe (sroe@furnival.net)>;

our %const-defn is export;

#FIXME https://github.com/JJ/p6-math-constants
# Constants
# equatorial radius of the reference geoid:
%const-defn<re0> = '6378388 m';
# polar radius of the reference geoid:
%const-defn<rp0> = '6356912 m';
# speed-of-light
%const-defn<c0> = '2.99792458e8 m/sec',
# earth-gravity
%const-defn<g0>  = '9.80665 m/s^2';
# gravitational-constant
%const-defn<G0>  = '6.6720e-11 m^3 / kg s^2';
# elementary-charge
%const-defn<e0>  = '1.6021766208981892e-19 coulomb';
# Planck-constant:
%const-defn<h0>  = '6.626196e-34 J/s'; # Avogadro-number:
%const-defn<na0> = '6.022169 / mol';
# Boltzmann-constant:
%const-defn<k0> = '1.380648e-23 J/K';
# Gas-constant:
%const-defn<R0> = '8.3144598 kg m^2 / s^2 K mol';

#some common definitions
my regex number {
    \S+                     #grab chars 
    <?{ defined +"$/" }>    #assert coerces via '+' to Real
}

class Unit is export {
    #Parent type for objects that each represent a physical unit with name (e.g.'m') and scale factor 
    #Builds a list of child types such as m, kg, W that can be used directly in calculations
    #Manages rules for synonyms and type conversion, plus physical constants
    #FIXME batten hatches $. => $!
    
    has Str  $.name      is rw;     #e.g. m, meter, meters, metre, metres (usually plural)
    has Str  $.base-name is rw;     #e.g. m always plural
    has Str  $.sing-name is rw;     #singular 
    has Str  $.plur-name is rw;     #plural 

    has Str  $.unitsof   is rw;     #Type of bound Measure child e.g. Distance, Mass, Power...
    has Str  $.dime = 'notset';     #e.g. 'm/s' from defn or decl
    has Int  %.dims;                #hash of dime name => order e.g. ( m => 1, s => -1 ) 
    has Bool $.is-core   is rw;     #core  - has no root Unit
    has Bool $.is-proxy  is rw;     #proxy - handy way to call submethods during init 

    has Unit $.root;
    has Real $.root-factor = 1.0;   #*a from root Unit
    has Real $.root-offset = 0.0;   #+b from root Unit
    
    has Int  $.order = 1;           #order of this unit - e.g. m3 has order 3
    has Bool $.is-nato is rw;       #natural high order - e.g. l has order 1 
    has Bool $.is-comp is rw;       #compound  - e.g. m.s-1
    
    my  Str  %unit-type; 
    my  Str  %unit-base;
    my  Str  %unit-defn;
    my  Str  $unit-names;           #compound names excluded
    my  Str  %unit-sing; 
    my  Str  %unit-plur;
    my  Str  %type-base; 
    my  Array  %unit-syns;          #reverse
             load-units(); 
    my  Str  %unit-dime;            #e.g.'kg.m.s-2' from core units via grammar
             #too slow to load all %unit-dime on start 
    my       %pfix-defn;      #FIXME type
             load-pfixs(); 

    #power synonyms and superscripts
    my %power-syns = ( 
        square => 2, sq => 2, squared => 2,
        cubic => 3, cubed => 3,
    );
    my $power-syns = join('|', %power-syns.keys );

    #x¹ x² x³ x⁴ #x⁻¹ x⁻² x⁻³ x⁻⁴ 
    my %power-sups = ( 
         '¹' =>  1,  '²' =>  2,  '³' =>  3,  '⁴' =>  4,  
        '⁻¹' => -1, '⁻²' => -2, '⁻³' => -3, '⁻⁴' => -4, 
    );
    #say %power-sups{'¹'}; #my $power-sups = "'¹'|'²'";
    my $power-sups = "'" ~ join("'|'", %power-sups.keys ) ~ "'";

    submethod strip-offa( $defn-str is copy ) {
        #prestrip factor & offset from defn
        #e.g. '9/5 * Kelvin - 459.67'
        #https://stackoverflow.com/questions/48972033/perl6-regex-match-num?noredirect=1#comment84964369_48972033
        
        #reject invert 1/x - parsed to x-1 by UG
        if ( $defn-str ~~ m| ^ 1\/ | ) {
            #say "ds: $defn-str";
            return $defn-str;
        }
       
        #strip factor [leading] e.g. 9/5 * Kelvin
        if ( $defn-str ~~ s/( <number>? ) \s* \*? \s* ( .* )/$1/ ) {    #FIXME recheck use of ?
            my $rf-temp = '1.0';
            $rf-temp = $0 if $0 ne '';           #otherwise we get '' (empty string)
            $!root-factor = +"$rf-temp".Real if $rf-temp;
            #say "ds: $defn-str"; say "rf-l: $!root-factor";
        }
       
        #strip factor [trailing] e.g. m^3 / 1000
        if ( $defn-str ~~ s/( .* ) \s* <[/]> \s* ( <number> )/$0/ ) {
            my $rf-temp = '1.0';
            $rf-temp = $1 if $1 ne '';           #otherwise we get '' (empty string)
            $!root-factor = +"$rf-temp".Real if $rf-temp;
            $!root-factor = 1 / $!root-factor;
            #say "ds: $defn-str"; say "rf-t: $!root-factor";
        }
        
        #strip offset 
        if ( $defn-str ~~ s/( .* ) \s* ( <[+-]> \s* <number>? )/$0/ ) {
            my $ro-temp = '0.0';
            $ro-temp = $1 if $1.defined;         #otherwise we get Nil (no match at line end)
            $ro-temp ~~ s:g/\s//;                #erase w/s between sign and digits
            $!root-offset = +"$ro-temp".Real if $ro-temp;
            #say "ds: $defn-str"; say "ro: $!root-offset";
        }
        return $defn-str;
    }

    submethod get-dime( $dime-str is copy ) {
        #https://docs.perl6.org/language/regexes#Regex_Interpolation
        #dd $unit-names; #FIXME change unit-names to List
        #use Grammar::Tracer;

        grammar UnitGrammar is export {
            token TOP     { \s* <dimlist> \s* [<divi> \s* <denlist> \s*]? }
            token dimlist { 1 || <dim>+ % <sep>? }  #was *
            token denlist { <den>* % <sep>? }
            token divi    { \/ || per }
            token sep     { \.|\* }
            token dim     { \s* <unam> \s* <ppfix>? \s* <power>? \s* }
            token den     { \s* <unam> \s* <ppfix>? \s* <power>? \s* }
            token unam    { <$unit-names> }
            token ppfix   { \^|\*\* }
            token power   { <psign> <pdigs> }
            token psign   { <[+-]>? }
            token pdigs   { \d* }
        }
        class UnitActions is export {
            method TOP($/)     { make $<divi> ?? $/.values.[0].made~'.'~$/.values.[1].made !! $/.values.[0].made }
            method dimlist($/) { make $<dim>>>.made.flat.join('.')}
            method dim($/)     { make ~$<unam>~$<power> }
            method denlist($/) { make $<den>>>.made.flat.join('.')}
            method den($/)     { make ~$<power> ?? ~$<unam>~'-'~$<power> !! ~$<unam>~'-1' }
            method divi($/)    { make True }
        }

        #Notes
        #'' and '1' give ''
        #allow whitespace ' kg.m.s-2 ' except within unit names and between sign and powerdigs
        #allow ^ or ** in power
        #allow no . or * as separator
        #allow zero or one / and handle following power signs - NB / then -ve power will barf 'kg**3/s**-3'wrong!!
        #allow per, p, square:d, cube:d, cubic, sq
        #allow unicode superscripts

        #transliterate power synonyms and superscripts
        $dime-str ~~ s/(<$unit-names>) \s* (<$power-sups>)/$0 %power-sups{$1}/;
        $dime-str ~~ s/(<$unit-names>) \s* (<$power-syns>)/$0 %power-syns{$1}/;
        $dime-str ~~ s/(<$power-syns>) \s* (<$unit-names>)/$1 %power-syns{$0}/;

        ######now for the main action######   
        #say "UG.parse dime-str: $dime-str";
        my $match = UnitGrammar.parse($dime-str, :actions(UnitActions));
        return $match.made if $match.so;
      
        #`[[ verbose for debug (also uncomment #use Grammar::Tracer)
        say "$match=", $match.made;
        say "--------------------";
        say $match.values;
        say $match.values.[0].made;
        say $match.values.[1].made;
        say "--------------------";
        say $match<dimlist>.made;
        say $match<dimlist><dim>[0].made;
        say $match<denlist>.made;
        say $match<denlist><den>[0].made;
        #]]
        #['°C', 'Celsius', 'centigrade',],           'K - 273.15',       # exact
    }
    
    my $tw-db = 0; #debug tweak
    submethod set-dims( $input ) {
        my $output = self.get-dime( $input );
        $!dime = $output if $output;   #FIXME? this is loose for graceful failure when debugging
        $!dime ~~ s/ ^ \. //; #need for 1/x otherwise 1 becomes leading empty dim

        #split dime string and load dims hash
        my ( $namstr, $ordint );
        my @dimes = split( '.', $!dime );
        for @dimes -> $dim {
            #say "set-dims() dim is $dim" if $tw-db;
            ( $namstr, $ordint ) = split-order( $dim );
            %!dims{$namstr} = $ordint;
        }
        say "set-dims() name is «$!name» dime string is «$!dime»" if $tw-db;
        #dd %!dims if $tw-db;
    }
    my $pd-db = 0; #debug
    submethod perm-defn() {
        say "Trying to match unitsof to unit-defns from permutations of dime $!dime" if $pd-db;
        for %!dims.keys.permutations -> @dim-perms {
            my @ndims = [];
            for @dim-perms -> $dim-n {
                my $idime = $dim-n;
                $idime ~= %!dims{$dim-n} unless %!dims{$dim-n} == 1;  #suppress trailing 1
                @ndims.push( $idime );
            }
            my $ndime = join( '.', @ndims );
            my $ndim0 = @ndims[0].substr( 0, 1 );
            say "new perm ndime is $ndime; char 0 is $ndim0" if $pd-db;

            for %unit-defn.keys -> $def-k {
                #e.g. where a defn matches one of the perms: m.s-1 => Speed 
                if %unit-defn{$def-k}.index( $ndim0 ).defined {
                    #weed out defns by matching char0, then UG them
                    say "def-k name is $def-k defn is " ~ %unit-defn{$def-k} if $pd-db;
                    my $input  = %unit-defn{$def-k}; 
                    say "input is $input" if $pd-db;
                    my $output = self.get-dime( $input );
                    $output ~~ s/ ^ \. //; #need for 1/x otherwise 1 becomes leading empty dim
                    say "output is $output" if $pd-db; #FIXME stuff like feet, hours -> () ok?
                    if $output eq $ndime {
                        $!name = $def-k;
                        $!unitsof = %unit-type{$def-k}; 
                        say "unit defn found, name is $!name, unitsof is $!unitsof" if $pd-db;
                        return
                    }
                }
            }
        }
    }
    submethod core-proxy() {
        #Make proxy from core root + order, use perm-defn method to find matching defn
        #Usage: must return again after your call to this submethod
        #e.g. m2 => Area, s-1 => Frequency
        
        #catch proxy on recursion and return
        if $!is-proxy {
            self.perm-defn();
            return '', '';
        }

        #concatenate name of core root and order of caller
        my @rl = self.list-roots( [] );             #dd @rl[0];
        unless @rl { return }
        my $cuo = pop( @rl );                       #core-unit-object
        my $name-str    = $cuo.name;
        my $order-str   = $!order == 1 ?? '' !! "$!order";
        my $name-order  = $name-str ~ $order-str;   
        say "proxy name-order is $name-order" if $tw-db; 
        
        #use proxy to make unitsof in usual way, then promote this unitsof to caller
        my $proxy = Unit.new( name => $name-order, is-proxy => True );
        say "core proxy returned is " ~ $proxy.perl if $tw-db;
        $!unitsof = $proxy.unitsof;
        %!dims    = $proxy.dims; 
        return $name-str, $order-str;
    }
    submethod comp-proxy() { 
        #Iterate over Unit @elems to get Type (e.g. Speed) from core unitsof
        #Usage: must return again after your call to this submethod

        my %sort-dims;
        sub dim-sort( $str1, $str2 ) {
            #sort from highest to lowest **order** (e.g. m**2**>s****>kg**-2**)
            my $cmp1 = %sort-dims{$str1};
            my $cmp2 = %sort-dims{$str2};
            #sort alphabetically if same order
            #NB could use collate for .fc (fold-case) but prefer .uc before .lc
            if $cmp1 == $cmp2 { return $str1 cmp $str2 }
            return $cmp2 cmp $cmp1;
        }
        #catch proxy on recursion and return
        if $!is-proxy {
            self.perm-defn();
            return '';
        }
        say "doing comp-proxy: name is «$!name», dime is «$!dime»" if $tw-db;

        #Synthesize unitsof
        say "Synthesizing unitsof from each component of dime $!dime" if $tw-db;
        my @uno-arr;
        my $dim-mix;
        %sort-dims = %!dims;
        for %!dims.keys.sort( &dim-sort ) -> $dim-k {
            my $dim-s = %!dims{$dim-k} == 1 ?? $dim-k !! $dim-k ~ %!dims{$dim-k};
            say "dim-k is $dim-k" if $tw-db; say "dim-s is $dim-s" if $tw-db;

            my $euo = Unit.new( name => $dim-s );   #element-unit-object
            my $euu = $euo.unitsof;                 #keep unitsof for xx 
            say "euo ..." ~ $euo.perl if $tw-db;
            $euo.core-proxy() unless $euo.is-core;
            if $!is-proxy { return; } 
            
            #xx can 'appen that each elem has no unitsof, but comp does (e.g. m.s-2 Acceleration)
            $euu = $euo.unitsof if $euo.unitsof.defined;
            @uno-arr.push( $euu );

            $dim-mix (+)= $euo.dims.Mix;
        }

        my %dim-all = $dim-mix.Hash;
        my @dim-pairs;
        %sort-dims = %dim-all;
        for %dim-all.keys.sort( &dim-sort ) -> $dim-k {
            my $dim-s = %dim-all{$dim-k} == 1 ?? $dim-k !! $dim-k ~ %dim-all{$dim-k};
            @dim-pairs.push( $dim-s );
        }
        my $dime-str = join( '.', @dim-pairs );     say "dime-str is $dime-str" if $tw-db;
        my $uno-str  = join( '.', @uno-arr );       say "uno-str is $uno-str" if $tw-db;
        #FIXME change 🌀Area.Mass to 🌀Area-Mass (kabob-case)

        #use proxy to make unitsof in usual way, then promote this unitsof to invocant unitsof
        #use «nameless» since we are mapping from $!dime-str to $!unitsof
        my $proxy = Unit.new( name => 'nameless', dime => $dime-str, is-proxy => True );
        $!unitsof = $proxy.unitsof // $!unitsof;
        say "comp-proxy returned..." ~ $proxy.perl if $tw-db;
        return( $uno-str );
    }

    submethod TWEAK() {
        #Start with clean up & autogenerate various attributes
        if $!name.defined { 
            say "New instance of Unit setting name to «$!name»" if $tw-db; 
            #iamerejh - next line redundant
            self.name( $!name );
        }
        if $!unitsof.defined { 
            $!unitsof ~~ s|.*\:\:||;
            say "Stripped package prefix unitsof «$!unitsof»" if $tw-db; 
        }
        if $!unitsof.defined && ! $!name.defined {
            say "Autogen default unit name using base name of «$!unitsof»" if $tw-db;
            self.name( %type-base{$!unitsof} ); 
        }
        if ! $!unitsof.defined && $!name.defined {
            if %unit-type{$!name}:exists {
                $!unitsof = %unit-type{$!name}; 
                say "Autogen unitsof «$!unitsof» from unit name «$!name» [P1]" if $tw-db;
                #else see [P2] down below
            }
        }
        #
        #Load dims & roots
        # a. core    - m, s  - is-core
        # b. simple  - miles - walk root to core - root=feet => m
        # c. order   - feet2 - name=feet2; order=2; root=feet =>  m
        # d. nato    - l     - name=l    ; order=1; root=m3 => m  #natural high order units e.g. l
        # e. comp    - m.s-1 - is-comp; dims = elements           #composite
        # a > e > d > c > b > x - handle & return a then reverse sequence
        #
        #Apply UnitGrammar to set $!dime and %!dims...
        # a > e > d > c > b - handle & return (a) then reverse sequence

        #a. core case... (degenerate version of set-dims)
        if %unit-defn{$!name}:exists && %unit-defn{$!name} eq 'core' {
            $!is-core = True;
            $!dime = $!name;
            %!dims{$!name} = $!order;  #i.e. default of 1
            return;
        }
        #...then either (i) match to preset defn or (ii) use name literal to make a synthetic defn
        if %unit-defn{$!name}:exists {                  #say "unit-defn exists";
            #prestrip factor & offset from defn e.g. '9/5 * Kelvin - 459.67'
            my $defn-str = %unit-defn{$!name};
            $defn-str = self.strip-offa( $defn-str );   #say "defn-str is $defn-str";
            self.set-dims( $defn-str );
        } else {
            self.set-dims( $!name );
        }
        
        #e. composite case... 
        if $!dime ~~ / \.+ / {
            #e.g. m.s-1, miles.hours-1, feet.mins-1 - no root tree
            say "presence of '.' in «$!dime» indicates composite ... name is «$!name»" if $tw-db;
            
            #e.g. feet.hours-1 => Speed 
            $!is-comp = True;
            my $uno-str = self.comp-proxy();
            if $!is-proxy { return; } 
            if $!name.defined && $!unitsof.defined { return };

            #e.g. feet3.mins-1 => Volume.Frequency with Artifical Emoji '🌀'
            $uno-str ~~ s:g/'🌀'//;
            $!unitsof = '🌀' ~ $uno-str; 
            say "unitsof is $!unitsof" if $tw-db;

        #d & c. order != 1 case... 
        } elsif $!dime ~~ / \d+ / {
            say "presence of numeral in «$!dime» indicates order !=+1 ... name is «$!name»" if $tw-db;
            
            #synthesize name or mark nato. set root.
            my $root-name;
            if $!name ~~ / \d+ / {
                #e.g. (i)  name is feet2 - set root to m, feet; set order to 2, 2
                ( $root-name, $!order ) = split-order( $!name );
                $!root = Unit.new( name => $root-name );
                say "root-name is «$root-name»; order is «$!order»" if $tw-db;
            } else {
                #e.g. (ii)  name is l,    dime is m3, order is 1, root is m3 [unitsof Volume defined] 
                #e.g. (iii) name is sq m, dime is m2, order is 1, root is m2 [unitsof inferred from root]
                $!is-nato = True;                           #[nato==natural high order]
                $root-name = $!dime;
                $!root = Unit.new( name => $root-name );
                $!unitsof //= $!root.unitsof;
                say "root-name is «$root-name»; order is «$!order»; is-nato" if $tw-db;
                return;
            }

            #there are some definitions of order != 1 using perm code for fuzzy lookup of defn - eg. 1/s or s-1
            if $!unitsof.defined {
                self.perm-defn();
                if $!name.defined && $!unitsof.defined { return }
            }

            #now synthesize a unitsof type (e.g. Time-2) accordingly - NB Type is generic Measure 
            if ! $!unitsof.defined {
                #Autogen unitsof from unit dime P2 - infer Measure type by inspecting core object 
                say "Autogen unitsof from unit dime «$!dime» [P2]" if $tw-db;
                #dd %!dims if $tw-db;
        
                #make proxy from core root + order, use perm-defn method to find matching defn
                #e.g. m2 => Area, s-1 => Frequency
                my ( $name-str, $order-str ) = self.core-proxy();
                if $!is-proxy { return } 

                #otherwise, synthesize artifical unitsof
                if $!name.defined && $!unitsof.defined { 
                    #skip to finally
                } elsif %unit-defn{$name-str}:exists {
                    #e.g. s-2 => Time-2 with Artifical Emoji '🌀'
                    $!unitsof = '🌀' ~ %unit-type{$name-str} ~ $order-str; 
                    say "Synthesizing artificial unitsof is $!unitsof" if $tw-db;
                } else {
                    warn "Unit name «$!name» does not match any Measure type!";
                    return;
                }
            }
            
            #finally, suppress any trailing 1 in dime and name
            #FIXME refactor with ^n ^o into code block?
            my ( $namstr, $ordint ) = split-order( $!dime );
            $!dime = $namstr if $ordint == 1;
            ( $namstr, $ordint ) = split-order( $!name );
            $!name = $namstr if $ordint == 1;

        #b. simple case ... load root tree only where preset defn
        #               ... if synonym, then unit-defn eq base-name
        } elsif %unit-defn{$!name}:exists {
            #recursive walk to root
            $!root = Unit.new( name => $!dime );

        #give up
        } else {
            say "Exhausted Unit cases, no Unit name found ... " if $tw-db;
        }
    }

    method name( $name? ) {
        if $name {
            $!name = $name;
            $!name ~~ s| \s*? $||;  #FIXME should do this in Measure extract
            $!base-name = %unit-base{$name};
            $!sing-name = %unit-sing{$!name}; 
            $!plur-name = %unit-plur{$!name};
            if ! $!sing-name && $!plur-name {
                $!sing-name = %unit-sing{$!plur-name}; 
            } elsif $!sing-name && ! $!plur-name {
                $!plur-name = %unit-plur{$!sing-name};
            }
            say "names set " ~ self.perl if $tw-db;
        } else {
            return $!name;
        }
    }
    method set-sing-name {
        $!name = $!sing-name if $!sing-name;
    }
    method set-plur-name {
        $!name = $!plur-name if $!plur-name;
    }
    method Str {
        return $.name;
    }
    method gist {
        return qq[Physics::Unit::Unit.new(name => "$!name", unitsof => "$!unitsof" ... )];
    }

    method list-roots( @root-instances? ) {
        #recursive walk down unit roots to core returning list of all factors
        #say "...walking root instances..."; dd $!root;
        if $!is-core.defined && $!is-core {
            return( @root-instances );
        } elsif $!root.defined {
            push @root-instances, $!root;
            $!root.list-roots( @root-instances );
        } else {
            return( @root-instances );
        }
    }
    method root-conv-to( $x ) { 
        return( ( $x + $!root-offset ) * $!root-factor );
    }        
    method root-conv-fm( $y ) {    #inverse of root-conv-to
        return( ( $y / $!root-factor ) - $!root-offset );
    }
    method get-type-base {
        return %type-base{$!unitsof};
    }
    
    sub split-order( $string ) {
        #use (i) to split dime string to dims elems in defn and to split name if order
        #use (ii) to split nameorder to name str and order int if != 1
        my Str $i-s = '1';
        $string ~~ / ( <-[\-\d]>+ ) ( \-?\d? ) /;
        say "split-order() str is «$string» xx «$0» «$1»" if $tw-db;
        $i-s = "$1" if $1 ne '';
        return( "$0", +"$i-s".Int );
    }
    sub split-comp( $string ) {
        #split well-formed comp name or dime str => hash with order
        #well formed comp strs are simply feet2; feet.s-1; etc. in desc order
        #never dupes / per etc.
        my @elems = $string.split( '.' );
        my %elem-order;;
        for @elems -> $s {
            my ( $k, $v ) = split-order( $s );
            %elem-order{$k} = $v; 
        }
        return %elem-order;
    }
    sub join-comp( %ord-hash ) {
        #join nams or dims hash with order => name or dime str 
        #make well formed comp strs sorted by desc order

        #FIXME - merge code with other sort sub
        sub ord-sort( $str1, $str2 ) {
            #sort from highest to lowest order
            my $cmp1 = %ord-hash{$str1};
            my $cmp2 = %ord-hash{$str2};
            #sort alphabetically if same order
            #NB could use collate for .fc (fold-case) but prefer .uc before .lc
            if $cmp1 == $cmp2 { return $str1 cmp $str2 }
            return $cmp2 cmp $cmp1;
        }

        my @elems = [];
        my @units = %ord-hash.keys.sort( &ord-sort );
        for @units -> $unit {
            my $order = %ord-hash{$unit};
            if $order == 1 {
                @elems.push( "$unit" );
            } else {
                @elems.push( "$unit$order" );
            }
        }
        return @elems.join( '.' );
    }

    method scalar-combine( Unit $right, Str $oper ) {
        my $sc-db = 0; #debug

        #combine unit names & dimensions for scalar operations (multiply / divide)
        #0. keep names and dims in lockstep
        #1. gather all like names/dims and count sum/diff
        #2. hyper oper mul => +; div => -; 
        #3. see if name exists
        
        my %nnams; my %ndims; my $nuo;
        #use UG to ensure names well formed (m.s-1 NOT m/s)
        my $lnams = self.get-dime( $!name );
        my $rnams = self.get-dime( $right.name );

        #split names into hash with order - apply hyper
        my %lnams = split-comp( $lnams );
        %lnams<unitless>:delete;
        my %rnams = split-comp( $rnams );
        %rnams<unitless>:delete;

        #Fail where same unitsof but different name e.g. '6 m.feet'
        #Nice error message to convert to base type and retry
        #1. check for synonyms (metres => m) FIXME not doing syns yet
        #2. check for same Type, different name, caller must normalise (e.g. feet => m)
        for %lnams.keys -> $l-key {
            for %rnams.keys -> $r-key {
                my $lsu = Unit.new( name => $l-key );
                my $rsu = Unit.new( name => $r-key );
                if $lsu.unitsof eq $rsu.unitsof {
                    if $lsu.name ne $rsu.name {
                        return 0, $nuo;
                    }
                }
            }
        } 
        #FIXME hyper operators brittle - work here since same length - refactor %dims as Mix (?) [not Bag as -ve]
        %nnams = %lnams >>+<< %rnams if $oper eq 'mul';
        %nnams = %lnams >>-<< %rnams if $oper eq 'div';
        for %nnams.keys -> $n-key { 
            %nnams{$n-key}:delete if %nnams{$n-key} == 0; 
        }
        if $sc-db { say "scalar-combine"; dd %lnams; dd %rnams; dd %nnams; }
        
        #join em back and try for early success
        my $synth-name = join-comp( %nnams );                 
        say "gather-nams - synth-name is $synth-name" if $sc-db;
        $nuo = Unit.new( name => $synth-name );               #make name unit obj - base case
        if $nuo.unitsof.defined && ! $nuo.unitsof ~~ '🌀' {
            return 1, $nuo; 
        } else {
            #otherwise unitsof determined via dummy dime assembly
            my %ldims = %!dims; 
            %ldims<unitless>:delete;
            my %rdims = $right.dims;
            %rdims<unitless>:delete;
            %ndims = %ldims >>+<< %rdims if $oper eq 'mul';
            %ndims = %ldims >>-<< %rdims if $oper eq 'div';
            for %ndims.keys -> $n-key { 
                %ndims{$n-key}:delete if %ndims{$n-key} == 0; 
            }
            if ! %ndims { %ndims<unitless> = 1; } 
            if $sc-db { dd %ldims; dd %rdims; dd %ndims; }

            my $synth-dime = join-comp( %ndims );             
            say "gather-dims - synth-dime is $synth-dime" if $sc-db;
            my $duo = Unit.new( name => $synth-dime );
            $nuo = Unit.new( name => $synth-name, unitsof => $duo.unitsof );  #make new unit obj force unitsof
            return 1, $nuo;
        }
    }
    
    #######---HOUSEKEEPING---#######
    sub load-units() {
        my $lu-db = 0; #debug
        my $unit-data = load-unit-data();
        #say "loaded $unit-data" if $lu-db;

        my ( $this-line, $section, $base-unit );
        for $unit-data.lines -> $line {
            $this-line = $line;

            if    $line !~~ m| \S |      { }    #skip empty lines
            elsif $line  ~~ m|^\#(.*)$|  {      #section headers 
                $section = $0;                
                $section ~~ s:g|\s||;
                say "Section:$section" if $lu-db;
                $base-unit = Nil;
            } else {                            #content line
                $this-line ~~ s|\#.*$||;        #strip trailing comments
            
                my Str ($syn-str, $def-str);
                my Str (@syn-arr, @syn-out);
                if  $this-line ~~ m|^ \s* \[ (.*) \] \,.* (\' .* \') \,\s* $|     {
                    $syn-str = $0.Str;
                    $def-str = $1.Str;
                    $def-str ~~ s:g|\'||;
                    say "syn-def:$syn-str:$def-str" if $lu-db;
                    @syn-arr = $syn-str.split(',');
                    for @syn-arr -> Str $item is rw {
                        $item ~~ s:g|\'||;
                        $item ~~ s:g|\s||;
                        @syn-out.push( $item ) if $item;
                    }
                    say "@syn-out", @syn-out if $lu-db;

                    $base-unit = Nil;
                    for @syn-out -> Str $item {                 #plurals
                        my ( $plur, $sing ) = ( Nil, Nil );
                        if $item ~~ m|':'| {
                            $item ~~ m|(.*)':'(.*)|;
                            $sing = "$0";
                            if    $1 eq 's'  { $plur = "$0s"  }
                            elsif $1 eq 'es' { $plur = "$0es" }
                            else             { $plur = "$1"   }
                            if $lu-db { say "sing=$sing"; say "plur=$plur" };
                        } else {
                            $plur = $item;
                        }
                        $base-unit //= $plur;
                        %unit-type{$plur} = $section;
                        %unit-type{$sing} = $section if $sing;
                        %unit-base{$plur} = $base-unit;
                        %unit-base{$sing} = $base-unit if $sing;
                        %unit-sing{$plur} = $sing if $sing;
                        %unit-plur{$sing} = $plur if $sing;
                        %unit-defn{$plur} //= $base-unit;
                        %unit-defn{$sing} //= $base-unit if $sing;
                        %type-base{$section} //= $base-unit;  #just want the first one
                    }
                    say "base-unit=$base-unit" if $lu-db;
                    say "def-str=$def-str" if $lu-db;
                    %unit-defn{$base-unit} = $def-str;
                    %unit-syns{$base-unit} = @syn-out;    #reverse

                }
                else {
                    #say "mismatch:$this-line" if $lu-db;
                }
            }
        } 

        my regex compound {         #FIXME handle 'per'
            < ph | pm | ps > |
            \d+ | \^+ | \/+
        }
        for %unit-defn.keys -> $name {
            $unit-names ~= "|$name" unless ( $name ~~ /<compound>/ );
        }
        $unit-names ~~ s:g/ ( <-[a..z A..Z 0..9 \|]> ) / '$0' /;  #escape everything e.g. unicode
        #FIXME test ph pm ps mph

        #dd %unit-defn;
        if $lu-db {
            #say "%unit-type:"; say %unit-type;
            #say "%unit-base:"; say %unit-base;
            #say "%unit-sing:"; say %unit-sing;
            #say "%unit-plur:"; say %unit-plur;
            #say "%type-base:"; say %type-base;
            #say "%unit-defn"; say %unit-defn;
            #say "unit-names", $unit-names;
            #say "%unit-syns"; say %unit-syns;    #reverse
        }
        return True;
    }

    sub load-pfixs() {
        my @pfix-data = load-pfix-data();
        %pfix-defn = @pfix-data; 
        #say "%pfix-defn"; say %pfix-defn;
        return True;
    }
}

sub load-pfix-data() {
my @pfix-data = (
    'deka',    1e1,
    'deca',    1e1,
    'hecto',   1e2,
    'kilo',    1e3,
    'mega',    1e6,
    'giga',    1e9,
    'tera',    1e12,
    'peta',    1e15,
    'exa',     1e18,
    'zetta',   1e21,
    'yotta',   1e24,
    'deci',    1e-1,
    'centi',   1e-2,
    'milli',   1e-3,
    'micro',   1e-6,
    'nano',    1e-9,
    'pico',    1e-12,
    'femto',   1e-15,
    'atto',    1e-18,
    'zepto',   1e-21,
    'yocto',   1e-24,
    # binary prefixes
    'kibi',    2^10,
    'mebi',    2^20,
    'gibi',    2^30,
    'tebi',    2^40,
    'pebi',    2^50,
    'exbi',    2^60,
    # others
    'hundredth',0.01,
    'tenth',   0.1, 
    'quarter', 0.25,
    'half',    0.5,
    'semi',    0.5,
    'demi',    0.5,
    'hemi',    0.5,
    'hundred', 1e2,
    'thousand',1e3,
    'million', 1e6,
    'billion', 1e9,
    'trillion',1e12,
    'quadrillion',1e15,
);
#say @pfix-data;
return @pfix-data;
}


sub load-unit-data() {

#`[[ fixme add and test
    ['alcohol-unit:s',],                        '10 ml',            # of pure alcohol
    ['deg²',],                                  'deg2',
    ['sp','spat',],                             '4 pi steradians',  #exact
    #fixme test conversion Angle <-> Solid-Angle
#]]

my $unit-data = q:to/END-UNIT-DATA/; 
# Unitless 
    ['unitless',],                              'core',             # core
# Angle
    ['radian:s',],                              'core',
    ['°','degree:s', 'deg',],                   'pi radians / 180',
    ['′','arcminute:s', 'arcmin',],             'deg / 60',         #U+2032
    ['″','arcsecond:s', 'arcsec',],             'arcmin / 60',      #U+2033
    ['ᵍ','gon',],                               'pi radians / 200',
# Solid-Angle
    ['sr','steradian:s',],                      'core',
# Distance
    ['m', 'metre:s', 'meter:s',],               'core',             # core
    ['foot:feet', 'ft', '′',],                  '.3048 m',          # exact U+2032
    ['inch:es', 'in', '″'],                     'feet/12',          # exact U+2033
    ['mil:s',],                                 'in/1000',          # exact
    ['yard:s',],                                '3 feet',           # exact
    ['fathom:s',],                              '2 yards',          # exact
    ['rod:s', 'pole:s', 'perch:es',],           '5.5 yards',        # exact
    ['chain:s',],                               '22 yards',         # exact
    ['furlong:s',],                             '40 rods',          # exact
    ['mile:s', 'mi',],                          '5280 feet',        # exact
    ['μ', 'micron:s', 'um',],                   '1e-6 m',           # exact
    ['å', 'angstrom:s', 'a',],                  '1e-10 m',          # exact
    ['cm',],                                    'centimeter',       # exact
    ['km',],                                    'kilometer',        # exact
    ['pica',],                                  'in/6',    # exact, but see docs 
    ['point',],                                 'pica/12',          # exact
    ['nautical-mile:s', 'nm',],                 '1852 m',           # exact
    ['astronomical-unit:s', 'au',],             '1.49598e11 m',
    ['light-year:s', 'ly',],                    '9.46e15 m',
    ['parsec:s',],                              '3.083e16 m',
# Mass
    ['kg', 'kilogram:s', 'kilogramme:s','kilo:s',], 'core',         # core
    ['gm',],                                    'kilogram/1000',    # exact (FIXME test)
    ['metric-ton:s', 'tonne:s',],               '1000 kg',          # exact
    ['grain:s',],                               '.0648 gm',
    ['pound-mass:pounds-mass', 'lbm:s',],       '0.45359237 kg',    # exact
    ['ounce:s', 'oz',],                         'lbm/16',           # exact
    ['stone:s',],                               '14 lbm',           # exact
    ['hundredweight',],                         '100 lbms',         # exact
    ['ton:s', 'short-ton:s',],                  '2000 lbms',        # exact
    ['long-ton:s',],                            '2240 lbms',        # exact
    ['slug:s',],                                'lbm g0 s^2/feet',  # exact
    ['mg',],                                    'milligram',        # exact
    ['μg', 'ug',],                              'microgram',        # exact
    ['dram:s',],                                'ounce / 16',       # exact
    ['troy-pound:s',],                          '0.373 kg',
    ['troy-ounce:s',],                          '31.103 gm',
    ['pennyweight:s',],                         '1.555 gm',
    ['scruple:s',],                             '1.296 gm',
    ['carat:s', 'karat:s',],                    '200 milligrams',   # exact
    ['j-point:s',],                             '2 carats',         # exact
    ['atomic-mass-unit:s', 'amu', 'u',],        '1.6605402e-27 kg',
# Moment-of-Inertia 
    ['kg m^2',],                                'kg m^2',
# Time
    ['s', 'second:s', 'sec:s',],                'core',             # core
    ['minute:s', 'min:s',],                     '60 s',
    ['hour:s', 'hr:s',],                        '60 min',
    ['day:s',],                                 '24 hr',
    ['week:s', 'wk:s',],                        '7 days',
    ['fortnight:s',],                           '2 week',
    ['year:s', 'yr:s',],                        '365.25 days',
    ['month:s', 'mon:s',],                      'year / 12',    # an average month
    ['score:s',],                               '20 yr',
    ['century:centuries',],                     '100 yr',
    ['millenium:millenia',],                    '1000 yr',
    ['ms', 'msec:s',],                          'millisecond',
    ['μs', 'us', 'μsec:s', 'usec:s',],          'microsecond',
    ['ns', 'nsec:s',],                          'nanosecond',
    ['ps', 'psec:s',],                          'picosecond',
# Frequency
    ['Hz', 'Hertz'],                            '1/s',
    ['cycle:s',],                               '1 Hz',
    ['Becquerel', 'Bq'],                        '1 Hz',
    ['revolution:s', 'rev:s',],                 '1 Hz',
    ['rpm', 'revolutions per minute',],         '1 Hz',
    ['spm', 'strokes per minute',],             '1 Hz',
    ['bpm', 'beats per minute',],               '1 Hz',
# Angular-Speed
    ['radians per second',],                    '2 pi *  hz',
# Speed
    ['m/s',],                                   'm/s',
    ['mph',],                                   'miles/hr',
    ['miles per hour',],                        'miles/hr',
    ['kph',],                                   'km/hr',
    ['kps',],                                   'km/s',
    ['fps',],                                   'feet/s',
    ['knot:s'],                                 'nm/hr',
# Acceleration
    ['m/s^2',],                                 'm/s^2',            # exact 
# Impulse
    ['Ns',],                                    'N * s',
    ['pound-second',],                          'pound * s',
# Momentum
    ['kg m/s',],                                'kg m/s',           # exact 
    ['slug ft/s',],                             'slug feet/s',      # exact 
# Angular-Momentum 
    ['kg m^2 /s',],                             '2 pi kg m^2 /s',
# Data
    ['b', 'bit:s',],                            'core',             # core
    ['B', 'byte:s',],                           '8 bits',
# Substance
    ['mol:s', 'mole:s'],                        'core',             # core
# Money
    ['us-dollar:s', 'dollar:s', '$'],           'core',             # core 
    ['uk-pound:s', 'pound:s', '£'],             'core',             # core
    ['euro:s', '€'],                            'core',             # core
    #FIXME other currencies?
# Current
    ['A', 'amp:s', 'Ampere:s', 'Ampère:s',],    'core',             # core
    ['ma',],                                    'milliamp',
    ['μa', 'ua',],                              'microamp',
# Potential
    ['V', 'volt:s',],                           'kg m^2 / A s^3',
    ['mV',],                                    'millivolt',
    ['μV', 'uv',],                              'microvolt',
# Resistance
    ['Ω', 'Ohm:s',],                            'kg m^2 / A^2 s^3',
    ['kilohm:s',],                              'kilo Ohm',
    ['megohm:s',],                              'mega Ohm',
# Conductance
    ['Siemens',],                               'amp^2 s^3 / kg m^2',
    ['mho:s',],                                 '1/ohm',
# Capacitance
    ['F', 'Farad:s',],                          'amp^2 s^4 / kg m^2',
    ['μF', 'uF',],                              'microFarad',
    ['pF',],                                    'picoFarads',
# Inductance
    ['H', 'Henry:s',],                          'kg m^2 / amp^2 s^2',
    ['μH', 'uh',],                              'microHenry',
    ['mh',],                                    'milliHenry',
# Magnetic-Flux
    ['Wb', 'Weber:s',],                         'kg m^2 / amp s^2',
    ['Mx', 'Maxwell:s',],                       '1e-8 Weber',
# Magnetic-Field
    ['T', 'Tesla:s',],                          'kg / amp sec^2',
    ['Gauss',],                                 '1e-4 Tesla',
# Temperature
    ['K', 'Kelvin',],                           'core',             # core FIXME >0 
    ['°C', 'Celsius', 'centigrade',],           'K + 273.15',       # exact
    ['°F', 'Fahrenheit',],                      '5/9 * K + 459.67', # exact
    ['°R','degree-rankine:degrees-rankine',],   '5/9 * Kelvin',     # exact
# Force
    ['N', 'Newton:s'],                          'kg m / s^2',       # exact
    ['lb:s', 'lbf', 'pound:s', 'pounds-force', 'pounds-weight',],   'slug foot / s^2',  # exact
    ['ounce-force', 'ozf'],                     'pound-force / 16', # exact
    ['dyne:s',],                                'gm cm / s^2',      # exact
    ['gram-weight', 'gram-force',],             'gm g0',            # exact
    ['kgf',],                                   'kilo gram-force',  # exact
# Area
    ['m2',],                                    'm2',
    ['are:s',],                                 '100 square meters',
    ['hectare:s',],                             '100 ares',
    ['acre:s',],                                '43560 square feet',
    ['barn:s',],                                '1e-28 square meters',
# Volume
    ['m3',],                                    'm3',
    ['l', 'litre:s', 'liter:s',],               'm^3/1000',         # exact
    ['cl',],                                    'centiliter',       # exact
    ['dl',],                                    'deciliter',        # exact
    ['cc', 'ml',],                              'cubic centimeter', # exact
    ['us-gallon:s', 'us-gal',],                 '3.785411784 litre',
    ['imp-gallon:s', 'imp-gal',],               '4.54609 litre',    # exact
    ['quart:s', 'qt',],                         'us-gallon/4',
    ['peck:s',],                                '8 quarts',
    ['bushel:s'],                               '4 pecks',
    ['fifth:s'],                                'us-gallon/5',
    ['us-pint:s', 'us-pt',],                    'us-gallon/8',
    ['imp-pint:s', 'imp-pt',],                  'imp-gallon/8',
    ['cup:s'],                                  'us-pint/2',
    ['floz', 'fluid-ounce:s', fluidounce:s',],  'cup/8',
    ['gill:s'],                                 '4 fluid-ounces',
    ['tablespoon:s', 'tbsp',],                  'fluid-ounce / 2',
    ['teaspoon:s', 'tsp',],                     'tablespoon / 3',
    ['fluidram:s',],                            '3.5516 cc',
    ['minim:s',],                               '0.059194 cc',
# Power
    ['W', 'watt:s',],                           'kg m^2 / s^3',
    ['us-horsepower', 'us-hp',],                '550 foot pound-force / s',
    ['PS', 'met-horsepower', 'met-hp',],        '75 kg * g0 * m / s',
# Energy
    ['J', 'Joule:s',],                          'kg m^2 / s^2',     # exact
    ['eV', 'electron-volt:s', 'electronvolt:s',], 'e0 Joule',
    ['meV',],                                   'mega electron-volt',
    ['geV',],                                   'giga electron-volt',
    ['teV',],                                   'tera electron-volt',
    ['calorie:s', 'cal',],                      '4.184 Joules',     # exact
    ['kcal',],                                  'kilocalorie',      # exact 
    ['btu:s', 'british-thermal-unit:s',],       '1055.056 Joule',
    ['therm:s',],                               '1.0e5 btu',
    ['erg:s',],                                 '1.0e-7 Joule',     # exact
    ['kWh',],                                   'kilowatt hour',    # exact
# Luminosity
    ['cd', 'candela:s', 'candle:s',],           '1/683 * watt / steradian', # exact
# Torque
    ['Nm', 'Newton-metre:s],                    'N m',              # exact 
    #['ft-lb', 'ftlb', 'footpound:s', 'foot-pounds:s',], 'foot pound-force',
# Charge
    ['C', 'coulomb:s',],                        'Ampere second',
# Pressure
    ['Pa', 'Pascal:s',],                        'Newton / m^2',
    ['bar:s',],                                 '1e5 Pascal',
    ['Torr',],                                  '(101325 / 760) Pascal',
    ['psi',],                                   'pounds per inch^2',
    ['atm', 'atmosphere:s',],                   '101325 Pascal',  # exact
# Dose
    ['Gy', 'Gray:s',],                          'Joule / kg',
    ['Sv', 'Sievert',],                         'Joule / kg',
    ['rad',],                                   'Gray / 100',
    ['rem',],                                   'Sievert / 100',
END-UNIT-DATA

    #say "gulping $unit-data";
    return $unit-data;
}
#]]]]

