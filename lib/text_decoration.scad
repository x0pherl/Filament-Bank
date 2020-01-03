module external_round_beveled_extruded_text(render_text, text_size=25, font="Liberation Mono", extrusion_depth=10, bevel_depth=1, bevel_width=1) {
    multiplier=.1;
    bevel_radius = (bevel_width/2)/multiplier;
    for (ii = [0: bevel_radius-1]) {
        level_radius = bevel_width-(ii*multiplier);
        vertical_shift=bevel_width/4- (bevel_radius*multiplier) - (sqrt(bevel_radius*bevel_radius-(bevel_radius-ii)*(bevel_radius-ii))*multiplier);
        level_extrusion = extrusion_depth + bevel_width/4 - vertical_shift;
        extrude_textedge(render_text, text_size=text_size, extrusion_depth=level_extrusion, radius=level_radius, font=font);
        }
}

module internal_round_beveled_extruded_text(render_text, text_size=25, font="Liberation Mono", extrusion_depth=10, bevel_width=1) {
   linear_extrude(extrusion_depth)
       offset(r = -bevel_width/2)
           text(render_text,font=font, size=text_size, halign="center");
}

module extrude_textedge(render_text, text_size=25, extrusion_depth=10, radius=1, font="Liberation Mono") {
   difference() {
   linear_extrude(extrusion_depth)
       offset(r = radius/2)
           text(render_text,font=font, size=text_size, halign="center");
   translate([0,0,-1]) linear_extrude(extrusion_depth+2)
       offset(r = -radius/2)
           text(render_text,font=font, size=text_size, halign="center");
   }
}

module rotate_text(chars="example", char_thickness=2, char_size=5, radius=10, chars_per_circle=25, font="Nunito ExtraBold") {
    step_angle = 360 / chars_per_circle;
    
    difference() {
        union() {
            for(i = [0 : len(chars) - 1]) {
                rotate(i * step_angle) 
                    translate([0, radius -char_thickness, 0]) 
                        rotate([90, 0, 180]) linear_extrude(char_thickness*2) union() {
                            text(chars[i], font = font, size = char_size, halign = "center");
                        }
                    }
                }
        difference() {
            cylinder(r=radius*2, h=500,$fn=128, center=true);
            cylinder(r=radius, h=502,$fn=128, center=true);
        }
        }
}
