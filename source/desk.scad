
use <wood.scad>;

height = 1070;

module leg(height = height, width = 550) {
	beam_width = 40;
	beam_thickness = 18;
	
	translate([-beam_thickness/2, width/2, 0]) {
		translate([0, -beam_width, 0]) beam(height, beam_thickness, beam_width);
	}
	
	translate([-beam_thickness/2, -width/2, 0]) {
		translate([0, 0, 0]) beam(height, beam_thickness, beam_width);
	}
	
	translate([-beam_thickness*1.5, 0, 0]) {
		translate([0, width/2, beam_width*2])
		rotate([90, 0, 0])
		beam(width, beam_thickness, beam_width);
		
		translate([0, width/2, height - beam_width])
		rotate([90, 0, 0])
		beam(width, beam_thickness, beam_width);
		
		translate([0, width/2, height - beam_width * 2 - 250])
		rotate([90, 0, 0])
		beam(width, beam_thickness, beam_width);
	}
}

module aframe() {
	translate([-200, 0, 0])
	rotate([0, 10, 0])
	leg();
	
	translate([200, 0, 0])
	rotate([0, -10, 0])
	mirror([1, 0, 0])
	leg();
}

translate([-1000, 0, 0])
aframe();

translate([0, 0, 0])
aframe();

translate([1000, 0, 0])
aframe();

translate([-2600/2, -450/2, height-300]) {
	panel(2600, width=450, thickness=18);
}

translate([-2600/2, -450/2, height-950]) {
	panel(2600, width=450, thickness=18);
}

translate([-3000/2, -600/2, height]) {
	panel(3000);
}
