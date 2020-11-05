unit module Physics::UnitAffix:ver<0.0.4>:auth<Steve Roe (p6steve@furnival.net)>;
use Physics::Unit;

#[off ~ 65s / on ~ 11s / precomp ~ 1.7s ]

LoadAffixUnits();
LoadAffixOps();

#approx. 600 units == ~2400 more lines...
#some individual units commented out as already defined in Physics::Unit

sub LoadAffixUnits {

#approx. 600 units == ~2,400 lines...
##### Affix Unit Start #####
Unit.new( factor => 10, offset => 0, defn => 'dekametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['dam','dams'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['hm'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Mm'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Gm'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Tm'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Pm'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Em'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Zm'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Ym'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decimetre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['dm'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centimetre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['cm'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millimetre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['mm'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'micrometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['μm'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['nm'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['pm'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['fm'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['am'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['zm'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['ym'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'dekagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['dag','dags'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'hectogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['hg'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'megagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Mg'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'gigagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Gg'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'teragram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Tg'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'petagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Pg'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'exagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Eg'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'zettagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Zg'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'yottagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Yg'], stock => True );

Unit.new( factor => 0.0001, offset => 0, defn => 'decigram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['dg'], stock => True );

Unit.new( factor => 0.00001, offset => 0, defn => 'centigram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['cg'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'milligram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['mg'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'microgram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['μg'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'nanogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['ng'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'picogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['pg'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'femtogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['fg'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'attogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['ag'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'zeptogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['zg'], stock => True );

Unit.new( factor => 1e-27, offset => 0, defn => 'yoctogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['yg'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['das'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['hs'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ks'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Ms'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Gs'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Ts'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Ps'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Es'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Zs'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Ys'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decisecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ds'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centisecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['cs'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millisecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ms'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microsecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['μs'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ns'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ps'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['fs'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['as'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['zs'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ys'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['daA','daAs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['hA'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kiloamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['kA'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['MA'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['GA'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teraamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['TA'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['PA'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['EA'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['ZA'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['YA'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'deciamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['dA'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centiamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['cA'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'milliamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['mA'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['μA'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['nA'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['pA'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['fA'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['aA'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['zA'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['yA'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['daK','daKs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['hK'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['kK'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['MK'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['GK'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['TK'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['PK'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['EK'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['ZK'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['YK'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decikelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['dK'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centikelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['cK'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millikelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['mK'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microkelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['μK'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['nK'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['pK'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['fK'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['aK'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['zK'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['yK'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['damol','damols'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['hmol','hmols'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['kmol','kmols'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Mmol','Mmols'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Gmol','Gmols'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teramol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Tmol','Tmols'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Pmol','Pmols'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'examol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Emol','Emols'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Zmol','Zmols'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Ymol','Ymols'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decimol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['dmol','dmols'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centimol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['cmol','cmols'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millimol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['mmol','mmols'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'micromol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['μmol','μmols'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['nmol','nmols'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['pmol','pmols'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['fmol','fmols'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['amol','amols'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['zmol','zmols'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['ymol','ymols'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['dacd','dacds'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['hcd','hcds'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['kcd','kcds'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Mcd','Mcds'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Gcd','Gcds'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teracandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Tcd','Tcds'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Pcd','Pcds'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Ecd','Ecds'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Zcd','Zcds'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Ycd','Ycds'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decicandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['dcd','dcds'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centicandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['ccd','ccds'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millicandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['mcd','mcds'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microcandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['μcd','μcds'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['ncd','ncds'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['pcd','pcds'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['fcd','fcds'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['acd','acds'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['zcd','zcds'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['ycd','ycds'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'hertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['Hz'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['daHz','daHzs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['hHz','hHzs'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['kHz','kHzs'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['MHz','MHzs'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['GHz','GHzs'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['THz','THzs'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['PHz','PHzs'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['EHz','EHzs'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['ZHz','ZHzs'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['YHz','YHzs'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decihertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['dHz','dHzs'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centihertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['cHz','cHzs'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millihertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['mHz','mHzs'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microhertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['μHz','μHzs'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['nHz','nHzs'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['pHz','pHzs'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['fHz','fHzs'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['aHz','aHzs'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['zHz','zHzs'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['yHz','yHzs'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'newton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['N'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['daN','daNs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['hN'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['kN'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'meganewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['MN'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'giganewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['GN'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teranewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['TN'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['PN'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['EN'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['ZN'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['YN'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decinewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['dN'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centinewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['cN'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millinewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['mN'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'micronewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['μN'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['nN'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'piconewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['pN'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['fN'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['aN'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['zN'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['yN'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'pascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['Pa'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['daPa','daPas'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['hPa','hPas'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['kPa','kPas'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['MPa','MPas'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['GPa','GPas'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['TPa','TPas'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['PPa','PPas'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['EPa','EPas'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['ZPa','ZPas'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['YPa','YPas'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decipascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['dPa','dPas'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centipascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['cPa','cPas'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millipascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['mPa','mPas'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'micropascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['μPa','μPas'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['nPa','nPas'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['pPa','pPas'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['fPa','fPas'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['aPa','aPas'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['zPa','zPas'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['yPa','yPas'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'joule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['J'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['daJ','daJs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['hJ'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['kJ'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['MJ'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['GJ'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['TJ'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['PJ'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['EJ'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['ZJ'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['YJ'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decijoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['dJ'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centijoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['cJ'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millijoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['mJ'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microjoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['μJ'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['nJ'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['pJ'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['fJ'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['aJ'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['zJ'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['yJ'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'watt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['W'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['daW','daWs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['hW'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['kW'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['MW'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['GW'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['TW'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['PW'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['EW'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['ZW'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['YW'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'deciwatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['dW'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centiwatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['cW'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'milliwatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['mW'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microwatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['μW'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['nW'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['pW'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['fW'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['aW'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['zW'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['yW'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'coulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['C'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['daC','daCs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['hC'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['kC'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['MC'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['GC'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teracoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['TC'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['PC'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['EC'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['ZC'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['YC'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decicoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['dC'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centicoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['cC'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millicoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['mC'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microcoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['μC'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['nC'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['pC'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['fC'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['aC'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['zC'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['yC'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'volt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['V'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['daV','daVs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['hV'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['kV'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['MV'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['GV'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teravolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['TV'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['PV'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['EV'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['ZV'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['YV'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decivolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['dV'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centivolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['cV'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millivolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['mV'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microvolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['μV'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['nV'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['pV'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['fV'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['aV'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['zV'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['yV'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'farad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['F'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['daF','daFs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['hF'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['kF'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['MF'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['GF'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['TF'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['PF'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['EF'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['ZF'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['YF'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decifarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['dF'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centifarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['cF'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millifarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['mF'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microfarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['μF'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['nF'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['pF'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['fF'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['aF'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['zF'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['yF'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'ohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['Ω'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['daΩ','daΩs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['hΩ'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kiloohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['kΩ'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['MΩ'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['GΩ'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teraohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['TΩ'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['PΩ'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['EΩ'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['ZΩ'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['YΩ'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'deciohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['dΩ'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centiohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['cΩ'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'milliohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['mΩ'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['μΩ'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['nΩ'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['pΩ'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['fΩ'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['aΩ'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['zΩ'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['yΩ'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'siemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['S'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['daS','daSs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['hS'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['kS'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['MS'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['GS'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['TS'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['PS'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['ES'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['ZS'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['YS'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decisiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['dS'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centisiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['cS'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millisiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['mS'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microsiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['μS'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['nS'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['pS'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['fS'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['aS'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['zS'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['yS'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'weber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['Wb'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['daWb','daWbs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['hWb','hWbs'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kiloweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['kWb','kWbs'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['MWb','MWbs'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['GWb','GWbs'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teraweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['TWb','TWbs'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['PWb','PWbs'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['EWb','EWbs'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['ZWb','ZWbs'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['YWb','YWbs'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'deciweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['dWb','dWbs'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centiweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['cWb','cWbs'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'milliweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['mWb','mWbs'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['μWb','μWbs'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['nWb','nWbs'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['pWb','pWbs'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['fWb','fWbs'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['aWb','aWbs'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['zWb','zWbs'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['yWb','yWbs'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'tesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['T'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['daT','daTs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['hT'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['kT'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['MT'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['GT'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teratesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['TT'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['PT'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['ET'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['ZT'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['YT'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decitesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['dT'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centitesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['cT'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millitesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['mT'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microtesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['μT'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['nT'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['pT'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['fT'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['aT'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['zT'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['yT'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'henry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['H'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['daH','daHs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['hH'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['kH'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['MH'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['GH'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['TH'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['PH'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['EH'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['ZH'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['YH'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decihenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['dH'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centihenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['cH'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millihenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['mH'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microhenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['μH'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['nH'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['pH'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['fH'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['aH'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['zH'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['yH'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'lumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['lm'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['dalm','dalms'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['hlm','hlms'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['klm','klms'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Mlm','Mlms'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Glm','Glms'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teralumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Tlm','Tlms'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Plm','Plms'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Elm','Elms'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Zlm','Zlms'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Ylm','Ylms'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decilumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['dlm','dlms'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centilumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['clm','clms'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millilumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['mlm','mlms'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microlumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['μlm','μlms'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['nlm','nlms'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['plm','plms'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['flm','flms'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['alm','alms'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['zlm','zlms'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['ylm','ylms'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'lux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['lx'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['dalx','dalxs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['hlx','hlxs'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['klx','klxs'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Mlx','Mlxs'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Glx','Glxs'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teralux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Tlx','Tlxs'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Plx','Plxs'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Elx','Elxs'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Zlx','Zlxs'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Ylx','Ylxs'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decilux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['dlx','dlxs'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centilux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['clx','clxs'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millilux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['mlx','mlxs'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microlux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['μlx','μlxs'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['nlx','nlxs'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['plx','plxs'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['flx','flxs'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['alx','alxs'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['zlx','zlxs'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['ylx','ylxs'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'becquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['Bq'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['daBq','daBqs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['hBq','hBqs'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['kBq','kBqs'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['MBq','MBqs'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['GBq','GBqs'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['TBq','TBqs'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['PBq','PBqs'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['EBq','EBqs'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['ZBq','ZBqs'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['YBq','YBqs'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decibecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['dBq','dBqs'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centibecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['cBq','cBqs'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millibecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['mBq','mBqs'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microbecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['μBq','μBqs'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['nBq','nBqs'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['pBq','pBqs'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['fBq','fBqs'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['aBq','aBqs'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['zBq','zBqs'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['yBq','yBqs'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'gray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['Gy'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['daGy','daGys'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['hGy','hGys'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['kGy','kGys'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['MGy','MGys'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['GGy','GGys'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teragray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['TGy','TGys'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['PGy','PGys'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['EGy','EGys'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['ZGy','ZGys'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['YGy','YGys'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decigray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['dGy','dGys'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centigray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['cGy','cGys'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'milligray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['mGy','mGys'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microgray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['μGy','μGys'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['nGy','nGys'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['pGy','pGys'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['fGy','fGys'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['aGy','aGys'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['zGy','zGys'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['yGy','yGys'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'sievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['Sv'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['daSv','daSvs'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['hSv','hSvs'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['kSv','kSvs'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['MSv','MSvs'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['GSv','GSvs'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['TSv','TSvs'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['PSv','PSvs'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['ESv','ESvs'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['ZSv','ZSvs'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['YSv','YSvs'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decisievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['dSv','dSvs'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centisievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['cSv','cSvs'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millisievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['mSv','mSvs'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microsievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['μSv','μSvs'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['nSv','nSvs'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['pSv','pSvs'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['fSv','fSvs'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['aSv','aSvs'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['zSv','zSvs'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['ySv','ySvs'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'katal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['kat','kats'], stock => True );

Unit.new( factor => 10, offset => 0, defn => 'dekakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['dakat','dakats'], stock => True );

Unit.new( factor => 100, offset => 0, defn => 'hectokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['hkat','hkats'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'kilokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['kkat','kkats'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'megakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Mkat','Mkats'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Gkat','Gkats'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Tkat','Tkats'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Pkat','Pkats'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Ekat','Ekats'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Zkat','Zkats'], stock => True );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Ykat','Ykats'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'decikatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['dkat','dkats'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'centikatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['ckat','ckats'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'millikatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['mkat','mkats'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'microkatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['μkat','μkats'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['nkat','nkats'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['pkat','pkats'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['fkat','fkats'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['akat','akats'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['zkat','zkats'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['ykat','ykats'], stock => True );

Unit.new( factor => 0.001, offset => 0, defn => 'litre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['l'], stock => True );

Unit.new( factor => 0.01, offset => 0, defn => 'dekalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['dal','dals'], stock => True );

Unit.new( factor => 0.1, offset => 0, defn => 'hectolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['hl'], stock => True );

Unit.new( factor => 1, offset => 0, defn => 'kilolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['kl'], stock => True );

Unit.new( factor => 1000, offset => 0, defn => 'megalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Ml'], stock => True );

Unit.new( factor => 1000000, offset => 0, defn => 'gigalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Gl'], stock => True );

Unit.new( factor => 1000000000, offset => 0, defn => 'teralitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Tl'], stock => True );

Unit.new( factor => 1000000000000, offset => 0, defn => 'petalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Pl'], stock => True );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'exalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['El'], stock => True );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'zettalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Zl'], stock => True );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'yottalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Yl'], stock => True );

Unit.new( factor => 0.0001, offset => 0, defn => 'decilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['dl'], stock => True );

Unit.new( factor => 0.00001, offset => 0, defn => 'centilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['cl'], stock => True );

Unit.new( factor => 0.000001, offset => 0, defn => 'millilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['ml'], stock => True );

Unit.new( factor => 0.000000001, offset => 0, defn => 'microlitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['μl'], stock => True );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'nanolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['nl'], stock => True );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'picolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['pl'], stock => True );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'femtolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['fl'], stock => True );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'attolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['al'], stock => True );

Unit.new( factor => 1e-24, offset => 0, defn => 'zeptolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['zl'], stock => True );

Unit.new( factor => 1e-27, offset => 0, defn => 'yoctolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['yl'], stock => True );

###### Affix Unit End ######
}


##### Postfix Unit Export Start #####
sub do-postfix( Real $v, Str $n ) is export {
    my $nuo = GetUnit( $n );
    my $n-type = $nuo.type( just1 => 1 );

	{ 
		use Physics::Measure;						#limited to this block
        return ::($n-type).new(value => $v, units => $nuo);
	} 
} 

#e.g. sub postfix:<m> ( Real:D $x ) is export { do-postfix( $x, 'm' ) }

sub LoadAffixOps {

#First a few "non-declining singletons"...
sub postfix:<°> (Real:D $x) is export { do-postfix($x,'°') }
sub postfix:<radian> (Real:D $x) is export { do-postfix($x,'radian') }
sub postfix:<steradian> (Real:D $x) is export { do-postfix($x,'steradian') }
sub postfix:<°C> (Real:D $x) is export { do-postfix($x,'°C') }

#Then approx. 600 Affix Ops == ~600 more lines...
##### Affix Ops Start #####
sub postfix:<m> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'m') }
sub postfix:<dam> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'dam') }
sub postfix:<hm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'hm') }
sub postfix:<km> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'km') }
sub postfix:<Mm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Mm') }
sub postfix:<Gm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Gm') }
sub postfix:<Tm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Tm') }
sub postfix:<Pm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Pm') }
sub postfix:<Em> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Em') }
sub postfix:<Zm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Zm') }
sub postfix:<Ym> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Ym') }
sub postfix:<dm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'dm') }
sub postfix:<cm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'cm') }
sub postfix:<mm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'mm') }
sub postfix:<μm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'μm') }
sub postfix:<nm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'nm') }
sub postfix:<pm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'pm') }
sub postfix:<fm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'fm') }
sub postfix:<am> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'am') }
sub postfix:<zm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'zm') }
sub postfix:<ym> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ym') }
sub postfix:<g> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'g') }
sub postfix:<dag> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'dag') }
sub postfix:<hg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'hg') }
sub postfix:<kg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'kg') }
sub postfix:<Mg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Mg') }
sub postfix:<Gg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Gg') }
sub postfix:<Tg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Tg') }
sub postfix:<Pg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Pg') }
sub postfix:<Eg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Eg') }
sub postfix:<Zg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Zg') }
sub postfix:<Yg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Yg') }
sub postfix:<dg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'dg') }
sub postfix:<cg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'cg') }
sub postfix:<mg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'mg') }
sub postfix:<μg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'μg') }
sub postfix:<ng> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ng') }
sub postfix:<pg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'pg') }
sub postfix:<fg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'fg') }
sub postfix:<ag> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ag') }
sub postfix:<zg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'zg') }
sub postfix:<yg> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'yg') }
sub postfix:<s> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'s') }
sub postfix:<das> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'das') }
sub postfix:<hs> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'hs') }
sub postfix:<ks> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ks') }
sub postfix:<Ms> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Ms') }
sub postfix:<Gs> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Gs') }
sub postfix:<Ts> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Ts') }
sub postfix:<Ps> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Ps') }
sub postfix:<Es> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Es') }
sub postfix:<Zs> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Zs') }
sub postfix:<Ys> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Ys') }
sub postfix:<ds> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ds') }
sub postfix:<cs> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'cs') }
sub postfix:<ms> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ms') }
sub postfix:<μs> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'μs') }
sub postfix:<ns> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ns') }
sub postfix:<ps> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ps') }
sub postfix:<fs> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'fs') }
sub postfix:<as> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'as') }
sub postfix:<zs> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'zs') }
sub postfix:<ys> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ys') }
sub postfix:<A> (Real:D $x) is export(:electrical) { do-postfix($x,'A') }
sub postfix:<daA> (Real:D $x) is export(:electrical) { do-postfix($x,'daA') }
sub postfix:<hA> (Real:D $x) is export(:electrical) { do-postfix($x,'hA') }
sub postfix:<kA> (Real:D $x) is export(:electrical) { do-postfix($x,'kA') }
sub postfix:<MA> (Real:D $x) is export(:electrical) { do-postfix($x,'MA') }
sub postfix:<GA> (Real:D $x) is export(:electrical) { do-postfix($x,'GA') }
sub postfix:<TA> (Real:D $x) is export(:electrical) { do-postfix($x,'TA') }
sub postfix:<PA> (Real:D $x) is export(:electrical) { do-postfix($x,'PA') }
sub postfix:<EA> (Real:D $x) is export(:electrical) { do-postfix($x,'EA') }
sub postfix:<ZA> (Real:D $x) is export(:electrical) { do-postfix($x,'ZA') }
sub postfix:<YA> (Real:D $x) is export(:electrical) { do-postfix($x,'YA') }
sub postfix:<dA> (Real:D $x) is export(:electrical) { do-postfix($x,'dA') }
sub postfix:<cA> (Real:D $x) is export(:electrical) { do-postfix($x,'cA') }
sub postfix:<mA> (Real:D $x) is export(:electrical) { do-postfix($x,'mA') }
sub postfix:<μA> (Real:D $x) is export(:electrical) { do-postfix($x,'μA') }
sub postfix:<nA> (Real:D $x) is export(:electrical) { do-postfix($x,'nA') }
sub postfix:<pA> (Real:D $x) is export(:electrical) { do-postfix($x,'pA') }
sub postfix:<fA> (Real:D $x) is export(:electrical) { do-postfix($x,'fA') }
sub postfix:<aA> (Real:D $x) is export(:electrical) { do-postfix($x,'aA') }
sub postfix:<zA> (Real:D $x) is export(:electrical) { do-postfix($x,'zA') }
sub postfix:<yA> (Real:D $x) is export(:electrical) { do-postfix($x,'yA') }
sub postfix:<K> (Real:D $x) is export(:mechanical) { do-postfix($x,'K') }
sub postfix:<daK> (Real:D $x) is export(:mechanical) { do-postfix($x,'daK') }
sub postfix:<hK> (Real:D $x) is export(:mechanical) { do-postfix($x,'hK') }
sub postfix:<kK> (Real:D $x) is export(:mechanical) { do-postfix($x,'kK') }
sub postfix:<MK> (Real:D $x) is export(:mechanical) { do-postfix($x,'MK') }
sub postfix:<GK> (Real:D $x) is export(:mechanical) { do-postfix($x,'GK') }
sub postfix:<TK> (Real:D $x) is export(:mechanical) { do-postfix($x,'TK') }
sub postfix:<PK> (Real:D $x) is export(:mechanical) { do-postfix($x,'PK') }
sub postfix:<EK> (Real:D $x) is export(:mechanical) { do-postfix($x,'EK') }
sub postfix:<ZK> (Real:D $x) is export(:mechanical) { do-postfix($x,'ZK') }
sub postfix:<YK> (Real:D $x) is export(:mechanical) { do-postfix($x,'YK') }
sub postfix:<dK> (Real:D $x) is export(:mechanical) { do-postfix($x,'dK') }
sub postfix:<cK> (Real:D $x) is export(:mechanical) { do-postfix($x,'cK') }
sub postfix:<mK> (Real:D $x) is export(:mechanical) { do-postfix($x,'mK') }
sub postfix:<μK> (Real:D $x) is export(:mechanical) { do-postfix($x,'μK') }
sub postfix:<nK> (Real:D $x) is export(:mechanical) { do-postfix($x,'nK') }
sub postfix:<pK> (Real:D $x) is export(:mechanical) { do-postfix($x,'pK') }
sub postfix:<fK> (Real:D $x) is export(:mechanical) { do-postfix($x,'fK') }
sub postfix:<aK> (Real:D $x) is export(:mechanical) { do-postfix($x,'aK') }
sub postfix:<zK> (Real:D $x) is export(:mechanical) { do-postfix($x,'zK') }
sub postfix:<yK> (Real:D $x) is export(:mechanical) { do-postfix($x,'yK') }
sub postfix:<mol> (Real:D $x) is export(:mechanical) { do-postfix($x,'mol') }
sub postfix:<damol> (Real:D $x) is export(:mechanical) { do-postfix($x,'damol') }
sub postfix:<hmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'hmol') }
sub postfix:<kmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'kmol') }
sub postfix:<Mmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'Mmol') }
sub postfix:<Gmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'Gmol') }
sub postfix:<Tmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'Tmol') }
sub postfix:<Pmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'Pmol') }
sub postfix:<Emol> (Real:D $x) is export(:mechanical) { do-postfix($x,'Emol') }
sub postfix:<Zmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'Zmol') }
sub postfix:<Ymol> (Real:D $x) is export(:mechanical) { do-postfix($x,'Ymol') }
sub postfix:<dmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'dmol') }
sub postfix:<cmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'cmol') }
sub postfix:<mmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'mmol') }
sub postfix:<μmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'μmol') }
sub postfix:<nmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'nmol') }
sub postfix:<pmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'pmol') }
sub postfix:<fmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'fmol') }
sub postfix:<amol> (Real:D $x) is export(:mechanical) { do-postfix($x,'amol') }
sub postfix:<zmol> (Real:D $x) is export(:mechanical) { do-postfix($x,'zmol') }
sub postfix:<ymol> (Real:D $x) is export(:mechanical) { do-postfix($x,'ymol') }
sub postfix:<cd> (Real:D $x) is export(:universal) { do-postfix($x,'cd') }
sub postfix:<dacd> (Real:D $x) is export(:universal) { do-postfix($x,'dacd') }
sub postfix:<hcd> (Real:D $x) is export(:universal) { do-postfix($x,'hcd') }
sub postfix:<kcd> (Real:D $x) is export(:universal) { do-postfix($x,'kcd') }
sub postfix:<Mcd> (Real:D $x) is export(:universal) { do-postfix($x,'Mcd') }
sub postfix:<Gcd> (Real:D $x) is export(:universal) { do-postfix($x,'Gcd') }
sub postfix:<Tcd> (Real:D $x) is export(:universal) { do-postfix($x,'Tcd') }
sub postfix:<Pcd> (Real:D $x) is export(:universal) { do-postfix($x,'Pcd') }
sub postfix:<Ecd> (Real:D $x) is export(:universal) { do-postfix($x,'Ecd') }
sub postfix:<Zcd> (Real:D $x) is export(:universal) { do-postfix($x,'Zcd') }
sub postfix:<Ycd> (Real:D $x) is export(:universal) { do-postfix($x,'Ycd') }
sub postfix:<dcd> (Real:D $x) is export(:universal) { do-postfix($x,'dcd') }
sub postfix:<ccd> (Real:D $x) is export(:universal) { do-postfix($x,'ccd') }
sub postfix:<mcd> (Real:D $x) is export(:universal) { do-postfix($x,'mcd') }
sub postfix:<μcd> (Real:D $x) is export(:universal) { do-postfix($x,'μcd') }
sub postfix:<ncd> (Real:D $x) is export(:universal) { do-postfix($x,'ncd') }
sub postfix:<pcd> (Real:D $x) is export(:universal) { do-postfix($x,'pcd') }
sub postfix:<fcd> (Real:D $x) is export(:universal) { do-postfix($x,'fcd') }
sub postfix:<acd> (Real:D $x) is export(:universal) { do-postfix($x,'acd') }
sub postfix:<zcd> (Real:D $x) is export(:universal) { do-postfix($x,'zcd') }
sub postfix:<ycd> (Real:D $x) is export(:universal) { do-postfix($x,'ycd') }
sub postfix:<Hz> (Real:D $x) is export(:mechanical) { do-postfix($x,'Hz') }
sub postfix:<daHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'daHz') }
sub postfix:<hHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'hHz') }
sub postfix:<kHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'kHz') }
sub postfix:<MHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'MHz') }
sub postfix:<GHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'GHz') }
sub postfix:<THz> (Real:D $x) is export(:mechanical) { do-postfix($x,'THz') }
sub postfix:<PHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'PHz') }
sub postfix:<EHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'EHz') }
sub postfix:<ZHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'ZHz') }
sub postfix:<YHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'YHz') }
sub postfix:<dHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'dHz') }
sub postfix:<cHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'cHz') }
sub postfix:<mHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'mHz') }
sub postfix:<μHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'μHz') }
sub postfix:<nHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'nHz') }
sub postfix:<pHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'pHz') }
sub postfix:<fHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'fHz') }
sub postfix:<aHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'aHz') }
sub postfix:<zHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'zHz') }
sub postfix:<yHz> (Real:D $x) is export(:mechanical) { do-postfix($x,'yHz') }
sub postfix:<N> (Real:D $x) is export(:mechanical) { do-postfix($x,'N') }
sub postfix:<daN> (Real:D $x) is export(:mechanical) { do-postfix($x,'daN') }
sub postfix:<hN> (Real:D $x) is export(:mechanical) { do-postfix($x,'hN') }
sub postfix:<kN> (Real:D $x) is export(:mechanical) { do-postfix($x,'kN') }
sub postfix:<MN> (Real:D $x) is export(:mechanical) { do-postfix($x,'MN') }
sub postfix:<GN> (Real:D $x) is export(:mechanical) { do-postfix($x,'GN') }
sub postfix:<TN> (Real:D $x) is export(:mechanical) { do-postfix($x,'TN') }
sub postfix:<PN> (Real:D $x) is export(:mechanical) { do-postfix($x,'PN') }
sub postfix:<EN> (Real:D $x) is export(:mechanical) { do-postfix($x,'EN') }
sub postfix:<ZN> (Real:D $x) is export(:mechanical) { do-postfix($x,'ZN') }
sub postfix:<YN> (Real:D $x) is export(:mechanical) { do-postfix($x,'YN') }
sub postfix:<dN> (Real:D $x) is export(:mechanical) { do-postfix($x,'dN') }
sub postfix:<cN> (Real:D $x) is export(:mechanical) { do-postfix($x,'cN') }
sub postfix:<mN> (Real:D $x) is export(:mechanical) { do-postfix($x,'mN') }
sub postfix:<μN> (Real:D $x) is export(:mechanical) { do-postfix($x,'μN') }
sub postfix:<nN> (Real:D $x) is export(:mechanical) { do-postfix($x,'nN') }
sub postfix:<pN> (Real:D $x) is export(:mechanical) { do-postfix($x,'pN') }
sub postfix:<fN> (Real:D $x) is export(:mechanical) { do-postfix($x,'fN') }
sub postfix:<aN> (Real:D $x) is export(:mechanical) { do-postfix($x,'aN') }
sub postfix:<zN> (Real:D $x) is export(:mechanical) { do-postfix($x,'zN') }
sub postfix:<yN> (Real:D $x) is export(:mechanical) { do-postfix($x,'yN') }
sub postfix:<Pa> (Real:D $x) is export(:mechanical) { do-postfix($x,'Pa') }
sub postfix:<daPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'daPa') }
sub postfix:<hPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'hPa') }
sub postfix:<kPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'kPa') }
sub postfix:<MPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'MPa') }
sub postfix:<GPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'GPa') }
sub postfix:<TPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'TPa') }
sub postfix:<PPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'PPa') }
sub postfix:<EPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'EPa') }
sub postfix:<ZPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'ZPa') }
sub postfix:<YPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'YPa') }
sub postfix:<dPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'dPa') }
sub postfix:<cPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'cPa') }
sub postfix:<mPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'mPa') }
sub postfix:<μPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'μPa') }
sub postfix:<nPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'nPa') }
sub postfix:<pPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'pPa') }
sub postfix:<fPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'fPa') }
sub postfix:<aPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'aPa') }
sub postfix:<zPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'zPa') }
sub postfix:<yPa> (Real:D $x) is export(:mechanical) { do-postfix($x,'yPa') }
sub postfix:<J> (Real:D $x) is export(:mechanical) { do-postfix($x,'J') }
sub postfix:<daJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'daJ') }
sub postfix:<hJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'hJ') }
sub postfix:<kJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'kJ') }
sub postfix:<MJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'MJ') }
sub postfix:<GJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'GJ') }
sub postfix:<TJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'TJ') }
sub postfix:<PJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'PJ') }
sub postfix:<EJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'EJ') }
sub postfix:<ZJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'ZJ') }
sub postfix:<YJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'YJ') }
sub postfix:<dJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'dJ') }
sub postfix:<cJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'cJ') }
sub postfix:<mJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'mJ') }
sub postfix:<μJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'μJ') }
sub postfix:<nJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'nJ') }
sub postfix:<pJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'pJ') }
sub postfix:<fJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'fJ') }
sub postfix:<aJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'aJ') }
sub postfix:<zJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'zJ') }
sub postfix:<yJ> (Real:D $x) is export(:mechanical) { do-postfix($x,'yJ') }
sub postfix:<W> (Real:D $x) is export(:mechanical) { do-postfix($x,'W') }
sub postfix:<daW> (Real:D $x) is export(:mechanical) { do-postfix($x,'daW') }
sub postfix:<hW> (Real:D $x) is export(:mechanical) { do-postfix($x,'hW') }
sub postfix:<kW> (Real:D $x) is export(:mechanical) { do-postfix($x,'kW') }
sub postfix:<MW> (Real:D $x) is export(:mechanical) { do-postfix($x,'MW') }
sub postfix:<GW> (Real:D $x) is export(:mechanical) { do-postfix($x,'GW') }
sub postfix:<TW> (Real:D $x) is export(:mechanical) { do-postfix($x,'TW') }
sub postfix:<PW> (Real:D $x) is export(:mechanical) { do-postfix($x,'PW') }
sub postfix:<EW> (Real:D $x) is export(:mechanical) { do-postfix($x,'EW') }
sub postfix:<ZW> (Real:D $x) is export(:mechanical) { do-postfix($x,'ZW') }
sub postfix:<YW> (Real:D $x) is export(:mechanical) { do-postfix($x,'YW') }
sub postfix:<dW> (Real:D $x) is export(:mechanical) { do-postfix($x,'dW') }
sub postfix:<cW> (Real:D $x) is export(:mechanical) { do-postfix($x,'cW') }
sub postfix:<mW> (Real:D $x) is export(:mechanical) { do-postfix($x,'mW') }
sub postfix:<μW> (Real:D $x) is export(:mechanical) { do-postfix($x,'μW') }
sub postfix:<nW> (Real:D $x) is export(:mechanical) { do-postfix($x,'nW') }
sub postfix:<pW> (Real:D $x) is export(:mechanical) { do-postfix($x,'pW') }
sub postfix:<fW> (Real:D $x) is export(:mechanical) { do-postfix($x,'fW') }
sub postfix:<aW> (Real:D $x) is export(:mechanical) { do-postfix($x,'aW') }
sub postfix:<zW> (Real:D $x) is export(:mechanical) { do-postfix($x,'zW') }
sub postfix:<yW> (Real:D $x) is export(:mechanical) { do-postfix($x,'yW') }
sub postfix:<C> (Real:D $x) is export(:electrical) { do-postfix($x,'C') }
sub postfix:<daC> (Real:D $x) is export(:electrical) { do-postfix($x,'daC') }
sub postfix:<hC> (Real:D $x) is export(:electrical) { do-postfix($x,'hC') }
sub postfix:<kC> (Real:D $x) is export(:electrical) { do-postfix($x,'kC') }
sub postfix:<MC> (Real:D $x) is export(:electrical) { do-postfix($x,'MC') }
sub postfix:<GC> (Real:D $x) is export(:electrical) { do-postfix($x,'GC') }
sub postfix:<TC> (Real:D $x) is export(:electrical) { do-postfix($x,'TC') }
sub postfix:<PC> (Real:D $x) is export(:electrical) { do-postfix($x,'PC') }
sub postfix:<EC> (Real:D $x) is export(:electrical) { do-postfix($x,'EC') }
sub postfix:<ZC> (Real:D $x) is export(:electrical) { do-postfix($x,'ZC') }
sub postfix:<YC> (Real:D $x) is export(:electrical) { do-postfix($x,'YC') }
sub postfix:<dC> (Real:D $x) is export(:electrical) { do-postfix($x,'dC') }
sub postfix:<cC> (Real:D $x) is export(:electrical) { do-postfix($x,'cC') }
sub postfix:<mC> (Real:D $x) is export(:electrical) { do-postfix($x,'mC') }
sub postfix:<μC> (Real:D $x) is export(:electrical) { do-postfix($x,'μC') }
sub postfix:<nC> (Real:D $x) is export(:electrical) { do-postfix($x,'nC') }
sub postfix:<pC> (Real:D $x) is export(:electrical) { do-postfix($x,'pC') }
sub postfix:<fC> (Real:D $x) is export(:electrical) { do-postfix($x,'fC') }
sub postfix:<aC> (Real:D $x) is export(:electrical) { do-postfix($x,'aC') }
sub postfix:<zC> (Real:D $x) is export(:electrical) { do-postfix($x,'zC') }
sub postfix:<yC> (Real:D $x) is export(:electrical) { do-postfix($x,'yC') }
sub postfix:<V> (Real:D $x) is export(:electrical) { do-postfix($x,'V') }
sub postfix:<daV> (Real:D $x) is export(:electrical) { do-postfix($x,'daV') }
sub postfix:<hV> (Real:D $x) is export(:electrical) { do-postfix($x,'hV') }
sub postfix:<kV> (Real:D $x) is export(:electrical) { do-postfix($x,'kV') }
sub postfix:<MV> (Real:D $x) is export(:electrical) { do-postfix($x,'MV') }
sub postfix:<GV> (Real:D $x) is export(:electrical) { do-postfix($x,'GV') }
sub postfix:<TV> (Real:D $x) is export(:electrical) { do-postfix($x,'TV') }
sub postfix:<PV> (Real:D $x) is export(:electrical) { do-postfix($x,'PV') }
sub postfix:<EV> (Real:D $x) is export(:electrical) { do-postfix($x,'EV') }
sub postfix:<ZV> (Real:D $x) is export(:electrical) { do-postfix($x,'ZV') }
sub postfix:<YV> (Real:D $x) is export(:electrical) { do-postfix($x,'YV') }
sub postfix:<dV> (Real:D $x) is export(:electrical) { do-postfix($x,'dV') }
sub postfix:<cV> (Real:D $x) is export(:electrical) { do-postfix($x,'cV') }
sub postfix:<mV> (Real:D $x) is export(:electrical) { do-postfix($x,'mV') }
sub postfix:<μV> (Real:D $x) is export(:electrical) { do-postfix($x,'μV') }
sub postfix:<nV> (Real:D $x) is export(:electrical) { do-postfix($x,'nV') }
sub postfix:<pV> (Real:D $x) is export(:electrical) { do-postfix($x,'pV') }
sub postfix:<fV> (Real:D $x) is export(:electrical) { do-postfix($x,'fV') }
sub postfix:<aV> (Real:D $x) is export(:electrical) { do-postfix($x,'aV') }
sub postfix:<zV> (Real:D $x) is export(:electrical) { do-postfix($x,'zV') }
sub postfix:<yV> (Real:D $x) is export(:electrical) { do-postfix($x,'yV') }
sub postfix:<F> (Real:D $x) is export(:electrical) { do-postfix($x,'F') }
sub postfix:<daF> (Real:D $x) is export(:electrical) { do-postfix($x,'daF') }
sub postfix:<hF> (Real:D $x) is export(:electrical) { do-postfix($x,'hF') }
sub postfix:<kF> (Real:D $x) is export(:electrical) { do-postfix($x,'kF') }
sub postfix:<MF> (Real:D $x) is export(:electrical) { do-postfix($x,'MF') }
sub postfix:<GF> (Real:D $x) is export(:electrical) { do-postfix($x,'GF') }
sub postfix:<TF> (Real:D $x) is export(:electrical) { do-postfix($x,'TF') }
sub postfix:<PF> (Real:D $x) is export(:electrical) { do-postfix($x,'PF') }
sub postfix:<EF> (Real:D $x) is export(:electrical) { do-postfix($x,'EF') }
sub postfix:<ZF> (Real:D $x) is export(:electrical) { do-postfix($x,'ZF') }
sub postfix:<YF> (Real:D $x) is export(:electrical) { do-postfix($x,'YF') }
sub postfix:<dF> (Real:D $x) is export(:electrical) { do-postfix($x,'dF') }
sub postfix:<cF> (Real:D $x) is export(:electrical) { do-postfix($x,'cF') }
sub postfix:<mF> (Real:D $x) is export(:electrical) { do-postfix($x,'mF') }
sub postfix:<μF> (Real:D $x) is export(:electrical) { do-postfix($x,'μF') }
sub postfix:<nF> (Real:D $x) is export(:electrical) { do-postfix($x,'nF') }
sub postfix:<pF> (Real:D $x) is export(:electrical) { do-postfix($x,'pF') }
sub postfix:<fF> (Real:D $x) is export(:electrical) { do-postfix($x,'fF') }
sub postfix:<aF> (Real:D $x) is export(:electrical) { do-postfix($x,'aF') }
sub postfix:<zF> (Real:D $x) is export(:electrical) { do-postfix($x,'zF') }
sub postfix:<yF> (Real:D $x) is export(:electrical) { do-postfix($x,'yF') }
sub postfix:<Ω> (Real:D $x) is export(:electrical) { do-postfix($x,'Ω') }
sub postfix:<daΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'daΩ') }
sub postfix:<hΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'hΩ') }
sub postfix:<kΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'kΩ') }
sub postfix:<MΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'MΩ') }
sub postfix:<GΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'GΩ') }
sub postfix:<TΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'TΩ') }
sub postfix:<PΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'PΩ') }
sub postfix:<EΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'EΩ') }
sub postfix:<ZΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'ZΩ') }
sub postfix:<YΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'YΩ') }
sub postfix:<dΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'dΩ') }
sub postfix:<cΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'cΩ') }
sub postfix:<mΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'mΩ') }
sub postfix:<μΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'μΩ') }
sub postfix:<nΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'nΩ') }
sub postfix:<pΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'pΩ') }
sub postfix:<fΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'fΩ') }
sub postfix:<aΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'aΩ') }
sub postfix:<zΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'zΩ') }
sub postfix:<yΩ> (Real:D $x) is export(:electrical) { do-postfix($x,'yΩ') }
sub postfix:<S> (Real:D $x) is export(:electrical) { do-postfix($x,'S') }
sub postfix:<daS> (Real:D $x) is export(:electrical) { do-postfix($x,'daS') }
sub postfix:<hS> (Real:D $x) is export(:electrical) { do-postfix($x,'hS') }
sub postfix:<kS> (Real:D $x) is export(:electrical) { do-postfix($x,'kS') }
sub postfix:<MS> (Real:D $x) is export(:electrical) { do-postfix($x,'MS') }
sub postfix:<GS> (Real:D $x) is export(:electrical) { do-postfix($x,'GS') }
sub postfix:<TS> (Real:D $x) is export(:electrical) { do-postfix($x,'TS') }
sub postfix:<PS> (Real:D $x) is export(:electrical) { do-postfix($x,'PS') }
sub postfix:<ES> (Real:D $x) is export(:electrical) { do-postfix($x,'ES') }
sub postfix:<ZS> (Real:D $x) is export(:electrical) { do-postfix($x,'ZS') }
sub postfix:<YS> (Real:D $x) is export(:electrical) { do-postfix($x,'YS') }
sub postfix:<dS> (Real:D $x) is export(:electrical) { do-postfix($x,'dS') }
sub postfix:<cS> (Real:D $x) is export(:electrical) { do-postfix($x,'cS') }
sub postfix:<mS> (Real:D $x) is export(:electrical) { do-postfix($x,'mS') }
sub postfix:<μS> (Real:D $x) is export(:electrical) { do-postfix($x,'μS') }
sub postfix:<nS> (Real:D $x) is export(:electrical) { do-postfix($x,'nS') }
sub postfix:<pS> (Real:D $x) is export(:electrical) { do-postfix($x,'pS') }
sub postfix:<fS> (Real:D $x) is export(:electrical) { do-postfix($x,'fS') }
sub postfix:<aS> (Real:D $x) is export(:electrical) { do-postfix($x,'aS') }
sub postfix:<zS> (Real:D $x) is export(:electrical) { do-postfix($x,'zS') }
sub postfix:<yS> (Real:D $x) is export(:electrical) { do-postfix($x,'yS') }
sub postfix:<Wb> (Real:D $x) is export(:electrical) { do-postfix($x,'Wb') }
sub postfix:<daWb> (Real:D $x) is export(:electrical) { do-postfix($x,'daWb') }
sub postfix:<hWb> (Real:D $x) is export(:electrical) { do-postfix($x,'hWb') }
sub postfix:<kWb> (Real:D $x) is export(:electrical) { do-postfix($x,'kWb') }
sub postfix:<MWb> (Real:D $x) is export(:electrical) { do-postfix($x,'MWb') }
sub postfix:<GWb> (Real:D $x) is export(:electrical) { do-postfix($x,'GWb') }
sub postfix:<TWb> (Real:D $x) is export(:electrical) { do-postfix($x,'TWb') }
sub postfix:<PWb> (Real:D $x) is export(:electrical) { do-postfix($x,'PWb') }
sub postfix:<EWb> (Real:D $x) is export(:electrical) { do-postfix($x,'EWb') }
sub postfix:<ZWb> (Real:D $x) is export(:electrical) { do-postfix($x,'ZWb') }
sub postfix:<YWb> (Real:D $x) is export(:electrical) { do-postfix($x,'YWb') }
sub postfix:<dWb> (Real:D $x) is export(:electrical) { do-postfix($x,'dWb') }
sub postfix:<cWb> (Real:D $x) is export(:electrical) { do-postfix($x,'cWb') }
sub postfix:<mWb> (Real:D $x) is export(:electrical) { do-postfix($x,'mWb') }
sub postfix:<μWb> (Real:D $x) is export(:electrical) { do-postfix($x,'μWb') }
sub postfix:<nWb> (Real:D $x) is export(:electrical) { do-postfix($x,'nWb') }
sub postfix:<pWb> (Real:D $x) is export(:electrical) { do-postfix($x,'pWb') }
sub postfix:<fWb> (Real:D $x) is export(:electrical) { do-postfix($x,'fWb') }
sub postfix:<aWb> (Real:D $x) is export(:electrical) { do-postfix($x,'aWb') }
sub postfix:<zWb> (Real:D $x) is export(:electrical) { do-postfix($x,'zWb') }
sub postfix:<yWb> (Real:D $x) is export(:electrical) { do-postfix($x,'yWb') }
sub postfix:<T> (Real:D $x) is export(:electrical) { do-postfix($x,'T') }
sub postfix:<daT> (Real:D $x) is export(:electrical) { do-postfix($x,'daT') }
sub postfix:<hT> (Real:D $x) is export(:electrical) { do-postfix($x,'hT') }
sub postfix:<kT> (Real:D $x) is export(:electrical) { do-postfix($x,'kT') }
sub postfix:<MT> (Real:D $x) is export(:electrical) { do-postfix($x,'MT') }
sub postfix:<GT> (Real:D $x) is export(:electrical) { do-postfix($x,'GT') }
sub postfix:<TT> (Real:D $x) is export(:electrical) { do-postfix($x,'TT') }
sub postfix:<PT> (Real:D $x) is export(:electrical) { do-postfix($x,'PT') }
sub postfix:<ET> (Real:D $x) is export(:electrical) { do-postfix($x,'ET') }
sub postfix:<ZT> (Real:D $x) is export(:electrical) { do-postfix($x,'ZT') }
sub postfix:<YT> (Real:D $x) is export(:electrical) { do-postfix($x,'YT') }
sub postfix:<dT> (Real:D $x) is export(:electrical) { do-postfix($x,'dT') }
sub postfix:<cT> (Real:D $x) is export(:electrical) { do-postfix($x,'cT') }
sub postfix:<mT> (Real:D $x) is export(:electrical) { do-postfix($x,'mT') }
sub postfix:<μT> (Real:D $x) is export(:electrical) { do-postfix($x,'μT') }
sub postfix:<nT> (Real:D $x) is export(:electrical) { do-postfix($x,'nT') }
sub postfix:<pT> (Real:D $x) is export(:electrical) { do-postfix($x,'pT') }
sub postfix:<fT> (Real:D $x) is export(:electrical) { do-postfix($x,'fT') }
sub postfix:<aT> (Real:D $x) is export(:electrical) { do-postfix($x,'aT') }
sub postfix:<zT> (Real:D $x) is export(:electrical) { do-postfix($x,'zT') }
sub postfix:<yT> (Real:D $x) is export(:electrical) { do-postfix($x,'yT') }
sub postfix:<H> (Real:D $x) is export(:electrical) { do-postfix($x,'H') }
sub postfix:<daH> (Real:D $x) is export(:electrical) { do-postfix($x,'daH') }
sub postfix:<hH> (Real:D $x) is export(:electrical) { do-postfix($x,'hH') }
sub postfix:<kH> (Real:D $x) is export(:electrical) { do-postfix($x,'kH') }
sub postfix:<MH> (Real:D $x) is export(:electrical) { do-postfix($x,'MH') }
sub postfix:<GH> (Real:D $x) is export(:electrical) { do-postfix($x,'GH') }
sub postfix:<TH> (Real:D $x) is export(:electrical) { do-postfix($x,'TH') }
sub postfix:<PH> (Real:D $x) is export(:electrical) { do-postfix($x,'PH') }
sub postfix:<EH> (Real:D $x) is export(:electrical) { do-postfix($x,'EH') }
sub postfix:<ZH> (Real:D $x) is export(:electrical) { do-postfix($x,'ZH') }
sub postfix:<YH> (Real:D $x) is export(:electrical) { do-postfix($x,'YH') }
sub postfix:<dH> (Real:D $x) is export(:electrical) { do-postfix($x,'dH') }
sub postfix:<cH> (Real:D $x) is export(:electrical) { do-postfix($x,'cH') }
sub postfix:<mH> (Real:D $x) is export(:electrical) { do-postfix($x,'mH') }
sub postfix:<μH> (Real:D $x) is export(:electrical) { do-postfix($x,'μH') }
sub postfix:<nH> (Real:D $x) is export(:electrical) { do-postfix($x,'nH') }
sub postfix:<pH> (Real:D $x) is export(:electrical) { do-postfix($x,'pH') }
sub postfix:<fH> (Real:D $x) is export(:electrical) { do-postfix($x,'fH') }
sub postfix:<aH> (Real:D $x) is export(:electrical) { do-postfix($x,'aH') }
sub postfix:<zH> (Real:D $x) is export(:electrical) { do-postfix($x,'zH') }
sub postfix:<yH> (Real:D $x) is export(:electrical) { do-postfix($x,'yH') }
sub postfix:<lm> (Real:D $x) is export(:universal) { do-postfix($x,'lm') }
sub postfix:<dalm> (Real:D $x) is export(:universal) { do-postfix($x,'dalm') }
sub postfix:<hlm> (Real:D $x) is export(:universal) { do-postfix($x,'hlm') }
sub postfix:<klm> (Real:D $x) is export(:universal) { do-postfix($x,'klm') }
sub postfix:<Mlm> (Real:D $x) is export(:universal) { do-postfix($x,'Mlm') }
sub postfix:<Glm> (Real:D $x) is export(:universal) { do-postfix($x,'Glm') }
sub postfix:<Tlm> (Real:D $x) is export(:universal) { do-postfix($x,'Tlm') }
sub postfix:<Plm> (Real:D $x) is export(:universal) { do-postfix($x,'Plm') }
sub postfix:<Elm> (Real:D $x) is export(:universal) { do-postfix($x,'Elm') }
sub postfix:<Zlm> (Real:D $x) is export(:universal) { do-postfix($x,'Zlm') }
sub postfix:<Ylm> (Real:D $x) is export(:universal) { do-postfix($x,'Ylm') }
sub postfix:<dlm> (Real:D $x) is export(:universal) { do-postfix($x,'dlm') }
sub postfix:<clm> (Real:D $x) is export(:universal) { do-postfix($x,'clm') }
sub postfix:<mlm> (Real:D $x) is export(:universal) { do-postfix($x,'mlm') }
sub postfix:<μlm> (Real:D $x) is export(:universal) { do-postfix($x,'μlm') }
sub postfix:<nlm> (Real:D $x) is export(:universal) { do-postfix($x,'nlm') }
sub postfix:<plm> (Real:D $x) is export(:universal) { do-postfix($x,'plm') }
sub postfix:<flm> (Real:D $x) is export(:universal) { do-postfix($x,'flm') }
sub postfix:<alm> (Real:D $x) is export(:universal) { do-postfix($x,'alm') }
sub postfix:<zlm> (Real:D $x) is export(:universal) { do-postfix($x,'zlm') }
sub postfix:<ylm> (Real:D $x) is export(:universal) { do-postfix($x,'ylm') }
sub postfix:<lx> (Real:D $x) is export(:universal) { do-postfix($x,'lx') }
sub postfix:<dalx> (Real:D $x) is export(:universal) { do-postfix($x,'dalx') }
sub postfix:<hlx> (Real:D $x) is export(:universal) { do-postfix($x,'hlx') }
sub postfix:<klx> (Real:D $x) is export(:universal) { do-postfix($x,'klx') }
sub postfix:<Mlx> (Real:D $x) is export(:universal) { do-postfix($x,'Mlx') }
sub postfix:<Glx> (Real:D $x) is export(:universal) { do-postfix($x,'Glx') }
sub postfix:<Tlx> (Real:D $x) is export(:universal) { do-postfix($x,'Tlx') }
sub postfix:<Plx> (Real:D $x) is export(:universal) { do-postfix($x,'Plx') }
sub postfix:<Elx> (Real:D $x) is export(:universal) { do-postfix($x,'Elx') }
sub postfix:<Zlx> (Real:D $x) is export(:universal) { do-postfix($x,'Zlx') }
sub postfix:<Ylx> (Real:D $x) is export(:universal) { do-postfix($x,'Ylx') }
sub postfix:<dlx> (Real:D $x) is export(:universal) { do-postfix($x,'dlx') }
sub postfix:<clx> (Real:D $x) is export(:universal) { do-postfix($x,'clx') }
sub postfix:<mlx> (Real:D $x) is export(:universal) { do-postfix($x,'mlx') }
sub postfix:<μlx> (Real:D $x) is export(:universal) { do-postfix($x,'μlx') }
sub postfix:<nlx> (Real:D $x) is export(:universal) { do-postfix($x,'nlx') }
sub postfix:<plx> (Real:D $x) is export(:universal) { do-postfix($x,'plx') }
sub postfix:<flx> (Real:D $x) is export(:universal) { do-postfix($x,'flx') }
sub postfix:<alx> (Real:D $x) is export(:universal) { do-postfix($x,'alx') }
sub postfix:<zlx> (Real:D $x) is export(:universal) { do-postfix($x,'zlx') }
sub postfix:<ylx> (Real:D $x) is export(:universal) { do-postfix($x,'ylx') }
sub postfix:<Bq> (Real:D $x) is export(:universal) { do-postfix($x,'Bq') }
sub postfix:<daBq> (Real:D $x) is export(:universal) { do-postfix($x,'daBq') }
sub postfix:<hBq> (Real:D $x) is export(:universal) { do-postfix($x,'hBq') }
sub postfix:<kBq> (Real:D $x) is export(:universal) { do-postfix($x,'kBq') }
sub postfix:<MBq> (Real:D $x) is export(:universal) { do-postfix($x,'MBq') }
sub postfix:<GBq> (Real:D $x) is export(:universal) { do-postfix($x,'GBq') }
sub postfix:<TBq> (Real:D $x) is export(:universal) { do-postfix($x,'TBq') }
sub postfix:<PBq> (Real:D $x) is export(:universal) { do-postfix($x,'PBq') }
sub postfix:<EBq> (Real:D $x) is export(:universal) { do-postfix($x,'EBq') }
sub postfix:<ZBq> (Real:D $x) is export(:universal) { do-postfix($x,'ZBq') }
sub postfix:<YBq> (Real:D $x) is export(:universal) { do-postfix($x,'YBq') }
sub postfix:<dBq> (Real:D $x) is export(:universal) { do-postfix($x,'dBq') }
sub postfix:<cBq> (Real:D $x) is export(:universal) { do-postfix($x,'cBq') }
sub postfix:<mBq> (Real:D $x) is export(:universal) { do-postfix($x,'mBq') }
sub postfix:<μBq> (Real:D $x) is export(:universal) { do-postfix($x,'μBq') }
sub postfix:<nBq> (Real:D $x) is export(:universal) { do-postfix($x,'nBq') }
sub postfix:<pBq> (Real:D $x) is export(:universal) { do-postfix($x,'pBq') }
sub postfix:<fBq> (Real:D $x) is export(:universal) { do-postfix($x,'fBq') }
sub postfix:<aBq> (Real:D $x) is export(:universal) { do-postfix($x,'aBq') }
sub postfix:<zBq> (Real:D $x) is export(:universal) { do-postfix($x,'zBq') }
sub postfix:<yBq> (Real:D $x) is export(:universal) { do-postfix($x,'yBq') }
sub postfix:<Gy> (Real:D $x) is export(:universal) { do-postfix($x,'Gy') }
sub postfix:<daGy> (Real:D $x) is export(:universal) { do-postfix($x,'daGy') }
sub postfix:<hGy> (Real:D $x) is export(:universal) { do-postfix($x,'hGy') }
sub postfix:<kGy> (Real:D $x) is export(:universal) { do-postfix($x,'kGy') }
sub postfix:<MGy> (Real:D $x) is export(:universal) { do-postfix($x,'MGy') }
sub postfix:<GGy> (Real:D $x) is export(:universal) { do-postfix($x,'GGy') }
sub postfix:<TGy> (Real:D $x) is export(:universal) { do-postfix($x,'TGy') }
sub postfix:<PGy> (Real:D $x) is export(:universal) { do-postfix($x,'PGy') }
sub postfix:<EGy> (Real:D $x) is export(:universal) { do-postfix($x,'EGy') }
sub postfix:<ZGy> (Real:D $x) is export(:universal) { do-postfix($x,'ZGy') }
sub postfix:<YGy> (Real:D $x) is export(:universal) { do-postfix($x,'YGy') }
sub postfix:<dGy> (Real:D $x) is export(:universal) { do-postfix($x,'dGy') }
sub postfix:<cGy> (Real:D $x) is export(:universal) { do-postfix($x,'cGy') }
sub postfix:<mGy> (Real:D $x) is export(:universal) { do-postfix($x,'mGy') }
sub postfix:<μGy> (Real:D $x) is export(:universal) { do-postfix($x,'μGy') }
sub postfix:<nGy> (Real:D $x) is export(:universal) { do-postfix($x,'nGy') }
sub postfix:<pGy> (Real:D $x) is export(:universal) { do-postfix($x,'pGy') }
sub postfix:<fGy> (Real:D $x) is export(:universal) { do-postfix($x,'fGy') }
sub postfix:<aGy> (Real:D $x) is export(:universal) { do-postfix($x,'aGy') }
sub postfix:<zGy> (Real:D $x) is export(:universal) { do-postfix($x,'zGy') }
sub postfix:<yGy> (Real:D $x) is export(:universal) { do-postfix($x,'yGy') }
sub postfix:<Sv> (Real:D $x) is export(:universal) { do-postfix($x,'Sv') }
sub postfix:<daSv> (Real:D $x) is export(:universal) { do-postfix($x,'daSv') }
sub postfix:<hSv> (Real:D $x) is export(:universal) { do-postfix($x,'hSv') }
sub postfix:<kSv> (Real:D $x) is export(:universal) { do-postfix($x,'kSv') }
sub postfix:<MSv> (Real:D $x) is export(:universal) { do-postfix($x,'MSv') }
sub postfix:<GSv> (Real:D $x) is export(:universal) { do-postfix($x,'GSv') }
sub postfix:<TSv> (Real:D $x) is export(:universal) { do-postfix($x,'TSv') }
sub postfix:<PSv> (Real:D $x) is export(:universal) { do-postfix($x,'PSv') }
sub postfix:<ESv> (Real:D $x) is export(:universal) { do-postfix($x,'ESv') }
sub postfix:<ZSv> (Real:D $x) is export(:universal) { do-postfix($x,'ZSv') }
sub postfix:<YSv> (Real:D $x) is export(:universal) { do-postfix($x,'YSv') }
sub postfix:<dSv> (Real:D $x) is export(:universal) { do-postfix($x,'dSv') }
sub postfix:<cSv> (Real:D $x) is export(:universal) { do-postfix($x,'cSv') }
sub postfix:<mSv> (Real:D $x) is export(:universal) { do-postfix($x,'mSv') }
sub postfix:<μSv> (Real:D $x) is export(:universal) { do-postfix($x,'μSv') }
sub postfix:<nSv> (Real:D $x) is export(:universal) { do-postfix($x,'nSv') }
sub postfix:<pSv> (Real:D $x) is export(:universal) { do-postfix($x,'pSv') }
sub postfix:<fSv> (Real:D $x) is export(:universal) { do-postfix($x,'fSv') }
sub postfix:<aSv> (Real:D $x) is export(:universal) { do-postfix($x,'aSv') }
sub postfix:<zSv> (Real:D $x) is export(:universal) { do-postfix($x,'zSv') }
sub postfix:<ySv> (Real:D $x) is export(:universal) { do-postfix($x,'ySv') }
sub postfix:<kat> (Real:D $x) is export(:universal) { do-postfix($x,'kat') }
sub postfix:<dakat> (Real:D $x) is export(:universal) { do-postfix($x,'dakat') }
sub postfix:<hkat> (Real:D $x) is export(:universal) { do-postfix($x,'hkat') }
sub postfix:<kkat> (Real:D $x) is export(:universal) { do-postfix($x,'kkat') }
sub postfix:<Mkat> (Real:D $x) is export(:universal) { do-postfix($x,'Mkat') }
sub postfix:<Gkat> (Real:D $x) is export(:universal) { do-postfix($x,'Gkat') }
sub postfix:<Tkat> (Real:D $x) is export(:universal) { do-postfix($x,'Tkat') }
sub postfix:<Pkat> (Real:D $x) is export(:universal) { do-postfix($x,'Pkat') }
sub postfix:<Ekat> (Real:D $x) is export(:universal) { do-postfix($x,'Ekat') }
sub postfix:<Zkat> (Real:D $x) is export(:universal) { do-postfix($x,'Zkat') }
sub postfix:<Ykat> (Real:D $x) is export(:universal) { do-postfix($x,'Ykat') }
sub postfix:<dkat> (Real:D $x) is export(:universal) { do-postfix($x,'dkat') }
sub postfix:<ckat> (Real:D $x) is export(:universal) { do-postfix($x,'ckat') }
sub postfix:<mkat> (Real:D $x) is export(:universal) { do-postfix($x,'mkat') }
sub postfix:<μkat> (Real:D $x) is export(:universal) { do-postfix($x,'μkat') }
sub postfix:<nkat> (Real:D $x) is export(:universal) { do-postfix($x,'nkat') }
sub postfix:<pkat> (Real:D $x) is export(:universal) { do-postfix($x,'pkat') }
sub postfix:<fkat> (Real:D $x) is export(:universal) { do-postfix($x,'fkat') }
sub postfix:<akat> (Real:D $x) is export(:universal) { do-postfix($x,'akat') }
sub postfix:<zkat> (Real:D $x) is export(:universal) { do-postfix($x,'zkat') }
sub postfix:<ykat> (Real:D $x) is export(:universal) { do-postfix($x,'ykat') }
sub postfix:<l> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'l') }
sub postfix:<dal> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'dal') }
sub postfix:<hl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'hl') }
sub postfix:<kl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'kl') }
sub postfix:<Ml> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Ml') }
sub postfix:<Gl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Gl') }
sub postfix:<Tl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Tl') }
sub postfix:<Pl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Pl') }
sub postfix:<El> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'El') }
sub postfix:<Zl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Zl') }
sub postfix:<Yl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'Yl') }
sub postfix:<dl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'dl') }
sub postfix:<cl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'cl') }
sub postfix:<ml> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'ml') }
sub postfix:<μl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'μl') }
sub postfix:<nl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'nl') }
sub postfix:<pl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'pl') }
sub postfix:<fl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'fl') }
sub postfix:<al> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'al') }
sub postfix:<zl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'zl') }
sub postfix:<yl> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'yl') }
##### Affix Ops End #####
}

#EOF
