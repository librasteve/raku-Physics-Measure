unit module Physics::UnitAffixQ:ver<0.0.4>:auth<Steve Roe (p6steve@furnival.net)>;
use Physics::Unit;

###### UnitAffixQ is the QUICK variant - only :DEFAULT tag #######
#[firstcomp ~ 72s / precomp ~ 1.5s ]

LoadAffixUnits();
LoadAffixOps();


sub LoadAffixUnits {

#about 80 units x 4 lines == ~320 lines
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

#Then approx. 80 Affix Ops == ~80 more lines...
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
