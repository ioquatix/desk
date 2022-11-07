
use <wood.scad>;

height = 1070;

module room() {
	translate([-3300/2, -400, 0])
	color("white") difference() {
		translate([-100, -100, -100])
		cube([3300+200, 1200, 2400+200]);
		cube([3300, 1100+1, 2400+200]);
	}
}

room();

module monitors() {
	translate([3300 * (1/6), -300, 430]) {
		rotate([0, 0, -30]) translate([-720, -200, 0]) cube([730, 30, 430], true);
		cube([730, 30, 430], true);
		rotate([0, 0, 30]) translate([720, -200, 0]) cube([730, 30, 430], true);
	}
	
	translate([3300 * (-2/6), -300, 430])
	cube([730, 30, 430], true);
}

translate([0, 0, height])
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
