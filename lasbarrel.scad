orig_barrel_len=82.5;
orig_barrel_dia=38.1;
thickness=2;
inset_width=20;
inset_len=57;
angle_degs=45;

outer_dia=orig_barrel_dia + 2*thickness;
inner_dia=orig_barrel_dia;
triangle_height=sin(angle_degs)*outer_dia;
bottom_len=orig_barrel_len - triangle_height/2;
top_len=orig_barrel_len + triangle_height/2;

$fn=90;

difference () {
    intersection() {
        difference() {
            cylinder(top_len, d=outer_dia);
            translate([0,0,-1]) {
                cylinder(top_len + 2, d=inner_dia);
            }
        }

        polyhedron(
            [
                [-outer_dia/2, -outer_dia/2, 0],
                [outer_dia/2, -outer_dia/2, 0],
                [outer_dia/2, outer_dia/2, 0],
                [-outer_dia/2, outer_dia/2, 0],
                [-outer_dia/2, -outer_dia/2, bottom_len],
                [outer_dia/2, -outer_dia/2, bottom_len],
                [outer_dia/2, outer_dia/2, top_len],
                [-outer_dia/2, outer_dia/2, top_len],
             ],
             [
                [0,1,2,3],
                [4,5,1,0],
                [7,6,5,4],
                [5,6,2,1],
                [6,7,3,2],
                [7,4,0,3],
             ]
        );
    }

    translate([-inset_width/2, -(outer_dia + 2)/2, -1]) {
        cube([inset_width,outer_dia + 2, inset_len + 1]);
    }
}
