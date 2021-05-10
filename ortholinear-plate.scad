switchHoleEdge = 14;
thickness = 5;
u = 19;

function holeSpacing (u1, u2) = ((u1 * u / 2) + (u2 * u/ 2)) - switchHoleEdge;

uHoleSpacing = holeSpacing(1, 1);

module switchColumn (rows, keySize, plateThickness) {
  difference () {
    cube([
      rows * (switchHoleEdge + holeSpacing(1, 1)) + holeSpacing(1, 1),
      keySize * u,
      plateThickness
    ]);
    translate([
      0,
      ((keySize * u) / 2) - (switchHoleEdge / 2),
      0,
    ]) switchColumnNegative(rows, plateThickness + 1);
  }
}

module switchColumnNegative (rows, plateThickness) {
  for (row = [1 : rows]) {
    translate([
      ((row - 1) * (holeSpacing(1, 1) + switchHoleEdge)) + holeSpacing(1, 1),
      0,
      0,
    ]) cube([switchHoleEdge, switchHoleEdge, plateThickness]);
  }
}

module ortholinearPlate(rows, columns, plateThickness) {
  switchColumn(rows, columns[0], plateThickness);
  if (len(columns) > 1) {
    translate([0, u * columns[0], 0]) {
      ortholinearPlate(rows, [ for (i = [1 : len(columns) - 1]) columns[i] ], plateThickness);
    }
  }
}
