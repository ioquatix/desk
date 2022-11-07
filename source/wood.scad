
$t = 20;

function odd(x) = (x % 2) == 1;

module beam(length = 1200, width = 42, depth = 42) {
	echo("beam", [length, width, depth]);
	cube([width, depth, length]);
}

module plank(length, width = 200, thickness = $t) {
	echo("plank", [length, width, thickness]);
	cube([length, width, thickness]);
}

module panel(length, width = 600, thickness = $t) {
	plank_width = width / 6;
	count = floor(width / plank_width);
	
	for (x = [0:1:count-1]) {
		color(odd(x) ? [0.8, 0.4, 0.1] : [0.7, 0.4, 0.1])
		translate([0, x * plank_width, 0]) plank(length, plank_width, thickness);
	}
}

module edged_panel(length, width = 600, thickness = $t, plank_width = 100, backing_width = 40) {
	count = floor(width / plank_width);
	
	translate([0, 0, thickness]) {
		for (x = [0:1:count-1]) {
			color(odd(x) ? [0.8, 0.4, 0.1] : [0.7, 0.4, 0.1])
			translate([0, x * plank_width, 0]) plank(length, plank_width, thickness);
		}
	}
	
	color([0.8, 0.45, 0.1])
	translate([0, 0, 0]) {
		plank(length, backing_width);
		translate([0, width - backing_width, 0]) plank(length, backing_width);
	}
	
	color([0.8, 0.35, 0.3])
	translate([0, width - backing_width, 0]) rotate([0, 0, -90]) {
		plank(width - backing_width*2, backing_width);
		translate([0, length-backing_width, 0]) plank(width - backing_width*2, backing_width);
	}
}
