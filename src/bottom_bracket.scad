/****************************************************************************
holds the bottom of the whole assembly togeter -- also tall enough to allow
room for the filament ejection.
*****************************************************************************/
include <filament_bank_values.scad>
use <separator_wall.scad>
use <../lib/iso-threads.scad>

cut_width=separator_thickness+detail_tolerance*2;

module wall_slice() {
    rotate([0,-90,0])
    difference() {
        cube([separator_wall_joint_length*4,(wheel_radius+gap+wall_thickness)*2, cut_width], center=true);
        translate([-separator_wall_joint_length*1.5,0,-cut_width/2]) connector_cut(cut_height=cut_width, holes=false);
    }
}

adjustor = (section_count % 2 == 0) ? (-(section_count-1)/2*section_width) : (-(section_count-1)/2*section_width);
difference() {
translate([adjustor,0,0]) {
    //create the wall sleeves
    for (ii=[0:section_count]) {
        translate([ii*section_width-section_width/2,0,0]) {
            difference() {
            translate([0,0,separator_wall_bottom_height/2+separator_wall_joint_length*.75]) {
                cube([separator_thickness*3, (wheel_radius+gap+wall_thickness)*2-.01, separator_wall_bottom_height+separator_wall_joint_length*1.5],center=true);
                }
            translate([0,0,separator_wall_bottom_height]) 
                wall_slice();
            }   

            }
    }
}
//cut holes for the pegs
translate([0,(wheel_radius+gap+wall_thickness-wall_thickness),separator_wall_bottom_height+separator_wall_joint_length/2-.25]) 
    rotate([0,90,0]) {
        cylinder(r=separator_wall_width/2,h=(section_width+gap)*(section_count+wall_thickness/2)*2, center=true);
        translate([0,0,(section_width)*section_count/2-wall_thickness/2+.01]) 
            metric_thread(diameter=separator_wall_width+1, pitch=1.5, length=wall_thickness+1, internal=true);
        }
translate([0,-(wheel_radius+gap+wall_thickness-wall_thickness),separator_wall_bottom_height+separator_wall_joint_length/2-.25]) 
    rotate([0,90,0]) {
        cylinder(r=separator_wall_width/2,h=(section_width+gap)*(section_count+wall_thickness/2)*2, center=true);
        translate([0,0,(section_width)*section_count/2-wall_thickness/2+.01]) 
            metric_thread(diameter=separator_wall_width+1, pitch=1.5, length=wall_thickness+1, internal=true);
        }
//notch the deeper corner to make assembly easier
translate([0,(wheel_radius+gap+wall_thickness),separator_wall_bottom_height+separator_wall_joint_length+separator_wall_width*.75]) 
    rotate([0,90,0])
        cylinder(r=separator_wall_width/2,h=(section_width+gap)*(section_count+wall_thickness/2)*2, center=true,$fn=4);
}


//the bottom bracket that holds the bits in place
difference() {
    translate([0,0,wall_thickness*1.5]) 
        cube([((section_width+gap)*section_count-1)+wall_thickness/2, (wheel_radius+gap+wall_thickness)*2+wall_thickness/2, wall_thickness*3], center=true);
    translate([0,0,wall_thickness*3]) 
        scale([1,1,.7]) 
            rotate([0,90,0]) 
                cylinder(r=wheel_radius+gap+wall_thickness, h=(section_width+gap)*section_count-1-gap, center=true);
}

//separator_wall brackets
translate([0,((wheel_radius+gap+wall_thickness)*2+wall_thickness/4)/2-detail_tolerance/2,(separator_wall_bottom_height-separator_wall_joint_length)/2]) {
    cube([((section_width+gap)*section_count-1)+wall_thickness/2,separator_thickness+detail_tolerance,separator_wall_bottom_height-separator_wall_joint_length], center=true);
translate([0,separator_thickness+detail_tolerance,separator_wall_joint_length*1.25]) 
    cube([((section_width+gap)*section_count-1)+wall_thickness/2,separator_thickness+detail_tolerance,separator_wall_bottom_height+separator_wall_joint_length*1.5], center=true);
}

//I don't understand why the .15 is required here instead of .1, but without it this is sliced as a separate peice
//the same is not true for the thing above?
translate([0,-(((wheel_radius+gap+wall_thickness)*2+wall_thickness/4)/2-.15),(separator_wall_bottom_height-separator_wall_joint_length)/2]) {
    cube([((section_width+gap)*section_count-1)+wall_thickness/2,separator_thickness+detail_tolerance,separator_wall_bottom_height-separator_wall_joint_length], center=true);
translate([0,-separator_thickness-detail_tolerance,separator_wall_joint_length*1.25]) 
    cube([((section_width+gap)*section_count-1)+wall_thickness/2,separator_thickness+detail_tolerance,separator_wall_bottom_height+separator_wall_joint_length*1.5], center=true);
}
    
