include <ortholinear-plate.scad>
  translate([u, 0, 0]) ortholinearPlate(4, [1, 1], 1.2);
  translate([0, 2 * u, 0]) ortholinearPlate(5, [1, 1, 1, 1, 1.5], 1.2);

