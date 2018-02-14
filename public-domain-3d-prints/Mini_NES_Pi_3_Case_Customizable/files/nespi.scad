/* [Case Options] */

// Which part to render; in OpenSCAD, use "everything" to render all models at once
 part = "everything"; // [top_light_gray:Top Part,bottom_dark_gray:Bottom Part,lid_light_gray:Lid,attachment_ribbons_black:Attachment Ribbons,foot_flexible_black_4x:Foot,front_button_dark_gray_2x:Front Button,led_red_transparent:Red LED]

// You can choose between square vent holes (looks more like the original NES, but is a bit harder to print) and rounded vent holes (easier to print, slightly more modern look)
top_vent_holes_type = "original_square"; // [original_square, modern_rounded]

// Top text line on the front lid
logo_top = "Raspberry Pi";

// Bottom text line on the front lid (most slicers won't show this properly, so leave empty unless you have a high-res printer)
logo_bottom = "Entertainment System";

// Resolution of the round parts
resolution = 15; // [6:100]

/* [Raspberry Pi] */

// How the Pi is oriented inside the case. Normal means you don't have access to the SD card, Ethernet port and two USB ports. Upside-down gives you access to everything, but adds additional port holes in the back of the model. Sideways moves the power, audio, and HDMI ports to the back, and leaves everything else inaccessible from the outside
raspberry_pi_orientation = "upside-down"; // [normal, upside-down, sideways]

// Screws you want to use to attach the Raspberry Pi to the studs that hold it in place
screw_size = 3.08; // [M3:3.08, M2.5:2.58]

// Wether there are attachments for a fan, and how it is oriented
fan = "no-fan"; // [no-fan, bottom-fan-30mm]

/* [Hidden] */

// Outer edge rounded corner radius
case_border_radius = 1;

// Case thickness
thickness = 2;

// download a raspberry pi model from thingiverse for this to work
case_width = 120;
print_pi_model = false;
raspberry_pi_stl = "../Raspberry_Pi_B_board/B+_Model_v4.stl";

