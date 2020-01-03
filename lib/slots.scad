
module slot(length, back_width, back_depth, channel_width, channel_depth) {
    translate([0,channel_depth,back_width/2])  cube([back_width,back_depth, length - back_width/2]);
    translate([back_width/2,channel_depth,back_width/2]) rotate([-90,0,0]) cylinder(r=back_width/2,h=back_depth,$fn=256);
    translate([back_width/2 - channel_width/2,0,back_width/2])  cube([channel_width,channel_depth, length - back_width/2]);
    translate([back_width/2,0,back_width/2])rotate([-90,0,0]) cylinder(r=channel_width/2,h=channel_depth,$fn=256);
}

module slotted_block() {
    difference() {
        cube([30,7,20]);
        translate([7.5,0,2.5]) slot(17.5, 6, 1, 2.5, 2);
        translate([17.5,0,2.5]) slot(17.5, 6, 1, 2.5, 2);
    }
}
module pinned_block() {
    translate([12.5,0,16.5]) rotate([0,180,0]) slot(16.5, 4.4, .8, 1.6, 2.35);
    translate([22.5,0,16.5]) rotate([0,180,0]) slot(16.5, 4.4, .8, 1.6, 2.35);
    translate([0,-5,0]) cube([30,5,20]);
}
/*
module slotted_block() {
    difference() {
        cube([15,7,10]);
        translate([5,0,2.5]) slot(7.5, 6, 1, 2.5, 2);
    }
}
module pinned_block() {
    translate([0,-7,0]) cube([15,7,10]);
    translate([7.5+4.4/2,0,7.1]) rotate([0,180,0]) slot(6.5, 4.4, .8, 1.6, 2.35);
}
*/

//slotted_block();
//pinned_block();
