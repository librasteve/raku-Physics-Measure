unit module Math::Polygons:ver<0.0.1>:auth<Steve Roe (p6steve@furnival.net)>;

use Math::Polygons::Drawing;
use Physics::Measure;
use Physics::Measure::Unit;

#|only doing Isosceles Triangles for now
class Triangle is Polygon is export {
    has Point $.apex is required;
    has       $.side is required;

    method points() {
        ($!apex, |self.base-points);
    }   

    method base-points() {
        my $y = $!apex.y + self.height;
        my \A = Point.new(:$y, x => $!apex.x - ( $!side / 2 ));
        my \C = Point.new(:$y, x => $!apex.x + ( $!side / 2 ));
        return( A, C );
    }   

    method height() { 
        sqrt($!side**2 - ($!side/2)**2)
    }   
    
    method base() { 
        $!side 
    }   

    method area( ) { 
        ( $.height * $.base ) / 2 
    }   
}

class Quadrilateral is Polygon is export {
    has Point @.points;

    multi method new( \A, \B, \C, \D ) {
        self.bless( points => ( A, B, C, D ) );
    }
    method A { @!points[0] };
    method B { @!points[1] };
    method C { @!points[2] };
    method D { @!points[3] };

    method area( ) { 
        warn "I am not smart enough to figure this out!"; 
    }   
}

class Rectangle is Quadrilateral is export {
    has Point $.origin;
    has       $.width;
    has       $.height;
    
    method area() { 
        $.height * $.width 
    }   

    method serialize( --> Pair) {
        rect => [ x =>  $!origin.x, y => $!origin.y, width => $!width, height => $!height, |self.styles ];
    }
}

class Square is Rectangle is export {
    has Point $.origin;
    has       $.side;

    method area() { 
        $.side ** 2 
    }   

    method serialize( --> Pair) {
        rect => [ x =>  $!origin.x, y => $!origin.y, width => $!side, height => $!side, |self.styles ];
    }
}
