/****************************************************************************
this is the top of the bracket that holds the wheel and
festo mounts
*****************************************************************************/
include <filament_bank_values.scad>
use <axle_connectors.scad>
include <festo.scad>
include <wheelcut.scad>
use <../lib/iso-threads.scad>

translate([0,0,separator_wall_width]) {
    rotate([0,180,0]) 
        filament_wheel_mount_top();
}

module filament_wheel_mount_top() {
    difference() {
        union() {
            translate([-top_inner_length/2,0,0]) 
                cube([top_inner_length, top_inner_length/2, separator_wall_width]);
            cylinder(r=wheel_radius, h=separator_wall_width);
        }
        translate([0,0,-detail_tolerance/2]) 
            wheelcut(wheel_radius, 5, 5, 10, separator_wall_width+detail_tolerance, 90, 0);
        translate([-wheel_radius,top_inner_length/2-(festo_length+festo_sink_depth)/2,section_width/2]) 
            scale(1.2) festo_opening(simplify=true);
        translate([wheel_radius,top_inner_length/2-(festo_length+festo_sink_depth)/2,section_width/2]) 
            scale(1.2) festo_opening(simplify=true);
        //sink the axle down a little to provide some buffer
        cylinder(r=bearing_d/2+gap+.5, h=1.02, center=true);
        translate([0,0,0.5]) 
            axle_solid(simplify=true, internal=true);
        translate([-(wheel_radius-gap-wall_thickness*2),wheel_radius-gap,0]) {
            cylinder(r=bearing_d/4+gap*2+.5, h=1.2, center=true);
            translate([0,0,0.5]) 
                connector(simplify=true, internal=true);
        }
        translate([wheel_radius-gap-wall_thickness*2,wheel_radius-gap,0]) {
            cylinder(r=bearing_d/4+gap*2+.5, h=1.2, center=true);
            translate([0,0,0.5])
                connector(simplify=true, internal=true);
            }
    edge_chamfer();
    }
}