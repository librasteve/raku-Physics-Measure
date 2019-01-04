unit module Math::Polygons::Drawing:ver<0.0.1>:auth<Steve Roe (p6steve@furnival.net)>;

use SVG;

class Drawing is export {
    role Element is export {
        method serialize() {
            ...
        }
    }

    role Styled is export {
        has Str $.fill   = 'red';
        has Str $.stroke = 'blue';
        has Int $.stroke-width = 3;

        method styles() {
            ( stroke => $!stroke, stroke-width => $!stroke-width, fill => $!fill ).grep( { .value.defined } );
        }

    }

    has Element @.elements;

    has Int $.width = 1024;
    has Int $.height = 768;

    class Group does Element is export {
        has Element @.elements;
        method serialize( --> Pair ) {
            g => @!elements.map( -> $e { $e.serialize }).list;
        }
    }

    class Point is export {
        has $.x;
        has $.y;

        multi method new($x, $y) {
            self.bless(:$x, :$y);
        }

        method Str( --> Str ) {
            return "$!x, $!y";
        }
    }

    class Polygon does Element does Styled is export {
        has Point @.points;

        method serialize( --> Pair ) {
            polygon => [ points => @.points.join(' '), |self.styles ];
        }
    }

    method dimensions() {
        ( height => $!height, width => $!width ).grep( { .value.defined } );
    }

    method serialize( --> Str ) {
        SVG.serialize(svg =>  [ |self.dimensions, |@!elements.map(-> $e { $e.serialize })]);
    }
}


