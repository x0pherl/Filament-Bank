/****************************************************************************
this is the wall that separates the bank chambers
*****************************************************************************/
include <filament_bank_values.scad>
include <../lib/skew.scad>

separator_wall_length = separator_wall_top_height;

difference() {
    top_side();
    translate([-separator_wall_length/2-separator_wall_joint_length/2+separator_thickness/2,0,0]) 
        connector_cut();
}

module top_side() {
difference() {
    translate([-separator_wall_joint_length/2,0,separator_thickness/2]) {
        cube([separator_wall_length+separator_wall_joint_length,top_inner_length, separator_thickness], center=true);
        //bevel along the top edge 
        translate([separator_wall_length/2+separator_wall_joint_length/2,0,0]) 
            rotate([90,0,0]) 
                cylinder(r=separator_thickness/2, h=top_inner_length, center=true, $fn=4);
        }
    
    //make the wheel cut
    translate([separator_wall_top_height/2,0,0]) {
        cylinder(r=wheel_radius, h=separator_thickness*2, center=true);
        translate([0,0,separator_thickness*.75+.01]) 
            cylinder(r1=wheel_radius, r2=wheel_radius+separator_thickness, h=separator_thickness/2, center=true);
        translate([0,0,separator_thickness*.25-.01]) 
            rotate([180,0,0]) 
                cylinder(r1=wheel_radius, r2=wheel_radius+separator_thickness, h=separator_thickness/2, center=true);
    }
                    
    //punch holes in the corners for the connector peg
    translate([separator_wall_top_height/2-wall_thickness+separator_wall_width*.4,(wheel_radius+gap+separator_wall_width*.65),0])
        cylinder(r=separator_wall_width/2,h=separator_thickness*2+2, center=true);
    translate([separator_wall_top_height/2-wall_thickness+separator_wall_width*.4,-(wheel_radius+gap+separator_wall_width*.65),0])
        cylinder(r=separator_wall_width/2,h=separator_thickness*2+2, center=true);
    }
}

module connector_cut(cut_height=separator_thickness, holes=true) {
    difference() {
        translate([-separator_wall_joint_length,-top_inner_length,-cut_height/2])
            cube([separator_wall_joint_length*4,top_inner_length*2,cut_height*2]);
        skew([0,-45,0,0,0,0]) 
            cube([separator_wall_joint_length*4,top_inner_length/2,cut_height]);
            translate([separator_wall_joint_length,-top_inner_length/2,0]) 
                cube([separator_wall_joint_length*4,top_inner_length/2+.01,cut_height]);
    }
    
    // punch holes in the corners for the connector peg
    if (holes) {
    translate([separator_wall_joint_length*1.5+separator_wall_width/2,(wheel_radius+gap),0])
        cylinder(r=separator_wall_width/2,h=cut_height*4, center=true);
    translate([separator_wall_joint_length*1.5+separator_wall_width/2,-(wheel_radius+gap),0])
        cylinder(r=separator_wall_width/2,h=cut_height*4, center=true);
    }
    
    skew([0,45,0,0,0,0]) 
        translate([0,-top_inner_length/2-cut_height,-cut_height/2]) {
            cube([separator_wall_joint_length,top_inner_length/2+cut_height,cut_height*2]);
            translate([separator_wall_joint_length/2-cut_height,top_inner_length/2+cut_height,cut_height])
                rotate([0,90,0])
                    cylinder(r=cut_height/2+.01,h=separator_wall_joint_length+cut_height*2,center=true,$fn=4);
            }
}