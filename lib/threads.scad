
$fn=128;
$fa=1;

r=20;

thread_l = 16;
n_threads = 4;

cylinder_radius = 21.5;
min_cushion=2;
cylinder_height=10;


function cat(nested) = [ for(a=nested) for (b=a) b ];

module threads(radius, height, n_threads=1, thread_size=1, inverse=false) {
    difference() {
    modx = inverse ? -1 : 1;
    for (start = [0:360/n_threads:359])  {
        //define the shape of the threads as a 2d graph (backwards for a lid
//        poly = inverse ? [[0, 1], [0,0], [thread_size, -thread_size], [2*thread_size, -thread_size], [3*thread_size, 0], [3*thread_size, 1]] : [[0, -1], [0,0], [thread_size, thread_size], [2*thread_size, thread_size], [3*thread_size, 0], [3*thread_size, -1]];
        poly = inverse ? [[0, 1], [0,0], [thread_size, -thread_size], [2*thread_size, -thread_size], [3*thread_size, 0], [3*thread_size, 1]] : [[0, -1], [1.5*thread_size, 1.5*thread_size], [3*thread_size, -1]];
        maxr = max([for (i = poly) i[1]]);
        maxh = max([for (i = poly) i[0]]);
        pitch = n_threads * thread_size * 4;
        degrees = 360 * (height - maxh) / pitch;
        vertices = len(poly);
        points = [ for (a = [0:$fa:degrees])
            let (z0 = a * pitch / 360,
                 q = (a > (degrees/2)) ? degrees - a : a,
                 offs = (q < 20) ? ((20 - q) / 20) * maxr : 0)
                 //offs = 0)
            for (i = [0:vertices-1])
                let (pz = poly[i][0],
                     pr = radius - (offs * modx) + poly[i][1]
                    ) [pr * cos(a + start), pr * sin(a + start), pz + z0]
        ];
        steps = floor(degrees / $fa);
        cap1 = [ for (i = [1:vertices-2]) let (base = len(points) - vertices) [ base, base+i, base+i+1 ] ]; // list of triangle faces
        cap2 = [ for (i = [1:vertices-2]) [ 0, i+1, i ] ]; // list of triangle faces
        tri1 = [ for (s = [0:steps-1]) let (base = s * vertices) for (i = [0:vertices-1])
                    [ base + i, base + (i + 1) % vertices, base + vertices + (i + 1) % vertices ]
               ]; // list of triangle faces
        tri2 = [ for (s = [0:steps-1]) let (base = s * vertices) for (i = [0:vertices-1])
                    [ base + i, base + vertices + (i + 1) % vertices, base + vertices + i ]
               ];
        faces = cat([cap1, cap2, tri1, tri2]);

        polyhedron(points=points, faces=faces, convexity=2);
    }
        if (inverse) {
            difference() {
            cylinder(r=radius + thread_size*30, h=height);
            cylinder(r=radius + thread_size, h=height);
            }
        }
        else {
            cylinder(r=radius, h=height);
        }
    }
}

    //cylinder(r=cylinder_radius + min_cushion*2, h=min_cushion);
    //cylinder(r=cylinder_radius+.01, h=cylinder_height);
    
    threads(cylinder_radius, cylinder_height, thread_size=.8, inverse=false );
/*    rotate([0,0,60])
    color("blue") threads(cylinder_radius + 0.2, cylinder_height,n_threads=3,inverse=true );
*/
