unit module Physics::UnitAffixQ:ver<0.0.4>:auth<Steve Roe (p6steve@furnival.net)>;

{
use Physics::Unit;

Unit.new( factor => 0.000000001, offset => 0, defn => 'nanometre', type => '',
	  dims => [1,0,0,0,0,0,0,0], dmix => ("metre"=>1).MixHash, 
	  names => ['nm'], stock => True );

}

sub do-postfix( Real $v, Str $n, Str $t ) {
	my $pmt = "Physics::Measure::$t";
	return ::($pmt).new(value => $v, units => $n);
} 

sub postfix:<nm> (Real:D $x) is export(:DEFAULT) { do-postfix($x,'nm','Length') }

#EOF
