
use <wood.scad>;

height = 1070;
thickness = 20;

module room() {
	translate([-3300/2, -400, 0])
	color("white") difference() {
		translate([-100, -100, -100])
		cube([3300+200, 1200, 2400+200]);
		cube([3300, 1100+1, 2400+200]);
	}
}

room();

module monitor() {
	translate([0, -30/2 - 127, 0])
	cylinder(d=40, h=392);
	
	translate([0, 0, 392 - 20])
	cube([730, 30, 430], true);
}

module monitors(width = 2500) {
	translate([width/2 * (4/20), -200, 0]) monitor();
	translate([width/2 * (18/20), -200, 0]) monitor();
	
	translate([width/2 * (-11/21), -200, 0]) monitor();
	translate([width/2 * (-21/20), -200+260, 0]) rotate([0, 0, -45]) monitor();
	
	// translate([width/2 * (11/21), -200, 0]) monitor();
	// translate([width/2 * (21/20), -200+260, 0]) rotate([0, 0, 45]) monitor();
}

translate([0, 80, height+thickness])
monitors();

module levels() {
	translate([0, 0, height-300]) children();
	translate([0, 0, height-950]) children();
	translate([0, 0, height]) children();
}

module box() {
	translate([-100, 0, 0]) {
		translate([0,-250, 0])
		cube([200, 20, height]);
		
		translate([0,250-20, 0])
		cube([200, 20, height]);
		
		levels()
		translate([0,-250+20, -20])
		cube([200, 500-20-20, 20]);
	}
}

translate([-1200, 0, 0])
box();

translate([0, 0, 0])
box();

translate([1200, 0, 0])
box();

translate([-2600/2, -450/2, height-300]) {
	panel(2600, width=450);
}

translate([-2600/2, -450/2, height-950]) {
	panel(2600, width=450);
}

translate([-3000/2, -600/2, height]) {
	panel(3000);
}

module reflect(axis) {
	children();
	mirror(axis) children();
}

module human() {
	scale([1, 0.5, 1])
	cylinder(d=400, h=1860);
	
	color("white")
	reflect([1, 0, 0]) translate([-40, -100, 1700])
	sphere(d=40);
}

translate([3300 * (1/6), 500, 0]) human();
