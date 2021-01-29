include <MarbleSlides.scad>
include <Bricks.scad>

module 2x4Slide() {
    difference() {
        union() {
            Brick(1,2,0.5);

            Brick(1,1,1.5);
        }
        
        translate([-13.9,0,7.5])
        rotate([0,0,90])
        DropSlide();
    }

    translate([-13.9,0,7.5])
    rotate([0,0,90])
    DropSlide(slideOnly=true);
}

module 2x4SlideStackable() {
    difference() {
        Brick(1,2,3);
        
        translate([-13.9,0,7.5])
        rotate([0,0,90])
        DropSlide();
    }

    translate([-13.9,0,7.5])
    rotate([0,0,90])
    DropSlide(slideOnly=true,fullTube=true);
}

module 2x4Corner180() {
    difference() {
        Brick(2,1,0.5);
        translate([31.5,0,3.7])
        CornerSlide(slideOnly=false,angle=180);
    }

    translate([31.5,0,3.7])
    CornerSlide(slideOnly=true,angle=180,fullTube=false);
}

module 2x4Corner180Stackable() {
    difference() {
        Brick(2,1,2);
        translate([31.5,0,3.7])
        CornerSlide(slideOnly=false,angle=180);
    }

    translate([31.5,0,3.7])
    CornerSlide(slideOnly=true,angle=180,fullTube=true);
}

module 2x2Corner90() {
    difference() {
        Brick(1,1,0.5);
        translate([32.3-brickWidth,0,3.7])
        CornerSlide(slideOnly=false,angle=90);
    }

    translate([32.3-brickWidth,0,3.7])
    CornerSlide(slideOnly=true,angle=90);
}

module 2x2Corner90Stackable() {
    difference() {
        Brick(1,1,2);
        translate([31.7-brickWidth,0,3.7])
        CornerSlide(slideOnly=false,angle=90);
    }

    translate([31.7-brickWidth,0,3.7])
    CornerSlide(slideOnly=true,angle=90,fullTube=true);
}

module 4x4End() {
    difference() {
        union() {
            Brick(2,2,0.5);

            
            translate([16,0,19.3])
            StraightSlide(33,slideOnly=true,fullTube=false);
            
            translate([31.5,31.5,3.7])
            CornerSlide(slideOnly=true,angle=360);
        }
    
        translate([31.5,31.5,3.7])
        CornerSlide(slideOnly=false,angle=360);

        translate([16,0,19.3])
        StraightSlide(33,slideOnly=false,fullTube=false);
    }    
}

module 2x12StraightSlide() {
    difference() {
        union() {
            Brick(1,6,0.5);
            
            translate([0,0,brickHeight*0.5])
            Brick(1,3,0.5);
        }
        
        rotate([-3,0,0])
        translate([brickWidth/2,brickWidth*-0.1,brickHeight*1.52])
        StraightSlide(brickWidth*6.1,slideOnly=false,fullTube=false);
    }
    
    intersection() {
        rotate([-3,0,0])
        translate([brickWidth/2,brickWidth*-0.1,brickHeight*1.52])
        StraightSlide(brickWidth*6.1,slideOnly=true,fullTube=false);
        
        Block(brickWidth,brickWidth*6,brickHeight*3);
    }   
}

module 2x6StraightSlide() {
    difference() {
        union() {
            Brick(1,3,0.5);    
    
            Brick(1,1,1);
        }
        
        rotate([-6,0,0])
        translate([brickWidth/2,brickWidth*-0.1,brickHeight*1.52])
        StraightSlide(brickWidth*3.1,slideOnly=false,fullTube=false);
    }
    
    intersection() {
        rotate([-6,0,0])
        translate([brickWidth/2,brickWidth*-0.1,brickHeight*1.52])
        StraightSlide(brickWidth*3.1,slideOnly=true,fullTube=false);
        
        Block(brickWidth,brickWidth*3,brickHeight*3);
    }        
}

// Note: Funnels not aligned correctly... experimental only
/*
module 10x10Funnel() {
    intersection() {
        translate([83,79,2.5])
        funnel(funnelOnly=true);
        Block(brickWidth*5,brickWidth*5,brickHeight*5);
    }    
    
    difference() {
        Brick(5,5,3);
        translate([83,79,2.5])
        funnel(funnelOnly=false);
    }
}

module 6x6Funnel() {
    intersection() {
        translate([49,43,27])
        smallFunnel(funnelOnly=true);
        Block(brickWidth*3,brickWidth*3,brickHeight*5);
    }    
    
    difference() {
        Brick(3,3,2.5);
        translate([49,43,27])
        smallFunnel(funnelOnly=false);
    }
}

color("yellow")
10x10Funnel();
6x6Funnel();
*/

color("magenta")
translate([brickWidth*0,brickWidth*-4,0])
2x12StraightSlide();
//2x6StraightSlide();

color("orange")
translate([brickWidth*2,0,-brickHeight])
rotate([0,0,270])
4x4End();

color("red")
translate([0,brickWidth*-6,brickHeight*0.5])
2x4Slide();

color("blue")
translate([0,brickWidth*2,0])
2x4Corner180();
//2x4Corner180Stackable();

color("green")
translate([brickWidth*2,brickWidth*2,-brickHeight])
rotate([0,0,180])
2x4Slide();
//2x4SlideStackable();

color("purple")
rotate([0,0,180])
translate([-brickWidth*2,0,-brickHeight])
2x2Corner90();
//2x2Corner90Stackable();


