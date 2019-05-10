#!/usr/bin/env perl6
#t/13-ptr.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 4; 

use Math::Polygons;
use Physics::Measure;

class M-Point is Point {
    has Distance $.x;
    has Distance $.y;
}
class M-Polygon is Polygon {
    has M-Point @.points;
}
class M-Triangle is M-Polygon {
    has M-Point  $.apex is required;
    has Distance $.side is required;

    method points() {
        ($!apex, |self.base-points)
    }   
    method base-points() {
        my $y = $!apex.y + self.height;
        my \A = M-Point.new(:$y, x => $!apex.x - ( $!side / 2 )); 
        my \C = M-Point.new(:$y, x => $!apex.x + ( $!side / 2 )); 
        return( A, C );
    }   
    method height() {
        sqrt( $!side ** 2 - ( $!side / 2 ) ** 2 ) 
    }   
    method base() {
        $!side
    }   
    method area( ) { 
        ( $.height * $.base ) / 2 
    }   
}

my $x ♎️ '200 m'; 
my $y ♎️ '160 m'; 
my $s ♎️ '100 m'; 

my $apex     = M-Point.new(x => $x, y => $y),
my $triangle = M-Triangle.new( apex => $apex, side => $s );

my $drawing = Drawing.new( elements => [
    $triangle,
]);
#$drawing.serialize.say;

ok $triangle.side   eq '100 m',                 '$triangle.side';
ok $triangle.apex   eq '200 m, 160 m',          '$triangle.apex';
ok $triangle.height eq '86.6025403784439 m',    '$triangle.height';
ok $triangle.area   eq '4330.12701892219 m2',   '$triangle.area';

#done-testing
