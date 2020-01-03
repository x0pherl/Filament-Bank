$fn = 128;

// designed for 604zz bearings
bearing_d = 12;
bearing_width = 4;
bearing_inner_d = 4;
bearing_shelf_d = 6.5;//6;

spoolwheel_thickness = bearing_width;
rim_width = 5;
spoke_width = 4;
spoke_count = 5;
wheel_radius = 50;
gap = 1;
detail_tolerance = 0.2; //extra gap for fitting peices
separator_thickness = 1;

wall_thickness = 6;
section_width = 15; 
section_count = 5;

separator_wall_width = ((section_width-spoolwheel_thickness)/2) - gap;
separator_wall_top_height=240;
separator_wall_bottom_height=60;
separator_wall_joint_length=5;

sidewall_length = 215;

festo_length = 4.5; //4
festo_radius = 3.25;
festo_sink_radius = festo_radius + 1.75; //1.5
festo_sink_depth = 1.2; //1

hanger_length = 15;
hanger_depth = 10;

//some utility values
top_inner_width = ((section_width+gap)*section_count);
top_inner_length = (wheel_radius+gap+wall_thickness)*2;