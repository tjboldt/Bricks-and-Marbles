brickWidth = 31.75;
brickHeight = 19.19;
brickHeightWithNubs = 23.75;
nubHeight = brickHeightWithNubs - brickHeight;
nubOuter=9.38/2;
nubInner=6.75/2;//6.72/2;
nubOuterToOuter=25.43;
nubSpacing=nubOuterToOuter-nubOuter*2;
wallThickness=1.10;
radius=0.8;
bevel=radius/2;
tickOutside=17.02;
tickInside=14.93;
tickThickness=(tickOutside-tickInside)/2;
tickOffset=(brickWidth-tickOutside)/2;
tickLength=3.30/*3.21*/-wallThickness;
underNubOuter=13.18/2;
underNubInner=10.73/2;

module Brick(xBricks, yBricks, zBricks) {
	for (y = [0:1:yBricks-1]) {
		for (x = [0:1:xBricks-1]) {
			translate([x*brickWidth,y*brickWidth,0])
			2x2brick(zBricks);
		}
	}

	brickBlock(brickWidth*xBricks, brickWidth*yBricks, zBricks * brickHeight);
}

module Block(width, length, height) {
	bevelledBox(width, length, height, radius, bevel);
}


module bevelledBox(width, length, height, radius, bevel) {
	hull() {
		translate([radius,radius,height/2])
		cylinder(height-bevel*2, radius, radius, $fn=50, center=true);
		translate([radius,radius,height/2])
		cylinder(height, radius-bevel, radius-bevel, $fn=50, center=true);

		translate([width-radius,radius,height/2])
		cylinder(height-bevel*2, radius, radius, $fn=50, center=true);
		translate([width-radius,radius,height/2])
		cylinder(height, radius-bevel, radius-bevel, $fn=50, center=true);

		translate([width-radius,length-radius,height/2])
		cylinder(height-bevel*2, radius, radius, $fn=50, center=true);
		translate([width-radius,length-radius,height/2])
		cylinder(height, radius-bevel, radius-bevel, $fn=50, center=true);

		translate([radius,length-radius,height/2])
		cylinder(height-bevel*2, radius, radius, $fn=50, center=true);
		translate([radius,length-radius,height/2])
		cylinder(height, radius-bevel, radius-bevel, $fn=50, center=true);
	}
}

module nub(outer, inner, height) {
	difference() {
		hull() {
			translate([0,0,-bevel])
			cylinder(height, outer, outer, center=true, $fn=50);
			cylinder(height, outer-bevel, outer-bevel, center=true, $fn=50);
		}

		cylinder(height+1, inner, inner, center=true, $fn=50);
		translate([0,0,height/2-bevel/2])
		cylinder(bevel+0.01, inner, inner+bevel, center=true, $fn=50);
	}
}

module brickBlock(width, length, height) {
	difference() {
		Block(width, length, height);
		translate([wallThickness, wallThickness, -0.01])
		Block(width-wallThickness*2, length-wallThickness*2, height-wallThickness+0.01);
	}
}

module 2x2brick(zBricks) {
	brickBlock(brickWidth, brickWidth, brickHeight*zBricks);

    // top nubs
	for (y = [0:1:1]) {
		for (x = [0:1:1]) {
			nubStart = nubOuter + (brickWidth-nubOuterToOuter)/2;
			translate([nubStart + x*nubSpacing, nubStart + y*nubSpacing, brickHeight*zBricks+nubHeight/2])
			nub(nubOuter, nubInner, nubHeight);	
		}
	}

    // bottom nub
	translate([brickWidth/2, brickWidth/2, (brickHeight*zBricks-wallThickness)/2+0.01])
	rotate([180,0,0])
	nub(underNubOuter, underNubInner, brickHeight*zBricks-wallThickness);

    // bottom ticks
	translate([tickOffset,wallThickness,0])
	cube([tickThickness,tickLength,brickHeight*zBricks-wallThickness+0.01]);

	translate([brickWidth-tickOffset-tickThickness,wallThickness,0])
	cube([tickThickness,tickLength,brickHeight*zBricks-wallThickness+0.01]);

	translate([wallThickness,tickOffset,0])
	cube([tickLength,tickThickness,brickHeight*zBricks-wallThickness+0.01]);

	translate([wallThickness, brickWidth-tickOffset-tickThickness,0])
	cube([tickLength,tickThickness,brickHeight*zBricks-wallThickness+0.01]);

	translate([tickOffset,brickWidth-tickLength-wallThickness,0])
	cube([tickThickness,tickLength,brickHeight*zBricks-wallThickness+0.01]);

	translate([brickWidth-tickOffset-tickThickness,brickWidth-tickLength-wallThickness-0.01,0])
	cube([tickThickness,tickLength,brickHeight*zBricks-wallThickness+0.01]);

	translate([brickWidth-tickLength-wallThickness,tickOffset,0])
	cube([tickLength,tickThickness,brickHeight*zBricks-wallThickness+0.01]);

	translate([brickWidth-tickLength-wallThickness, brickWidth-tickOffset-tickThickness,0])
	cube([tickLength,tickThickness,brickHeight*zBricks-wallThickness+0.01]);
    
    // bottom nub supports
	translate([brickWidth/2,brickWidth/4-underNubOuter/2+wallThickness/2,(brickHeight*zBricks)/2])
	cube([wallThickness,brickWidth/2-underNubOuter,brickHeight*zBricks],center=true);
    
	translate([brickWidth/2,brickWidth-brickWidth/4+underNubOuter/2-wallThickness/2,(brickHeight*zBricks)/2])
	cube([wallThickness,brickWidth/2-underNubOuter,brickHeight*zBricks],center=true);    
}

//Brick(1,1,1);
