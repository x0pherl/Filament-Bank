/****************************************************************************
pegs that hold the sidewalls in place in the top and bottom brackets
*****************************************************************************/
include <filament_bank_values.scad>
use <../lib/iso-threads.scad>

//adjust to change how much smaller the pegs are vs. the holes
peg_shrink_factor = .875;

top_peg_length = (section_width)*section_count+wall_thickness*2;
bottom_peg_length = ((section_width)*section_count-1)+wall_thickness/2;

translate([-5,0,0]) 
    side_peg(radius=separator_wall_width/2*peg_shrink_factor, peg_length=top_peg_length, threaded_length=wall_thickness);
translate([5,0,0]) 
    rotate([0,0,180]) 
        side_peg(radius=separator_wall_width/2*peg_shrink_factor, peg_length=top_peg_length, threaded_length=wall_thickness);
translate([-15,0,0]) 
    rotate([0,0,180]) 
        side_peg(radius=separator_wall_width/2*peg_shrink_factor, peg_length=bottom_peg_length, threaded_length=wall_thickness/2);
translate([15,0,0]) 
    side_peg(radius=separator_wall_width/2*peg_shrink_factor, peg_length=bottom_peg_length, threaded_length=wall_thickness/2);

module side_peg(radius=2,peg_length=10, threaded_length=2) {

    difference() {
        translate([0,-threaded_length/2,radius-.5]) {
            rotate([90,0,0]) {
                cylinder(r=radius, h=peg_length-threaded_length, center=true);
            }
            translate([0,-(peg_length-threaded_length)/2,0]) 
                sphere(r=radius);
            translate([0,peg_length/2+threaded_length/2,0])
                rotate([90,0,0]) 
                    cylinder(r=radius*1.5, h=1, center=true);
    
        translate([0,peg_length/2,0])
            rotate([90,0,0]) 
                translate([0,0,-threaded_length/2]) 
                    metric_thread(diameter=radius*2+1, pitch=1.5, length=threaded_length, internal=false);   
        }
        translate([0,0,-peg_length]) 
            cube(peg_length*2, center=true);
    }
}