module pi() {
	if(print_pi_model) {
		if(raspberry_pi_orientation == "upside-down") {
			 translate([0,194,15]) translate([-0.7,8,16]) rotate([0,0,-90]) translate([52,-40,0]) rotate([0,180,0]) import(raspberry_pi_stl);
		} else if(raspberry_pi_orientation == "sideways") {
			translate([1.8,1.7,0]) translate([90,98.5,15+16]) rotate([0,180,180]) translate([52,-40,0]) import(raspberry_pi_stl);
		} else {
			translate([-0.7,8,16]) rotate([0,0,-90]) translate([52,-40,0]) import(raspberry_pi_stl);
		}
	}
}
module black_ribbon_cutout_insert() {
	width = 67+15;
	ribbon_width = 20-0.7;
	insert_width = 3-0.2;
    z_offset = 0;
	black_ribbon_cutout(width, ribbon_width, insert_width, z_offset, true);
}
module black_ribbon_cutout_cutout() {
	width = 67+15-0.01;
	ribbon_width = 20;
	insert_width = 3.5;
    z_offset = 0.8;
	black_ribbon_cutout(width, ribbon_width, insert_width, z_offset, false);
}
module black_ribbon_cutout(width, ribbon_width, insert_width, z_offset, printed_part) {
	// front
	difference() {
		union() {
			translate([width-(ribbon_width-20),-2,-5]) cube([ribbon_width,3,50]);
			
			if(printed_part) {
				translate([width-(ribbon_width-20)+0.25,-2+0.25,-2+z_offset+0.25]) minkowski() {
					cube([ribbon_width-0.5,10-0.5,3-0.5]);
					sphere(r=0.25, $fn=80, center=true);
				}
				translate([width-(ribbon_width-20)+0.25,-2+0.25,40-1-z_offset+0.25]) minkowski() {
					cube([ribbon_width-0.5,16-0.5,3-0.5]);
					sphere(r=0.25, $fn=80, center=true);
				}

				translate([width-(ribbon_width-20)+1,-2+10-3+(3-insert_width)+1,0+1]) minkowski() {
					cube([ribbon_width-2,insert_width-2,5-2]);
					sphere(r=1, $fn=80, center=true);
				}
				translate([width+5-(ribbon_width-20)+1,-2+16-3+(3-insert_width)+1,40-2.5-2+1]) minkowski() {
					cube([ribbon_width-5-2,insert_width-2,5-2]);
					sphere(r=1, $fn=80, center=true);
				}
			} else {
				translate([width-(ribbon_width-20),-2,-2+z_offset]) cube([ribbon_width,10,3]);
				translate([width-(ribbon_width-20),-2,40-1-z_offset]) cube([ribbon_width,16,3]);
				
translate([width-(ribbon_width-20),-2+10-3+(3-insert_width),0]) cube([ribbon_width,insert_width,5]);
				translate([width+5-(ribbon_width-20),-2+16-3+(3-insert_width),40-2.5-2]) cube([ribbon_width-5,insert_width,5]);
			}
			
			// back
			translate([width-(ribbon_width-20),100-1,-5]) cube([ribbon_width,3,50]);
			
			if(printed_part) {
				translate([width-(ribbon_width-20)+0.25,100-10+0.25,-2+z_offset+0.25]) minkowski() {
					cube([ribbon_width-0.5,10-0.5,3-0.5]);
					sphere(r=0.25, $fn=80, center=true);
				}
				translate([width-(ribbon_width-20)+0.25,100-16+0.25,40-1-z_offset+0.25]) minkowski() {
					cube([ribbon_width-0.5,16-0.5,3-0.5]);
					sphere(r=0.25, $fn=80, center=true);
				}

				translate([width-(ribbon_width-20)+1,100-2-10+2+1,0+1]) minkowski() {
					cube([ribbon_width-2,insert_width-2,5-2]);
					sphere(r=1, $fn=80, center=true);
				}
				translate([width-(ribbon_width-20)+1,100-2-16+2+1,40-2.5-2+1]) minkowski() {
					cube([ribbon_width-2,insert_width-2,5-2]);
					sphere(r=1, $fn=80, center=true);
				}
			} else {
				translate([width-(ribbon_width-20),100-10,-2+z_offset]) cube([ribbon_width,10,3]);
				translate([width-(ribbon_width-20),100-16,40-1-z_offset]) cube([ribbon_width,16,3]);
				
				translate([width-(ribbon_width-20),100-2-10+2,0]) cube([ribbon_width,insert_width,5]);
				translate([width-(ribbon_width-20),100-2-16+2,40-2.5-2]) cube([ribbon_width,insert_width,5]);
			}
		}
		if(printed_part) {
			// chamfer  inner edges
			
			// front
			translate([width-(ribbon_width-20),0.5,1]) rotate([0,0,45]) cube([3,3,40-2]);
			translate([width+(ribbon_width)+0.3,1,1]) rotate([0,0,-45]) cube([3,3,40-2]);
			
			// back
			translate([width-(ribbon_width-20),100-4.8,1]) rotate([0,0,45]) cube([3,3,40-2]);
			translate([width+(ribbon_width)+0.3,100-0.9,1]) rotate([0,0,-45]) cube([3,3,40-2]);
		}
	}
	
}
module four_screws_bottom() {
	difference() {
		union() {
			translate([6-0.7,33.4,0]) screw_support_bottom();
			translate([55-0.7,33.4,0]) screw_support_bottom();
			translate([6-0.7,33.4+58,0]) screw_support_bottom();
			translate([55-0.7,33.4+58,0]) screw_support_bottom();
		}
		
		if(raspberry_pi_orientation != "normal") {
			translate([50,17.2,20]) cube([20,52.5,50]);
			translate([30.8,60,20]) cube([20,52.5,20]);
			translate([0,16.7,20]) cube([20,20,50]);
			translate([8,0,20]) cube([20,80,50]);
		}
	}
}
module screw_support_bottom() {
	if(raspberry_pi_orientation == "upside-down") {
		translate([0,-18.8,0]) {
			difference() {
				cylinder(d=8, h=26.5, $fn=resolution, center=false);
				translate([0,0,1]) cylinder(d=screw_size, h=100, $fn=resolution, center=false);
			}
		}
	} else if(raspberry_pi_orientation == "sideways") {
		translate([0,-18.8,0]) {
			difference() {
				cylinder(d=8, h=26.5, $fn=resolution, center=false);
				translate([0,0,1]) cylinder(d=screw_size, h=100, $fn=resolution, center=false);
			}
		}
	} else {
		difference() {
			cylinder(d=8, h=18.5, $fn=resolution, center=false);
			translate([0,0,1]) cylinder(d=screw_size, h=100, $fn=resolution, center=false);
		}
	}
}
module bottom_shell(x, y, z) {
	difference() {
		minkowski() {
			difference() {
				translate([case_border_radius/2,case_border_radius/2,case_border_radius/2]) cube([x-case_border_radius,y-case_border_radius,z], center=false);
				bottom_shell_sidecut(x,y,z);
			}
			sphere(d=1+case_border_radius, $fn=resolution, center=true);
		}

		// sharp top edge
		translate([-5,-5,z]) cube([x+10,y+10,z], center=false);
	}
}
module bottom_shell_sidecut(x,y,z) {
	translate([20,(y+20)/2,20]) {
		translate([-40+4.5,-10,-20]) rotate([0,-20,0]) cube([40,y+20,40], center=true);
		translate([x-4.5,-10,-20]) rotate([0,20,0]) cube([40,y+20,40], center=true);
	}
}
module feet_cutout() {
	// feet inserts
	foot_x_offset = 13;
	translate([foot_x_offset,10,0]) cylinder(d=10, h=1.2, $fn=resolution, center=true);
	translate([case_width-foot_x_offset,10,0]) cylinder(d=10, h=1.2, $fn=resolution, center=true);
	translate([foot_x_offset,100-10,0]) cylinder(d=10, h=1.2, $fn=resolution, center=true);
	translate([case_width-foot_x_offset,100-10,0]) cylinder(d=10, h=1.2, $fn=resolution, center=true);
}
module fan(size, render_cutouts) {
	#cube([size,size,10]);
	if(render_cutouts) {
		translate([size/2,size/2,0]) cylinder(d=size-0.2, h=30, $fn=resolution, center=true);
		translate([3,3,0]) cylinder(d=2.7, h=30, $fn=resolution, center=true);
		translate([size-3,3,0]) cylinder(d=2.7, h=30, $fn=resolution, center=true);
		translate([3,size-3,0]) cylinder(d=2.7, h=30, $fn=resolution, center=true);
		translate([size-3,size-3,0]) cylinder(d=2.7, h=30, $fn=resolution, center=true);
	}
}
module bottom(support) {
	// modelled support
	if(support) {
		// black ribbon support
		support_height_1 = 1.3;
		// front
		translate([67+15+0.5,-2-0.4,-0.5]) cube([19,8,support_height_1]);
		// back
		translate([67+15+0.5,100-8,-0.5]) cube([19,10,support_height_1+0.5]);
	}
	
