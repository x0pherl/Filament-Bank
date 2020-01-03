/****************************************************************************
removable pegs that hold the wheel/bracket assembly into the bank
*****************************************************************************/
include <filament_bank_values.scad>

difference() {
    translate([0,0,separator_wall_width/2*.95-.5]) {
        rotate([90,0,0]) 
            cylinder(r=separator_wall_width/2*.95,h=separator_wall_width*2+2, center=true);
        translate([0,-separator_wall_width-1,0]) 
            sphere(r=separator_wall_width/2*.95);
    }
    translate([0,0,-separator_wall_width*1.5]) 
        cube(separator_wall_width*3, center=true);
}
translate([0,separator_wall_width*2.5-1,0])
    cylinder(r=separator_wall_width*1.5,h=1.85);