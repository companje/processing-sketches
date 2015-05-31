class Shape {

  int rows,cols;
  Boolean[][] shape;

  Shape(String s) {
    String lines[] = split(s,',');
    rows = lines.length;
    cols = lines[0].length();
    shape = new Boolean[rows][cols];
    
    for (int row=0; row<rows; row++) {
      for (int col=0; col<cols; col++) {
        shape[row][col] = lines[row].charAt(col)=='1';
      }
    }
  }

  String toString() {
    String s = "";
    for (int row=0; row<rows; row++) {
      for (int col=0; col<cols; col++) {
        s += shape[row][col] ? 1 : 0;
      }
      s+='\n';
    }
    return s;
  }

};