	if(fan == "bottom-fan-30mm" && print_pi_model) {
		translate([15,40,3.4]) fan(30, false);
	}
	
	// top case attachment ridge
	difference() {
		translate([1,1,2]) bottom_shell(case_width-2, 98, 20);
		translate([4,4,4]) bottom_shell(case_width-(2*4), 100-(2*4), 20);
		translate([0,0,20]) top_shell_finished();
		//cube([120,100,19.9]);
		
		// air vent cutout
		translate([10,5,-10]) cube([100,96-6,30]);
		translate([0,10,10]) cube([100,85,20]);
		
		// thin wall strenghtening strip cutout
		translate([75+3-0.1,-10,20]) cube([25.2,30,10]);
		
		// button insert interior
		translate([16.5-2,-1-0.5-0.5+0.5,6-2]) minkowski() {
			cube([26.5+4,20,12]);
			sphere(d=1, $fn=resolution, center=true);
		}
		
		if(raspberry_pi_orientation == "sideways") {
			translate([25,40,-10]) cube([40,96-6,50]);
		}
		if(raspberry_pi_orientation == "normal") {
			sd_card_back();
		}

		translate([0,0,20]) back_insert();
	}
	
	//shell
	difference() {
		bottom_shell(case_width, 100, 20);
		translate([thickness,thickness,thickness+2]) bottom_shell(case_width-(2*thickness), 100-(2*thickness), 20);
		
		black_ribbon_cutout_cutout();
		feet_cutout();
	
		// fan cutouts
		if(fan == "bottom-fan-30mm") {
			translate([15,40,3.4]) fan(30, true);
		}
		
		// cooling
		for(i = [20:10:80]) {
			hull() {
				translate([15,i,0]) cylinder(d=4, h=15, $fn=resolution, center=true);
				translate([50,i,0]) cylinder(d=4, h=15, $fn=resolution, center=true);
			}
			hull() {
				translate([70,i,0]) cylinder(d=4, h=15, $fn=resolution, center=true);
				translate([case_width-15,i,0]) cylinder(d=4, h=15, $fn=resolution, center=true);
			}
		}
		
		sd_card_back();
		
		buttons();
		
		// button inset
		translate([16.5-2,-1-0.5-0.5+0.5,6-2]) minkowski() {
			cube([26.5+4,1.2,30]);
			sphere(d=1, $fn=resolution, center=true);
		}
		
		translate([0,0,20]) {
			port_insert();
			back_insert();
		}
	}
	//support
	difference() {
		if(raspberry_pi_orientation == "sideways") {
			translate([79.1+1.8,38.3+1.7,0]) rotate([0,0,90]) four_screws_bottom();
		} else {
			four_screws_bottom();
		}
		feet_cutout();
		bottom_shell_sidecut(case_width, 100, 20); // make sure support doesn't extend out of case
		translate([0,0,20]) back_insert();
	}
}
module top_shell(x, y, z) {
	difference() {
		minkowski() {
			translate([case_border_radius/2,case_border_radius/2,-case_border_radius/2]) cube([x-case_border_radius,y-case_border_radius,z], center=false);
			sphere(d=1+case_border_radius, $fn=resolution, center=true);
		}
		
		// sharp bottom edge
		translate([-5,-5,-z]) cube([x+10,y+10,z], center=false);
	}
}
module top_shell_finished() {
	difference() {
		top_shell(case_width, 100, 20);
		translate([thickness,thickness,-thickness-2]) top_shell(case_width-(2*thickness), 100-(2*thickness), 20);
	}
}
module hinge_axis_insert() {
	diameter = 1.8;
	length_offset = -0.6;
	hinge_axis(diameter, length_offset);
}
module hinge_axis_hole() {
	diameter = 2.2;
	length_offset = -0.2;
	hinge_axis(diameter, length_offset);
}
module hinge_axis(diameter, length_offset) {
	hull() {
		translate([15-1-length_offset,15-2,19]) rotate([0,90,0]) sphere(d=diameter, $fn=resolution, center=true);
		translate([15+67+1+length_offset,15-2,19]) rotate([0,90,0]) sphere(d=diameter, $fn=resolution, center=true);
	}
}
module audio_port() {
	hull() {
		translate([0,0,3]) rotate([0,90,0]) cylinder(d=8, h=15, $fn=resolution, center=true);
		translate([0,0,0]) rotate([0,90,0]) cylinder(d=8, h=15, $fn=resolution, center=true);
	}
}
module port_insert() {
	if(raspberry_pi_orientation == "upside-down") {
		translate([-0.4,-20,0]) translate([-3.8+1,35,-1])  minkowski() {
			cube([2,56,10]);
			sphere(d=3, $fn=resolution, center=true);
		}
	} else if(raspberry_pi_orientation == "sideways") {
		translate([65+1.5,66.5,0]) translate([-3.8+1,35,-1]) rotate([0,0,90]) minkowski() {
			cube([2,56,10]);
			sphere(d=3, $fn=resolution, center=true);
		}
	} else {
		translate([-3.8+1,35,-1])  minkowski() {
			cube([2,56,10]);
			sphere(d=3, $fn=resolution, center=true);
		}
	}
}
module back_insert() {
	if(raspberry_pi_orientation == "upside-down") {
		translate([5,50+45,-9.5]) minkowski() {
			cube([50,10,13+1.5]);
			sphere(d=3, $fn=resolution, center=true);
		}
	}
}
module upside_down_port_holes() {
	// audio port
	translate([0,23,1.2]) translate([-0.99,41.5,0]) hull() {
		audio_port();
		//translate([-10,0,0]) scale([1,2,2]) audio_port();
	}
	
