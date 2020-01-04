/****************************************************************************
this is the bottom of the bracket that holds the wheel and
festo mounts
*****************************************************************************/
include <filament_bank_values.scad>
use <../lib/iso-threads.scad>
include <festo.scad>
include <wheelcut.scad>
use <axle.scad>
use <connectors.scad>

//for faster rendering, prevent rendering of threads
//must be set to false for printed part
avoid_threads=false;

module solid() {
    //wheel mount
    cylinder(r=wheel_radius, h=separator_wall_width);

    //bearing mount
    cylinder(r=bearing_shelf_d/2, h=separator_wall_width+gap);

    //top peice
    difference() {
        translate([-top_inner_length/2,0,0]) 
            cube([top_inner_length, top_inner_length/2, section_width-separator_wall_width]);
        translate([0,0,separator_wall_width]) 
            cylinder(r=wheel_radius+gap, h=section_width);
        }   
}

module cut() {
    translate([0,0,separator_thickness]) { 
        if (avoid_threads) {
            cylinder(r=bearing_inner_d/2, h=section_width);
        }
        else {
            metric_thread(diameter=bearing_inner_d+1, pitch=1.5, length=section_width, internal=true);
        }
    }
    translate([-wheel_radius,top_inner_length/2-(festo_length+festo_sink_depth)/2,section_width/2]) 
        festo_opening(simplify=avoid_threads);
    translate([wheel_radius,top_inner_length/2-(festo_length+festo_sink_depth)/2,section_width/2]) 
        festo_opening(simplify=avoid_threads);
    translate([-(wheel_radius-gap-wall_thickness*2),wheel_radius-gap,-(separator_thickness*2-2-section_width/2)]) 
        rotate([180,0,0]) 
            translate([0,0,separator_thickness*2-2-section_width/2])
                //scale([1.1,1.1,1]) 
                connector(simplify=avoid_threads, internal=true);
    translate([wheel_radius-gap-wall_thickness*2,wheel_radius-gap,-(separator_thickness*2-2-section_width/2)]) 
        rotate([180,0,0]) 
            translate([0,0,separator_thickness*2-2-section_width/2])
                //scale([1.1,1.1,1]) 
                connector(simplify=avoid_threads, internal=true);
    translate([0,0,-detail_tolerance/2]) 
        wheelcut(wheel_radius, 5, 5, 10, separator_wall_width+detail_tolerance, 90, 0);
    translate([top_inner_length/2-separator_wall_width/2,-1,separator_wall_width]) {
        cube([separator_wall_width,wall_thickness*2,section_width-separator_wall_width*2+1]);
    translate([0,wall_thickness*2-separator_wall_width,0])
        cylinder(r=separator_wall_width/2, h=section_width-separator_wall_width*2+1);
    }
    translate([-wheel_radius-gap-wall_thickness-separator_wall_width/2,-1,separator_wall_width]) {
        cube([separator_wall_width,wall_thickness*2,section_width-separator_wall_width*2+1]);
    translate([separator_wall_width,wall_thickness*2-separator_wall_width,0])
        cylinder(r=separator_wall_width/2, h=section_width-separator_wall_width*2+1);
    }
    edge_chamfer();
}

difference() {
    solid();
    cut();
}

//preview of the wheel placement
if (avoid_threads) {
    %translate([0,0,section_width/2]) 
        cylinder(r=wheel_radius, h=spoolwheel_thickness, center=true);
}
