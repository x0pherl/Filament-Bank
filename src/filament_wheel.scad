/****************************************************************************
the wheel that the filament bank travels along
*****************************************************************************/
include <filament_bank_values.scad>

wheel(wheel_radius = wheel_radius, axle_radius=bearing_d/2, depth = spoolwheel_thickness, rim_thickness=rim_width, spoke_thickness=spoke_width);


module wheel(wheel_radius=25, axle_radius=10, depth=2, spoke_thickness=2, rim_thickness=2) {
        difference() {
            //rim
            cylinder(r=wheel_radius, h=depth);
            translate([0,0,-1]) 
                cylinder(r=wheel_radius-rim_thickness, h=depth+2);
            //channel for the filament
            translate([0,0, depth/2]) 
                rotate_extrude(convexity = 10)
                    translate([wheel_radius+detail_tolerance/2, 0, 0])
                        circle(r = depth/2, $fn=4);
        }
        
        //axle hub
        difference() {
            cylinder(r=axle_radius+rim_thickness, h=depth);
            translate([0,0,-1]) 
                cylinder(r=axle_radius, h=depth+2);
        }

        //spokes
        for (ii=[0:spoke_count-1]) {
            rotate([0,0,360/spoke_count*ii]) 
                axle(wheel_radius=wheel_radius, axle_radius=axle_radius+rim_width, depth=depth, spoke_thickness=spoke_thickness, rim_thickness=rim_thickness); 
        }
}


module axle(wheel_radius=25, axle_radius=10, depth=2, spoke_thickness=2, rim_thickness=2) {
    axle_length = (wheel_radius+axle_radius)/2;
    difference() {
        translate([axle_length-axle_radius,0,0])
            difference() {
                cylinder(r=axle_length, h=depth);
                translate([0,0,-1]) 
                    cylinder(r=axle_length-spoke_thickness, h=depth+2);
                translate([-wheel_radius,0,-1]) 
                    cube([wheel_radius*2, wheel_radius*2, depth+2]);
            }
        //cut off the part that extends into the rim
        difference() {
            cylinder(r=wheel_radius+2, h=depth);
            translate([0,0,-1]) 
                cylinder(r=wheel_radius-rim_thickness, h=depth+2);
        }
    }            
}