	// hdmi port
	translate([0,-20.3,0]) hull() {
		translate([10,56,6]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
		translate([10,56,0]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
	
		translate([10,56+14.5,6]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
		translate([10,56+14.5,0]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
	}
	
	// power connector
	translate([0,-62.8,3.6]) hull() {
		translate([10,81,4]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
		translate([10,81,0.5]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
	
		translate([10,88,4]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
		translate([10,88,0.5]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
	}
}
module top(no_black_ribbon_cutout) {
	// modelled support
	if(!no_black_ribbon_cutout) {
		// black ribbon support
		support_height_1 = 1.7;
		// front
		translate([67+15-0.01-0.5,-2-0.4,40-0.5+1-support_height_1]) cube([20,16,support_height_1]);
		bridging_nib_width = 1.3;
		bridging_nib_height = 0.8;
		translate([67+15-0.01-0.5-2,-2-0.4,40-0.5+1-support_height_1-bridging_nib_height]) cube([bridging_nib_width+2,16,support_height_1+bridging_nib_height]);
		// top
		translate([67+15-0.01-0.5-2+0.45+0.8-3,-2-0.4+0.5+1,40-0.5+1-support_height_1-bridging_nib_height-13+0.1]) cube([4,3.5,0.6]);
		
		// back
		translate([67+15-0.01+0.5,100-14,40-0.5+1-support_height_1]) cube([19,16,support_height_1]);
		// opening overhang support
		overhang_support_height = 15.2;
		translate([21.7,-2,25.1-overhang_support_height+15.4]) cube([60-0.2,4,overhang_support_height]);
	}
	
	//shell
	translate([0,0,20]) {
		difference() {
			union() {
				top_shell_finished();
				
				// door hinge attachment
				difference() {
					union() {
						translate([15-2,15-2,15+2.5+1]) rotate([0,90,0]) cylinder(d=8, h=4, $fn=resolution, center=true);
						translate([15+67+2,15-2,15+2.5+1]) rotate([0,90,0]) cylinder(d=8, h=4, $fn=resolution, center=true);
					}
					translate([0,0,20]) cube([case_width,100,20], center=false);
				}
			}
			
			if(!no_black_ribbon_cutout) {
				translate([0,0,-20]) black_ribbon_cutout_cutout();
			}
			
			// door cutoff
			translate([15,-1,5]) cube([67,15,16]);
			
			// door chamfer
			hull() {
				translate([15,-1+5,5+4]) cube([67,10,11]);
				translate([15,-1+5+5,5]) cube([67,10,11]);
			}
			
			// door hinge attachment
			hinge_axis_hole();
			
			// air vents
			if(top_vent_holes_type == "original_square") {
				for(i = [20:5.96:80]) {
					translate([67+15-0.01,-2+1.4+i-1.5,0]) cube([20,3,40]);
				}
				translate([67+15-0.01,-2+1.4-1.5,20]) cube([1,100,4]);
				translate([67+15-0.01+20-1,-2+1.4-1.5,20]) cube([1,100,4]);
			} else {
				for(i = [20:5.96:80]) {
					translate([67+15-0.01,-2+1.4+i,20]) hull() {
						translate([1.5,0,0]) cylinder(d=3, h=40, $fn=resolution, center=true);
						translate([18.5,0,0]) cylinder(d=3, h=40, $fn=resolution, center=true);
					}
				}
			}
			
			if(raspberry_pi_orientation == "upside-down") {
				upside_down_port_holes();
			} else if(raspberry_pi_orientation == "sideways") {
				translate([65-70+1.5,66.5,0]) translate([-3.8+1,35,-1]) rotate([0,0,-90]) upside_down_port_holes();
			} else {
			
				// audio port
				translate([-0.99,41.5,0]) hull() {
					audio_port();
					//translate([-10,0,0]) scale([1,2,2]) audio_port();
				}
				
				// hdmi port
				hull() {
					translate([10,56,6]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
					translate([10,56,0]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
				
					translate([10,56+14.5,6]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
					translate([10,56+14.5,0]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
				}
				
				// power connector
				hull() {
					translate([10,81,3]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
					translate([10,81,0]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
				
					translate([10,88,3]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
					translate([10,88,0]) rotate([0,90,0]) cylinder(d=2, h=40, $fn=resolution, center=true);
				}
				
			}
			
			// ports inset
			port_insert();
			
			// back ports for upside-down pi
			back_insert();
		}
		
		// strenghtening part where ribbon attaches front
		translate([67+15-0.01,-0.4+2-0.2,0]) cube([21,1,20-3]);
		translate([67+15-0.01-4,-0.4+2-0.2,0]) cube([21+4,1,20-3-12]);
	}
}
module door() {
    difference() {
        intersection() {
            top_shell_finished();
            translate([15+0.2,-1,5]) cube([67-0.4-0.2,15,16]);
        }
        // inner chamfer
        translate([15,21,12]) rotate([45,0,0]) cube([67,15,16]);
    }
	hinge_axis_insert();
	
	translate([18,1,12]) rotate([90,0,0]) {
		linear_extrude(2.4) text(logo_top, size=4, font="Liberation Sans:style=Bold");
	}
	translate([18,1,9]) rotate([90,0,0]) {
		linear_extrude(2.2) text(logo_bottom, size=2);
	}
	hull() {
		translate([15-0.4+40,0,6]) rotate([0,90,0]) sphere(d=2, $fn=resolution, center=true);
		translate([15+67+0.4-40,0,6]) rotate([0,90,0]) sphere(d=2, h=4, $fn=resolution, center=true);
	}
}
module black_ribbons() {
	intersection() {
		union() {
			bottom_shell(case_width, 100, 20);
			translate([0,0,-0.01]) top(true);
		}
		black_ribbon_cutout_insert();
	}
}
module sd_card_back() {
	minkowski() {
		translate([22.8,78,13]) cube([14,20,5+1]);
		sphere(d=1, $fn=resolution, center=true);
	}
}
module buttons() {
	// buttons front
	translate([20,-1,6]) cube([10+1,20,5+1]);
	translate([32,-1,6]) cube([10+1,20,5+1]);
	
	// led front
	translate([18-1.5-0.5,-1,6+1.5]) cube([2+1,20,2+1]);
}
module button() {
	minkowski() {
		union() {
			// buttons front
			translate([20,-1,6]) cube([10-1,3,5-1]);
		}
		sphere(d=1.5, $fn=resolution, center=true);
	}
	
	translate([20-1,2,6-2]) cube([10-1+2,1,5-1+4]);
}
module led() {
	minkowski() {
		union() {
			// led front
			translate([18-1.5,0.5,6+1.5]) cube([2-1,1.5,2-1]);
		}
		sphere(d=1.5, $fn=resolution, center=true);
	}
	
	translate([18-1.5-1.3,2,6+1.5-2]) cube([2-1+2,1,2-1+4]);
}
module foot() {
	translate([0,0,0.5]) minkowski() {
		hull() {
			cylinder(d=8.2, h=1, $fn=resolution, center=true);
			translate([0,0,2]) cylinder(d=5, h=0.1, $fn=resolution, center=true);
		}
		sphere(d=1, $fn=resolution, center=true);
	}
}
/*
part = "everything"; // [everything:Everything,top_light_gray:Top part,bottom_dark_gray:Bottom part,lid_light_gray:Lid,attachment_ribbons_black:Attachment Ribbons,foot_flexible_black_4x:Foot,front_button_dark_gray_2x:Front Button,led_red_transparent:Red LED]
*/

#pi();
if(part == "everything" || part == "bottom_dark_gray") translate([0,0,0.5]) bottom(true);
//top();
if(part == "everything" || part == "top_light_gray") translate([-10,120,40.5]) rotate([0,180,90]) {
	top();
	#pi();
}
if(part == "everything" || part == "lid_light_gray") translate([2,120,20.5]) rotate([180,0,0]) door();
if(part == "everything" || part == "attachment_ribbons_black") translate([100,105,102]) rotate([0,90,90]) black_ribbons();
if(part == "everything" || part == "front_button_dark_gray_2x") translate([20,120,3]) rotate([-90,0,0]) button();
if(part == "everything") translate([35,120,3]) rotate([-90,0,0]) button();
if(part == "everything" || part == "led_red_transparent") translate([20-2,120,3]) rotate([-90,0,0]) led();
if(part == "everything" || part == "foot_flexible_black_4x") translate([-10-10,130,0.5]) foot();
if(part == "everything") translate([-10-30,130,0.5]) foot();
if(part == "everything") translate([-10-50,130,0.5]) foot();
if(part == "everything") translate([-10-70,130,0.5]) foot();
