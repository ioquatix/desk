
use <bolts.scad>;

size = 80;

difference() {
	hull() {
		cube([20,20,5]);
		
		translate([size - 20, 0, 0])
		cube([20,20,5]);
		
		translate([0, size - 20, 0])
		cube([20,20,5]);
	}
	
	translate([10, 10, 0])
	countersunk_hole(4, 5);
	
	translate([10 + size - 20, 10, 0])
	countersunk_hole(4, 5);
	
	translate([10, 10 + size - 20, 0])
	countersunk_hole(4, 5);
}