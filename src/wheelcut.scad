/****************************************************************************
cuts 3 triangular-ish windows into the sides of the wheel so that
we can watch the filament wheel travel during ejection
*****************************************************************************/
include <filament_bank_values.scad>

module point(x,y) translate([x,y]) circle(0.01);

module wheelcut_flat(wheel_radius, rim_width, rounding_radius, axle_width, a0, a1) {
    $fa = 5;
    R = wheel_radius * sqrt(2) + 1;
    rotate([0,0,-15]) intersection() {
        difference() {
            circle(wheel_radius-rounding_radius-rim_width);
            circle(rounding_radius+axle_width+rim_width);
        }
        hull() {
            point(rounding_radius,rounding_radius);
            for(i = [0:4]){
                a = ((4 - i) * a0 + i * a1) / 4;
                point(R * cos(a)+rounding_radius, R * sin(a)+rounding_radius);
            }
       }
    }
}

module wheelcut(wheel_radius, rim_width, rounding_radius, axle_width, extrusion, a0, a1) {
for (i= [0:2]) {
    rotate(i*120)
        linear_extrude(height=extrusion, scale=.9) {
            minkowski() {
                wheelcut_flat(wheel_radius, rim_width, rounding_radius, axle_width, a0, a1);
                circle(rounding_radius);
            }
        }
    }
}

/*
module fillet(r) {
   offset(r = -r) {
     offset(delta = r) {
       children();
     }
   }
}
*/
module edge_chamfer() {
    translate([0,0,-.01]) {
        translate([-wheel_radius-((gap+wall_thickness)/2)-1,0,0])
            rotate([0,90,0]) 
                cylinder(r=separator_thickness/2, h=gap+wall_thickness+2, $fn=4, center=true);
        translate([wheel_radius+((gap+wall_thickness)/2)+1,0,0])
            rotate([0,90,0]) 
                cylinder(r=separator_thickness/2, h=gap+wall_thickness+2, $fn=4, center=true);

        difference() {
            cylinder(r=wheel_radius+.01, h=separator_thickness/2);
            cylinder(r1=wheel_radius-separator_thickness/2,r2=wheel_radius, h=separator_thickness/2);
            translate([0,0,-1])
                cylinder(r=wheel_radius-separator_thickness/2, h=separator_thickness/2+2);
            translate([-wheel_radius-1,0,0])
                cube(wheel_radius*2+2);
        }
    }
}
