/****************************************************************************
contains slots to hold the separator walls and fits into the top and bottom bracket
*****************************************************************************/
include <filament_bank_values.scad>

translate([-(sidewall_length+(separator_wall_joint_length*4)-detail_tolerance)/2,-((section_width+gap)*section_count-1-gap)/2,0]) 
    cube([sidewall_length+(separator_wall_joint_length*4)-detail_tolerance,(section_width+gap)*section_count-1-gap,separator_thickness]);


adjustor = (section_count % 2 == 0) ? (-(section_count-1)/2*section_width) : (-(section_count-1)/2*section_width);
difference() {
translate([0,adjustor,0]) {
    //create the wall sleeves
    for (ii=[0:section_count]) {
        translate([0,ii*section_width-section_width/2,0]) {
            difference() {
            translate([0,0,separator_thickness*3]) {
                cube([sidewall_length, separator_thickness*3,separator_thickness*6],center=true);
                }
            translate([0,0,separator_thickness*4]) 
                cube([sidewall_length+1, separator_thickness+detail_tolerance,separator_thickness*6],center=true);
            }   

            }
    }
}
}