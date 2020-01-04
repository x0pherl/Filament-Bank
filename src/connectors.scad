/****************************************************************************
filament wheel axle as well as connectors to hold the wheel mounts together
*****************************************************************************/
include <filament_bank_values.scad>
use <../lib/iso-threads.scad>

avoid_threads=false;

translate([17,0,0]) connector(simplify=avoid_threads, internal=false);
translate([-17,0,0]) connector(simplify=avoid_threads, internal=false);

module connector(simplify=false, internal=false) {
    radius_tolerance = internal ? 0.5 : 0;
    thread_length_tolerance = internal ? 0 : 0.5;
    
    difference() {
        union() {
            cylinder(r1=bearing_d/4+gap*2+radius_tolerance, r2=bearing_d/4+gap+radius_tolerance, h=separator_thickness);
            cylinder(r=bearing_d/4+gap+radius_tolerance, h=separator_thickness*2);  
            if (simplify) {
                cylinder(r=bearing_d/4+radius_tolerance, h=section_width-thread_length_tolerance-radius_tolerance);
                }
            else {
                metric_thread(diameter=bearing_d/2+radius_tolerance*2, pitch=1.5, length=section_width-separator_thickness-thread_length_tolerance, internal=internal);
            }
        }
    if (internal==false) 
        cube([2,bearing_d*2, separator_thickness*2], center=true);
    }
}