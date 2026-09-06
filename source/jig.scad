
use <bolts.scad>;

size = 190/4+10;
echo("size", size);

render()
difference() {
	translate([0, 0, -5])
	hull() {
		cube([24,20,10]);
		
		translate([size - 20, 0, 0])
		cube([24,20,10]);
	}
	
	translate([0, 0, -5])
	hull() {
		cube([20,20,5]);
		
		translate([size - 20, 0, 0])
		cube([20,20,5]);
	}
	
	translate([10, 10, 0])
	hole(3, 5);
	
	translate([10 + size - 20, 10, 0])
	hole(3, 5);
}