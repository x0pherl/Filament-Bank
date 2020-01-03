echo "rendering axle and connectors"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/axle_connectors.stl axle_connectors.scad
echo "rendering bottom bracket"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/bottom_bracket.stl bottom_bracket.scad
echo "rendering bottom filament wheel mount"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/filament_wheel_mount_bottom.stl filament_wheel_mount_bottom.scad
echo "rendering top filament wheel mount"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/filament_wheel_mount_top.stl filament_wheel_mount_top.scad
echo "rendering wheel"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/filament_wheel.stl filament_wheel.scad
echo "rendering separator wall"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/separator_wall.stl separator_wall.scad
echo "rendering side pegs"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/side_pegs.stl side_pegs.scad
echo "rendering side wall"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/sidewall.stl sidewall.scad
echo "rendering thumb peg"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/thumb_peg.stl thumb_peg.scad
echo "rendering top bracket"
"c:\Program Files\OpenSCAD\openscad.com" -o ../stl/top_bracket.stl top_bracket.scad

"c:\Program Files\Prusa3D\PrusaSlicer\prusa-slicer-console.exe" -m --export-3mf -o ../printable_3mf/wheel_assembly.3mf  ../stl/axle_connectors.stl  ../stl/filament_wheel_mount_top.stl  ../stl/filament_wheel_mount_bottom.stl
"c:\Program Files\Prusa3D\PrusaSlicer\prusa-slicer-console.exe" -m --export-3mf -o ../printable_3mf/brackets_pegs.3mf  ../stl/bottom_bracket.stl  ../stl/top_bracket.stl  ../stl/side_pegs.stl
"c:\Program Files\Prusa3D\PrusaSlicer\prusa-slicer-console.exe" -m --export-3mf -o ../printable_3mf/sidewalls.3mf ../stl/sidewall.stl  ../stl/sidewall.stl
"c:\Program Files\Prusa3D\PrusaSlicer\prusa-slicer-console.exe" --export-3mf -o ../printable_3mf/separator_wall.3mf ../stl/separator_wall.stl
"c:\Program Files\Prusa3D\PrusaSlicer\prusa-slicer-console.exe" -m --export-3mf -o ../printable_3mf/sidewalls.3mf ../stl/sidewall.stl  ../stl/sidewall.stl
"c:\Program Files\Prusa3D\PrusaSlicer\prusa-slicer-console.exe" -m --export-3mf -o ../printable_3mf/wheel_and_peg.3mf ../stl/filament_wheel.stl  ../stl/thumb_peg.stl
