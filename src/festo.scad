/****************************************************************************
this describes the opening for the PTFE quick release
*****************************************************************************/
include <filament_bank_values.scad>
use <../lib/iso-threads.scad>


module festo_opening(simplify=false) {
    rotate([-90,0,0]) 
        translate([0,0,-(festo_length+festo_sink_depth)/2]) {
            if (simplify) {
                cylinder(r=festo_radius, h=festo_length+detail_tolerance/2);
            }
            else {
                metric_thread(diameter=festo_radius*2, pitch=1, length=festo_length+detail_tolerance/2, internal=true);
            }
            translate([0,0,-(wheel_radius+gap+wall_thickness*2)/2+detail_tolerance/2]) 
                cylinder(r1=1.5, r2=1, h = wheel_radius+gap+wall_thickness*2, center=true);
            translate([0,0,festo_length]) 
                cylinder(r=festo_sink_radius, h=festo_sink_depth+detail_tolerance/2);
        }
}