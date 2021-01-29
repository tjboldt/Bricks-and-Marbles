module slide2D(slideOnly,fullTube) {
    difference() {
        if (slideOnly) {
            circle(r = 11.5,$fn=50);
        }
        circle(r = 10,$fn=50);
        if (slideOnly && !fullTube) {
            translate([0,7])
            square([30,10],center=true);
        }
    }
}

module curvedSlide(cornerAngle,descentAngle,slideOnly,fullTube,radius) {
    rotate_extrude(angle=cornerAngle,$fn=100)
    translate([radius,radius])
    rotate([0,0,descentAngle])
    slide2D(slideOnly=slideOnly,fullTube=fullTube);
}

module StraightSlide(length,slideOnly,fullTube) {
    rotate([270,180,0])
    linear_extrude(height=length)
    slide2D(slideOnly=slideOnly,fullTube=fullTube);
}

module DropSlide(slideOnly,fullTube) {
    translate([11.75,-30,31])
    rotate([0,0,90])
    StraightSlide(11.75,slideOnly=slideOnly,fullTube=fullTube);

    translate([11.70,-2,3])
    rotate([90,-45,0])
    curvedSlide(cornerAngle=45,descentAngle=360-90,slideOnly=slideOnly,fullTube=fullTube,radius=28);

    translate([41,-30,15.35])
    rotate([38.5,0,90])
    StraightSlide(15,slideOnly=slideOnly,fullTube=fullTube);

    translate([55,-1,40.9])
    rotate([90,123,0])
    curvedSlide(cornerAngle=35,descentAngle=90,slideOnly=slideOnly,fullTube=fullTube,radius=29);
    
    translate([63.5,-30,12])
    rotate([0,0,90])
    StraightSlide(11.75,slideOnly=slideOnly,fullTube=fullTube);
}

module CornerSlide(slideOnly,angle,fullTube) {
    curvedSlide(cornerAngle=angle,descentAngle=0,slideOnly=slideOnly,fullTube=fullTube,radius=15.65);
}

// Funnels are not aligned correctly and still experimental
/*
module funnel(funnelOnly) {
    difference() {
        if (funnelOnly) {
            union() {
                curvedSlide(cornerAngle=360,descentAngle=45,slideOnly=funnelOnly,fullTube=false,radius=62.60);
                translate([0,0,47])
                cylinder(12,12,70,center=true,$fn=100);

                translate([60,20,63])
                rotate([3,0,0])
                straightSlide(length=60,slideOnly=funnelOnly,fullTube=true);

            }
        }
    
        union() {
            curvedSlide(cornerAngle=360,descentAngle=90,slideOnly=false,radius=62.60);
            
            translate([0,0,47])
            cylinder(12.1,10,68,center=true,$fn=100);
            
            translate([0,0,68.8])
            cylinder(30,68,68,center=true,$fn=100);

            translate([0,0,57])
            cylinder(10,60,68,center=true,$fn=100);

            translate([60,20,63])
            rotate([3,0,0])
            straightSlide(length=60,slideOnly=false);

            translate([55,19,63])
            rotate([3,0,0])
            straightSlide(length=20,slideOnly=false);
        }
    }

    translate([-15,-15,41])
    rotate([270,0,0])
    curvedSlide(cornerAngle=90,descentAngle=90,slideOnly=funnelOnly,fullTube=true,radius=15);

    translate([-10,0,26.4])
    rotate([-6.5,0,90])
    straightSlide(length=80,slideOnly=funnelOnly,fullTube=true);
}

module smallFunnel(funnelOnly) {
    difference() {
        // the funnel and entrance
        if (funnelOnly) {
            union() {
                // funnel
                curvedSlide(cornerAngle=360,descentAngle=45,slideOnly=funnelOnly,fullTube=false,radius=31.30);
                translate([0,0,17])
                cylinder(12,12,35,center=true,$fn=100);
                
                // entrance tunnel
                translate([30,10,31.5])
                rotate([0,0,0])
                straightSlide(length=40,slideOnly=funnelOnly,fullTube=true);

            }
        }
    
        // everything to cut out
        union() {
            curvedSlide(cornerAngle=360,descentAngle=90,slideOnly=false,radius=31.3);
            
            translate([0,0,17])
            cylinder(12.1,10,34,center=true,$fn=100);
            
            translate([0,0,38])
            cylinder(30,34,34,center=true,$fn=100);

            translate([0,0,27])
            cylinder(10,30,34,center=true,$fn=100);

            translate([60,20,63])
            rotate([3,0,0])
            straightSlide(length=60,slideOnly=false);

            translate([30,10,31.5])
            rotate([0,0,0])
            straightSlide(length=50,slideOnly=false);
        }
    }

    // exit tunnel
    translate([-15,-15,11])
    rotate([270,0,0])
    curvedSlide(cornerAngle=90,descentAngle=90,slideOnly=funnelOnly,fullTube=true,radius=15);

    translate([-10,0,-3.6])
    rotate([-6.5,0,90])
    straightSlide(length=50,slideOnly=funnelOnly,fullTube=true);
}
*/

