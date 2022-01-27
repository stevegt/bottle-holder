$fn = 30;
inch = 25.4;

wall_thickness = 5;

// 40 oz hydroflask
// bottle_dia = 93;  

// 24 oz hydroflask
bottle_dia = 80;  

// 2014 C-Max
// well_dia_top = 84;  
// well_dia_bottom = 66;
// well_depth = 88;

// 2007 sienna center tray
// well_dia_top = 94;  
// well_dia_bottom = 90;
// well_depth = 65;

// generic 330 mL standard soda can well
well_dia_top = 67;  
well_dia_bottom = 66;
well_depth = 50;

cup_od = bottle_dia + wall_thickness * 2;
cup_id = bottle_dia + .125 * inch;
cup_depth = bottle_dia/2;  

joint_height = (cup_od - well_dia_top)/2;

module stud() {
    difference() {
        cylinder(r1=well_dia_bottom/2, r2=well_dia_top/2, h=well_depth, center=true);
        cylinder(r1=well_dia_bottom/2-wall_thickness, r2=well_dia_top/2-wall_thickness, h=well_depth+.1, center=true);
    }
}

module cup() {
    difference() {
        cylinder(r=cup_od/2, h=cup_depth, center=true);
        cylinder(r=cup_od/2-wall_thickness, h=cup_depth+.3, center=true);
    }
}

module joint() {
    difference() {
        cylinder(r1=well_dia_top/2, r2=cup_od/2, h=joint_height, center=true);
        cylinder(r=well_dia_top/2-wall_thickness, h=joint_height+.1, center=true);
    }
}

module shell() {
    translate([0,0,well_depth/2]) stud();
    translate([0,0,well_depth + joint_height/2 - .1]) joint();
    translate([0,0,well_depth + joint_height + cup_depth/2 - .2]) cup();
}

shell();
