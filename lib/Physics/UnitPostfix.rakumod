unit module Physics::UnitPostfix:ver<0.0.3>:auth<Steve Roe (p6steve@furnival.net)>;
use Physics::Unit;

#approx. 600 units == ~2400 more lines...
#some individual units commented out as already defined in Physics::Unit

##### Short Stock Units Start #####
#`[[
Unit.new( factor => 1, offset => 0, defn => 'metre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['m'] , stock => True  );
#]]
Unit.new( factor => 10, offset => 0, defn => 'dekametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['dam','dams'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['hm'] , stock => True  );
#`[[
Unit.new( factor => 1000, offset => 0, defn => 'kilometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['km'] , stock => True  );
#]]
Unit.new( factor => 1000000, offset => 0, defn => 'megametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Mm'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Gm'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Tm'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Pm'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Em'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Zm'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottametre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['Ym'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decimetre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['dm'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centimetre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['cm'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millimetre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['mm'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'micrometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['μm'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['nm'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['pm'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['fm'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['am'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['zm'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['ym'] , stock => True  );
#`[[
Unit.new( factor => 0.001, offset => 0, defn => 'gram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['g'] , stock => True  );
#]]
Unit.new( factor => 0.01, offset => 0, defn => 'dekagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['dag','dags'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'hectogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['hg'] , stock => True  );
#`[[
Unit.new( factor => 1, offset => 0, defn => 'kilogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['kg'] , stock => True  );
#]]
Unit.new( factor => 1000, offset => 0, defn => 'megagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Mg'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'gigagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Gg'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'teragram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Tg'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'petagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Pg'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'exagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Eg'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'zettagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Zg'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'yottagram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['Yg'] , stock => True  );

Unit.new( factor => 0.0001, offset => 0, defn => 'decigram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['dg'] , stock => True  );

Unit.new( factor => 0.00001, offset => 0, defn => 'centigram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['cg'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'milligram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['mg'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'microgram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['μg'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'nanogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['ng'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'picogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['pg'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'femtogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['fg'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'attogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['ag'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'zeptogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['zg'] , stock => True  );

Unit.new( factor => 1e-27, offset => 0, defn => 'yoctogram', type => '',
	  dims => [0,1,0,0,0,0,0,0], dmix => ("gram"=>1).MixHash, 
	  names => ['yg'] , stock => True  );
#`[[
Unit.new( factor => 1, offset => 0, defn => 'second', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['s'] , stock => True  );
#]]
Unit.new( factor => 10, offset => 0, defn => 'dekasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['das'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['hs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ks'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Ms'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Gs'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Ts'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Ps'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Es'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Zs'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottasecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['Ys'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decisecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ds'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centisecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['cs'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millisecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ms'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microsecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['μs'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ns'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ps'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['fs'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['as'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['zs'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctosecond', type => '',
	  dims => [0,0,1,0,0,0,0,0], dmix => ("second"=>1).MixHash, 
	  names => ['ys'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'litre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['l'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'dekalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['dal','dals'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'hectolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['hl'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'kilolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['kl'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'megalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Ml'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'gigalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Gl'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'teralitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Tl'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'petalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Pl'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'exalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['El'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'zettalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Zl'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'yottalitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['Yl'] , stock => True  );

Unit.new( factor => 0.0001, offset => 0, defn => 'decilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['dl'] , stock => True  );

Unit.new( factor => 0.00001, offset => 0, defn => 'centilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['cl'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'millilitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['ml'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'microlitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['μl'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'nanolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['nl'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'picolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['pl'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'femtolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['fl'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'attolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['al'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'zeptolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['zl'] , stock => True  );

Unit.new( factor => 1e-27, offset => 0, defn => 'yoctolitre', type => '',
	  dims => [3,0,0,0,0,0,0,0], dmix => ("litre"=>1).MixHash, 
	  names => ['yl'] , stock => True  );

### Below commented out with ((...)) as first compile too slow > 30 mins 
### If you can live with this feel free to uncomment here and  
### relevant items in Measure.rakumod
#`((
#`[[
Unit.new( factor => 1, offset => 0, defn => 'amp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['A'] , stock => True  );
#]]
Unit.new( factor => 10, offset => 0, defn => 'dekaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['daA','daAs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['hA'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kiloamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['kA'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['MA'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['GA'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teraamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['TA'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['PA'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['EA'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['ZA'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottaamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['YA'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'deciamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['dA'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centiamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['cA'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'milliamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['mA'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['μA'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['nA'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['pA'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['fA'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['aA'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['zA'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctoamp', type => '',
	  dims => [0,0,0,1,0,0,0,0], dmix => ("amp"=>1).MixHash, 
	  names => ['yA'] , stock => True  );
#`[[
Unit.new( factor => 1, offset => 0, defn => 'kelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['K'] , stock => True  );
#]]
Unit.new( factor => 10, offset => 0, defn => 'dekakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['daK','daKs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['hK'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['kK'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['MK'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['GK'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['TK'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['PK'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['EK'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['ZK'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottakelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['YK'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decikelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['dK'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centikelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['cK'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millikelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['mK'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microkelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['μK'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['nK'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['pK'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['fK'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['aK'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['zK'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctokelvin', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("kelvin"=>1).MixHash, 
	  names => ['yK'] , stock => True  );
#`[[
Unit.new( factor => 1, offset => 0, defn => 'mol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['mol','mols'] , stock => True  );
#]]
Unit.new( factor => 10, offset => 0, defn => 'dekamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['damol','damols'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['hmol','hmols'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['kmol','kmols'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Mmol','Mmols'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Gmol','Gmols'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teramol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Tmol','Tmols'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Pmol','Pmols'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'examol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Emol','Emols'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Zmol','Zmols'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottamol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['Ymol','Ymols'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decimol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['dmol','dmols'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centimol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['cmol','cmols'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millimol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['mmol','mmols'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'micromol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['μmol','μmols'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['nmol','nmols'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['pmol','pmols'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['fmol','fmols'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['amol','amols'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['zmol','zmols'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctomol', type => '',
	  dims => [0,0,0,0,0,1,0,0], dmix => ("mol"=>1).MixHash, 
	  names => ['ymol','ymols'] , stock => True  );
#`[[
Unit.new( factor => 1, offset => 0, defn => 'candela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['cd'] , stock => True  );
#]]
Unit.new( factor => 10, offset => 0, defn => 'dekacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['dacd','dacds'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['hcd','hcds'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['kcd','kcds'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Mcd','Mcds'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Gcd','Gcds'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teracandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Tcd','Tcds'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Pcd','Pcds'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Ecd','Ecds'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Zcd','Zcds'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottacandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['Ycd','Ycds'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decicandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['dcd','dcds'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centicandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['ccd','ccds'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millicandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['mcd','mcds'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microcandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['μcd','μcds'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['ncd','ncds'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['pcd','pcds'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['fcd','fcds'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['acd','acds'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['zcd','zcds'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctocandela', type => '',
	  dims => [0,0,0,0,0,0,1,0], dmix => ("candela"=>1).MixHash, 
	  names => ['ycd','ycds'] , stock => True  );
#`[[
Unit.new( factor => 1, offset => 0, defn => 'radian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['rad','rads'] , stock => True  );
#]]
Unit.new( factor => 10, offset => 0, defn => 'dekaradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['darad','darads'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectoradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['hrad','hrads'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kiloradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['krad','krads'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megaradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['Mrad','Mrads'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigaradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['Grad','Grads'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teraradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['Trad','Trads'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petaradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['Prad','Prads'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exaradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['Erad','Erads'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettaradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['Zrad','Zrads'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottaradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['Yrad','Yrads'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'deciradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['drad','drads'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centiradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['crad','crads'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'milliradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['mrad','mrads'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['μrad','μrads'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanoradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['nrad','nrads'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picoradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['prad','prads'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtoradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['frad','frads'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attoradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['arad','arads'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptoradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['zrad','zrads'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctoradian', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("radian"=>1).MixHash, 
	  names => ['yrad','yrads'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'steradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['sr'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekasteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['dasr','dasrs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectosteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['hsr','hsrs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilosteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['ksr','ksrs'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megasteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['Msr','Msrs'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigasteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['Gsr','Gsrs'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terasteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['Tsr','Tsrs'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petasteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['Psr','Psrs'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exasteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['Esr','Esrs'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettasteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['Zsr','Zsrs'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottasteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['Ysr','Ysrs'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decisteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['dsr','dsrs'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centisteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['csr','csrs'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millisteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['msr','msrs'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microsteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['μsr','μsrs'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanosteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['nsr','nsrs'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picosteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['psr','psrs'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtosteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['fsr','fsrs'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attosteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['asr','asrs'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptosteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['zsr','zsrs'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctosteradian', type => '',
	  dims => [0,0,0,0,0,0,0,2], dmix => ("steradian"=>1).MixHash, 
	  names => ['ysr','ysrs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'hertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['Hz'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['daHz','daHzs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['hHz','hHzs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['kHz','kHzs'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['MHz','MHzs'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['GHz','GHzs'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['THz','THzs'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['PHz','PHzs'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['EHz','EHzs'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['ZHz','ZHzs'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottahertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['YHz','YHzs'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decihertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['dHz','dHzs'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centihertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['cHz','cHzs'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millihertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['mHz','mHzs'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microhertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['μHz','μHzs'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['nHz','nHzs'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['pHz','pHzs'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['fHz','fHzs'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['aHz','aHzs'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['zHz','zHzs'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctohertz', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("hertz"=>1).MixHash, 
	  names => ['yHz','yHzs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'newton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['N'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['daN','daNs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['hN'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['kN'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'meganewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['MN'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'giganewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['GN'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teranewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['TN'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['PN'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['EN'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['ZN'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottanewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['YN'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decinewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['dN'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centinewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['cN'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millinewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['mN'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'micronewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['μN'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['nN'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'piconewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['pN'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['fN'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['aN'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['zN'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctonewton', type => '',
	  dims => [1,1,-2,0,0,0,0,0], dmix => ("newton"=>1).MixHash, 
	  names => ['yN'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'pascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['Pa'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['daPa','daPas'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['hPa','hPas'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['kPa','kPas'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['MPa','MPas'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['GPa','GPas'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['TPa','TPas'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['PPa','PPas'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['EPa','EPas'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['ZPa','ZPas'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottapascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['YPa','YPas'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decipascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['dPa','dPas'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centipascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['cPa','cPas'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millipascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['mPa','mPas'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'micropascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['μPa','μPas'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['nPa','nPas'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['pPa','pPas'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['fPa','fPas'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['aPa','aPas'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['zPa','zPas'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctopascal', type => '',
	  dims => [-1,1,-2,0,0,0,0,0], dmix => ("pascal"=>1).MixHash, 
	  names => ['yPa','yPas'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'joule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['J'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['daJ','daJs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['hJ'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['kJ'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['MJ'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['GJ'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['TJ'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['PJ'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['EJ'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['ZJ'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottajoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['YJ'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decijoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['dJ'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centijoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['cJ'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millijoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['mJ'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microjoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['μJ'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['nJ'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['pJ'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['fJ'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['aJ'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['zJ'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctojoule', type => '',
	  dims => [2,1,-2,0,0,0,0,0], dmix => ("joule"=>1).MixHash, 
	  names => ['yJ'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'watt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['W'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['daW','daWs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['hW'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['kW'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['MW'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['GW'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['TW'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['PW'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['EW'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['ZW'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottawatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['YW'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'deciwatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['dW'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centiwatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['cW'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'milliwatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['mW'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microwatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['μW'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['nW'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['pW'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['fW'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['aW'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['zW'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctowatt', type => '',
	  dims => [2,1,-3,0,0,0,0,0], dmix => ("watt"=>1).MixHash, 
	  names => ['yW'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'coulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['C'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['daC','daCs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['hC'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['kC'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['MC'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['GC'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teracoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['TC'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['PC'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['EC'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['ZC'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottacoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['YC'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decicoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['dC'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centicoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['cC'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millicoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['mC'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microcoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['μC'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['nC'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['pC'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['fC'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['aC'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['zC'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctocoulomb', type => '',
	  dims => [0,0,1,1,0,0,0,0], dmix => ("coulomb"=>1).MixHash, 
	  names => ['yC'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'volt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['V'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['daV','daVs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['hV'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['kV'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['MV'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['GV'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teravolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['TV'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['PV'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['EV'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['ZV'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottavolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['YV'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decivolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['dV'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centivolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['cV'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millivolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['mV'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microvolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['μV'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['nV'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['pV'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['fV'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['aV'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['zV'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctovolt', type => '',
	  dims => [2,1,-3,-1,0,0,0,0], dmix => ("volt"=>1).MixHash, 
	  names => ['yV'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'farad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['F'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['daF','daFs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['hF'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['kF'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['MF'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['GF'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['TF'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['PF'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['EF'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['ZF'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottafarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['YF'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decifarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['dF'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centifarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['cF'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millifarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['mF'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microfarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['μF'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['nF'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['pF'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['fF'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['aF'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['zF'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctofarad', type => '',
	  dims => [-2,-1,4,2,0,0,0,0], dmix => ("farad"=>1).MixHash, 
	  names => ['yF'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'ohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['Ω'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['daΩ','daΩs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['hΩ'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kiloohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['kΩ'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['MΩ'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['GΩ'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teraohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['TΩ'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['PΩ'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['EΩ'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['ZΩ'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottaohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['YΩ'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'deciohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['dΩ'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centiohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['cΩ'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'milliohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['mΩ'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['μΩ'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['nΩ'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['pΩ'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['fΩ'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['aΩ'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['zΩ'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctoohm', type => '',
	  dims => [2,1,-3,-2,0,0,0,0], dmix => ("ohm"=>1).MixHash, 
	  names => ['yΩ'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'siemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['S'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['daS','daSs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['hS'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['kS'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['MS'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['GS'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['TS'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['PS'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['ES'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['ZS'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottasiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['YS'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decisiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['dS'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centisiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['cS'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millisiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['mS'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microsiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['μS'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['nS'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['pS'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['fS'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['aS'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['zS'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctosiemens', type => '',
	  dims => [-2,-1,3,2,0,0,0,0], dmix => ("siemens"=>1).MixHash, 
	  names => ['yS'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'weber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['Wb'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['daWb','daWbs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['hWb','hWbs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kiloweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['kWb','kWbs'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['MWb','MWbs'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['GWb','GWbs'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teraweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['TWb','TWbs'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['PWb','PWbs'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['EWb','EWbs'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['ZWb','ZWbs'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottaweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['YWb','YWbs'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'deciweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['dWb','dWbs'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centiweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['cWb','cWbs'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'milliweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['mWb','mWbs'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['μWb','μWbs'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['nWb','nWbs'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['pWb','pWbs'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['fWb','fWbs'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['aWb','aWbs'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['zWb','zWbs'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctoweber', type => '',
	  dims => [2,1,-2,-1,0,0,0,0], dmix => ("weber"=>1).MixHash, 
	  names => ['yWb','yWbs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'tesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['T'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['daT','daTs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['hT'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['kT'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['MT'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['GT'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teratesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['TT'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['PT'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['ET'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['ZT'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottatesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['YT'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decitesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['dT'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centitesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['cT'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millitesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['mT'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microtesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['μT'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['nT'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['pT'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['fT'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['aT'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['zT'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctotesla', type => '',
	  dims => [0,1,-2,-1,0,0,0,0], dmix => ("tesla"=>1).MixHash, 
	  names => ['yT'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'henry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['H'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['daH','daHs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['hH'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['kH'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['MH'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['GH'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['TH'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['PH'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['EH'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['ZH'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottahenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['YH'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decihenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['dH'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centihenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['cH'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millihenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['mH'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microhenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['μH'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['nH'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['pH'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['fH'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['aH'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['zH'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctohenry', type => '',
	  dims => [2,1,-2,-2,0,0,0,0], dmix => ("henry"=>1).MixHash, 
	  names => ['yH'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'celsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['ºC'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekacelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['daºC','daºCs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectocelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['hºC','hºCs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilocelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['kºC','kºCs'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megacelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['MºC','MºCs'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigacelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['GºC','GºCs'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teracelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['TºC','TºCs'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petacelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['PºC','PºCs'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exacelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['EºC','EºCs'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettacelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['ZºC','ZºCs'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottacelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['YºC','YºCs'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decicelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['dºC','dºCs'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centicelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['cºC','cºCs'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millicelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['mºC','mºCs'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microcelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['μºC','μºCs'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanocelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['nºC','nºCs'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picocelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['pºC','pºCs'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtocelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['fºC','fºCs'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attocelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['aºC','aºCs'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptocelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['zºC','zºCs'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctocelsius', type => '',
	  dims => [0,0,0,0,1,0,0,0], dmix => ("celsius"=>1).MixHash, 
	  names => ['yºC','yºCs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'lumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['lm'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['dalm','dalms'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['hlm','hlms'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['klm','klms'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Mlm','Mlms'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Glm','Glms'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teralumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Tlm','Tlms'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Plm','Plms'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Elm','Elms'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Zlm','Zlms'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottalumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['Ylm','Ylms'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decilumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['dlm','dlms'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centilumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['clm','clms'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millilumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['mlm','mlms'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microlumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['μlm','μlms'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['nlm','nlms'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['plm','plms'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['flm','flms'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['alm','alms'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['zlm','zlms'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctolumen', type => '',
	  dims => [0,0,0,0,0,0,1,2], dmix => ("lumen"=>1).MixHash, 
	  names => ['ylm','ylms'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'lux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['lx'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['dalx','dalxs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['hlx','hlxs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['klx','klxs'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Mlx','Mlxs'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Glx','Glxs'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teralux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Tlx','Tlxs'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Plx','Plxs'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Elx','Elxs'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Zlx','Zlxs'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottalux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['Ylx','Ylxs'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decilux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['dlx','dlxs'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centilux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['clx','clxs'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millilux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['mlx','mlxs'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microlux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['μlx','μlxs'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['nlx','nlxs'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['plx','plxs'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['flx','flxs'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['alx','alxs'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['zlx','zlxs'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctolux', type => '',
	  dims => [-2,0,0,0,0,0,1,0], dmix => ("lux"=>1).MixHash, 
	  names => ['ylx','ylxs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'becquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['Bq'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['daBq','daBqs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['hBq','hBqs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['kBq','kBqs'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['MBq','MBqs'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['GBq','GBqs'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['TBq','TBqs'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['PBq','PBqs'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['EBq','EBqs'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['ZBq','ZBqs'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottabecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['YBq','YBqs'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decibecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['dBq','dBqs'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centibecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['cBq','cBqs'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millibecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['mBq','mBqs'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microbecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['μBq','μBqs'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['nBq','nBqs'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['pBq','pBqs'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['fBq','fBqs'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['aBq','aBqs'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['zBq','zBqs'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctobecquerel', type => '',
	  dims => [0,0,-1,0,0,0,0,0], dmix => ("becquerel"=>1).MixHash, 
	  names => ['yBq','yBqs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'gray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['Gy'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['daGy','daGys'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['hGy','hGys'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['kGy','kGys'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['MGy','MGys'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['GGy','GGys'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'teragray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['TGy','TGys'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['PGy','PGys'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['EGy','EGys'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['ZGy','ZGys'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottagray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['YGy','YGys'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decigray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['dGy','dGys'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centigray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['cGy','cGys'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'milligray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['mGy','mGys'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microgray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['μGy','μGys'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['nGy','nGys'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['pGy','pGys'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['fGy','fGys'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['aGy','aGys'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['zGy','zGys'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctogray', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("gray"=>1).MixHash, 
	  names => ['yGy','yGys'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'sievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['Sv'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['daSv','daSvs'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['hSv','hSvs'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['kSv','kSvs'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['MSv','MSvs'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['GSv','GSvs'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['TSv','TSvs'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['PSv','PSvs'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['ESv','ESvs'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['ZSv','ZSvs'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottasievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['YSv','YSvs'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decisievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['dSv','dSvs'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centisievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['cSv','cSvs'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millisievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['mSv','mSvs'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microsievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['μSv','μSvs'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['nSv','nSvs'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['pSv','pSvs'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['fSv','fSvs'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['aSv','aSvs'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['zSv','zSvs'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctosievert', type => '',
	  dims => [2,0,-2,0,0,0,0,0], dmix => ("sievert"=>1).MixHash, 
	  names => ['ySv','ySvs'] , stock => True  );

Unit.new( factor => 1, offset => 0, defn => 'katal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['kat','kats'] , stock => True  );

Unit.new( factor => 10, offset => 0, defn => 'dekakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['dakat','dakats'] , stock => True  );

Unit.new( factor => 100, offset => 0, defn => 'hectokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['hkat','hkats'] , stock => True  );

Unit.new( factor => 1000, offset => 0, defn => 'kilokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['kkat','kkats'] , stock => True  );

Unit.new( factor => 1000000, offset => 0, defn => 'megakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Mkat','Mkats'] , stock => True  );

Unit.new( factor => 1000000000, offset => 0, defn => 'gigakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Gkat','Gkats'] , stock => True  );

Unit.new( factor => 1000000000000, offset => 0, defn => 'terakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Tkat','Tkats'] , stock => True  );

Unit.new( factor => 1000000000000000, offset => 0, defn => 'petakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Pkat','Pkats'] , stock => True  );

Unit.new( factor => 1000000000000000000, offset => 0, defn => 'exakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Ekat','Ekats'] , stock => True  );

Unit.new( factor => 1000000000000000000000, offset => 0, defn => 'zettakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Zkat','Zkats'] , stock => True  );

Unit.new( factor => 1000000000000000000000000, offset => 0, defn => 'yottakatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['Ykat','Ykats'] , stock => True  );

Unit.new( factor => 0.1, offset => 0, defn => 'decikatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['dkat','dkats'] , stock => True  );

Unit.new( factor => 0.01, offset => 0, defn => 'centikatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['ckat','ckats'] , stock => True  );

Unit.new( factor => 0.001, offset => 0, defn => 'millikatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['mkat','mkats'] , stock => True  );

Unit.new( factor => 0.000001, offset => 0, defn => 'microkatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['μkat','μkats'] , stock => True  );

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['nkat','nkats'] , stock => True  );

Unit.new( factor => 0.000000000001, offset => 0, defn => 'picokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['pkat','pkats'] , stock => True  );

Unit.new( factor => 0.000000000000001, offset => 0, defn => 'femtokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['fkat','fkats'] , stock => True  );

Unit.new( factor => 0.000000000000000001, offset => 0, defn => 'attokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['akat','akats'] , stock => True  );

Unit.new( factor => 1.0000000000000001e-21, offset => 0, defn => 'zeptokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['zkat','zkats'] , stock => True  );

Unit.new( factor => 1e-24, offset => 0, defn => 'yoctokatal', type => '',
	  dims => [0,0,-1,0,0,1,0,0], dmix => ("katal"=>1).MixHash, 
	  names => ['ykat','ykats'] , stock => True  );

Unit.new( factor => 0.017453292519943295, offset => 0, defn => 'degrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['º'] , stock => True  );

Unit.new( factor => 0.17453292519943295, offset => 0, defn => 'dekadegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['daº','daºs'] , stock => True  );

Unit.new( factor => 1.7453292519943295, offset => 0, defn => 'hectodegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['hº'] , stock => True  );

Unit.new( factor => 17.453292519943297, offset => 0, defn => 'kilodegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['kº'] , stock => True  );

Unit.new( factor => 17453.292519943294, offset => 0, defn => 'megadegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['Mº'] , stock => True  );

Unit.new( factor => 17453292.519943297, offset => 0, defn => 'gigadegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['Gº'] , stock => True  );

Unit.new( factor => 17453292519.943295, offset => 0, defn => 'teradegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['Tº'] , stock => True  );

Unit.new( factor => 17453292519943.295, offset => 0, defn => 'petadegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['Pº'] , stock => True  );

Unit.new( factor => 17453292519943296, offset => 0, defn => 'exadegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['Eº'] , stock => True  );

Unit.new( factor => 1.7453292519943295e+19, offset => 0, defn => 'zettadegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['Zº'] , stock => True  );

Unit.new( factor => 1.7453292519943295e+22, offset => 0, defn => 'yottadegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['Yº'] , stock => True  );

Unit.new( factor => 0.0017453292519943296, offset => 0, defn => 'decidegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['dº'] , stock => True  );

Unit.new( factor => 0.00017453292519943296, offset => 0, defn => 'centidegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['cº'] , stock => True  );

Unit.new( factor => 1.7453292519943296e-05, offset => 0, defn => 'millidegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['mº'] , stock => True  );

Unit.new( factor => 1.7453292519943295e-08, offset => 0, defn => 'microdegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['μº'] , stock => True  );

Unit.new( factor => 1.7453292519943298e-11, offset => 0, defn => 'nanodegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['nº'] , stock => True  );

Unit.new( factor => 1.7453292519943295e-14, offset => 0, defn => 'picodegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['pº'] , stock => True  );

Unit.new( factor => 1.7453292519943298e-17, offset => 0, defn => 'femtodegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['fº'] , stock => True  );

Unit.new( factor => 1.7453292519943297e-20, offset => 0, defn => 'attodegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['aº'] , stock => True  );

Unit.new( factor => 1.7453292519943298e-23, offset => 0, defn => 'zeptodegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['zº'] , stock => True  );

Unit.new( factor => 1.7453292519943293e-26, offset => 0, defn => 'yoctodegrees', type => '',
	  dims => [0,0,0,0,0,0,0,1], dmix => ("degrees"=>1).MixHash, 
	  names => ['yº'] , stock => True  );

#)) ##End of commented out units
###### Short Stock Units End ######

#EOF
