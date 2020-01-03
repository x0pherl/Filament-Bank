/****************************************************************************
this attaches the bank to the wheel bracket assemblies and also
is the mount point for hanging the bank
*****************************************************************************/
include <filament_bank_values.scad>
use <../lib/iso-threads.scad>
include <festo.scad>

difference() {
    solid();

    //account for odd/even count of sections
    adjustor = (section_count % 2 == 0) ? (-(section_count-1)/2*section_width) : (-(section_count-1)/2*section_width);
    translate([adjustor,0,0]) {
        for (ii=[0:section_count]) {
            if (ii<section_count) {
                //cut a hole for the thumb peg that holds each wheel bracket in place
                translate([ii*section_width-gap/4,-(top_inner_length/2)+separator_wall_width,wall_thickness*3-separator_wall_width/2])
                        rotate([90,0,0])
                            cylinder(r=separator_wall_width/2,h=separator_wall_width*2+2);
                //paths for filament
                translate([ii*section_width,wheel_radius+gap/2,wall_thickness*5]) 
                    rotate([90,0,0]) festo_opening(simplify=true);
                translate([ii*section_width,-(wheel_radius+gap/2),wall_thickness*5])
                    rotate([90,0,0]) festo_opening(simplify=true);            
            }
            translate([ii*section_width-section_width/2,0,wall_thickness-.01])
                cube([separator_thickness+gap,top_inner_length+gap,wall_thickness*2], center=true);
            }

        }
        //holes for the pegs that holds in the
        //seperator panels
        translate([0,(wheel_radius+gap+separator_wall_width*.65),wall_thickness/2+separator_wall_width/2]) 
            rotate([0,90,0]) {
                cylinder(r=separator_wall_width/2,h=((section_width+gap)*section_count+wall_thickness*2)*2, center=true);
                translate([0,0,(section_width)*section_count/2+.01]) {
                    metric_thread(diameter=separator_wall_width+1, pitch=1.5, length=wall_thickness+1, internal=true);
                    translate([0,0,wall_thickness-1]) cylinder(r=(separator_wall_width+1)*.75, h=1.01);
                    }
            }
        translate([0,-(wheel_radius+gap+separator_wall_width*.65),wall_thickness/2+separator_wall_width/2]) 
            rotate([0,90,0]) {
                cylinder(r=separator_wall_width/2,h=((section_width+gap)*section_count+wall_thickness*2)*2, center=true);
                translate([0,0,(section_width)*section_count/2+.01]) {
                    metric_thread(diameter=separator_wall_width+1, pitch=1.5, length=wall_thickness+1, internal=true);
                    translate([0,0,wall_thickness-1]) cylinder(r=(separator_wall_width+1)*.75, h=1.01);
                    }
        }
        
 }

module solid() {
difference() {
    //frame
    union() {
        translate([0,0,wall_thickness*1.5+separator_wall_width/4]) 
            cube([(section_width)*section_count+wall_thickness*2, top_inner_length+wall_thickness*2, wall_thickness*3+separator_wall_width/2], center=true);
        //hanging brackets    
        translate([((section_width)*section_count+wall_thickness*2)/2-3.5,top_inner_length/2+wall_thickness/2+gap/2,7])
            hanging_tab(depth=wall_thickness-gap, radius=7);
        translate([-((section_width)*section_count+wall_thickness*2)/2+3.5,top_inner_length/2+wall_thickness/2+gap/2,7])
            rotate([0,-60,0]) hanging_tab(depth=wall_thickness-gap, radius=7);
    }
    
    //top cut for the wheel bracket
    translate([0,0,wall_thickness*2+separator_wall_width+1]) 
        cube([((section_width)*section_count)+gap*2, top_inner_length+gap, wall_thickness*2+separator_wall_width/2+2], center=true);
    //smaller cut for the wheel
    cube([(section_width)*section_count+gap*2, ((wheel_radius)*2)+gap, wheel_radius], center=true);
    //slots for the side panels
    translate([0,top_inner_length/2+gap,(separator_wall_joint_length)/2-.01]) 
        cube([top_inner_width,separator_thickness+detail_tolerance*4,separator_wall_joint_length*2], center=true);
    translate([0,-top_inner_length/2-gap,(separator_wall_joint_length)/2-.01]) 
        cube([top_inner_width,separator_thickness+detail_tolerance*4,separator_wall_joint_length*2], center=true);
}    
adjustor = (section_count % 2 == 0) ? (-(section_count-1)/2*section_width) : (-(section_count-1)/2*section_width);
translate([adjustor,0,0]) {
    for (ii=[0:section_count-1]) {
        translate([ii*section_width,top_inner_length/2+gap/2,0]) 
            sideclip();
        translate([ii*section_width,-(top_inner_length/2+gap/2),0])
                rotate([0,0,180])
                    sideclip(addpeg=false);
        }
    }

}

module sideclip(addpeg=true) {
        translate([-separator_wall_width/2,-separator_wall_width/2,(wall_thickness*2+separator_wall_width+1)/2]) 
            cube([section_width-separator_wall_width*2-gap,separator_wall_width/2, (wall_thickness*3+separator_wall_width/2) - ((wall_thickness*2+separator_wall_width+1)/2)]);
        if (addpeg) {
            translate([-separator_wall_width/2,-separator_wall_width/2,wall_thickness*3-separator_wall_width/2])
                rotate([0,90,0]) {
                cylinder(r=separator_wall_width/2, h=section_width-separator_wall_width*2-gap);
                }
            }
}

module hanging_tab(depth=5, radius=7) {
    rotate([90,0,0]) {
        difference() {
            hull() {
                cylinder(r=radius, h=depth, $fn=6, center=true);
                translate([radius+radius/6, radius*2, 0]) cylinder(r=radius, h=depth, $fn=6, center=true);
                }
            //m3 hole
            translate([radius+radius/6, radius*2, depth/2-3.5]) cylinder(r=2.75+detail_tolerance/2, h=3.51);
            translate([radius+radius/6, radius*2, 0]) cylinder(r=1.5+detail_tolerance/2, h=depth*2, center=true);
            }
        }
}