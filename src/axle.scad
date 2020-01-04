/****************************************************************************
filament wheel axle as well as connectors to hold the wheel mounts together
*****************************************************************************/
include <filament_bank_values.scad>
use <../lib/iso-threads.scad>

avoid_threads=false;

sidewall_width = ((section_width-spoolwheel_thickness)/2) - gap;

axle(simplify=avoid_threads, internal=false);

module axle_solid(simplify=false, internal=false) {
    radius_tolerance = internal ? 0.5 : 0;
    thread_length_tolerance = internal ? 0 : 0.5;

    cylinder(r=bearing_inner_d/2+radius_tolerance, h=section_width-sidewall_width-gap);
    cylinder(r1=bearing_d/2+gap+radius_tolerance, r2=bearing_d/2+radius_tolerance, h=separator_thickness);
    cylinder(r=bearing_d/2+radius_tolerance, h=separator_thickness*2);
    cylinder(r=bearing_shelf_d/2+radius_tolerance, h=sidewall_width+gap/2);

    translate([0,0,section_width-sidewall_width-gap])
        if (simplify) {
            color("red") cylinder(r=bearing_inner_d/2+radius_tolerance, h=sidewall_width+gap-separator_thickness-thread_length_tolerance);
        }
        else {
            metric_thread(diameter=bearing_inner_d+radius_tolerance*2, pitch=1.5, length=sidewall_width+gap-separator_thickness-thread_length_tolerance, internal=internal);
        }
}

module axle_cut() {
    cube([2,bearing_d*2, separator_thickness*2], center=true);
}

module axle(simplify=false, internal=false) {
    difference() {
        axle_solid(simplify=simplify, internal=internal);
        if (internal==false) {
            axle_cut();
        }
    }
}
