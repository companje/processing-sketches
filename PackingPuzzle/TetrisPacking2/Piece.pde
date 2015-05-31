class Piece {
//  int rows=8, cols=8;
//  Boolean matrix[][];

  String orientations[];

  Piece(String s) {
    orientations = split(s,'/');
    
    
    
//    matrix = new Boolean[rows][cols];
//    String lines[] = split(s, ' ');
//
//    for (int row=0; row<rows; row++) {
//      for (int col=0; col<cols; col++) {
//        matrix[row][col] = (row<lines.length && col<lines[row].length() && lines[row].charAt(col)=='1');
//      }
//    }
  }

//  void transpose() {
//    for (int i = 0; i < rows; i++) {
//      for (int j = i; j < cols; j++) {
//        Boolean x = matrix[i][j];
//        matrix[i][j] = matrix[j][i];
//        matrix[j][i] = x;
//      }
//    }
//  }
//  
//  void rotate90() {
//    for (int i=0, k=rows-1; i<k; ++i, --k) {
//      Boolean[] x = matrix[i];
//      matrix[i] = matrix[k];
//      matrix[k] = x;
//    }
//    transpose();
//  }
//  
//  void rotate180() {
//    rotate90();
//    rotate90(); 
//  }
//  
//  void shiftUp() {
//    Boolean[] tmp = matrix[0];
//    for (int i=0; i<rows-1; i++) {
//      matrix[i] = matrix[(i+1)%rows]; 
//    }
//    matrix[rows-1] = tmp;
//  }
//  
//  void shiftDown() {
//    rotate180(); 
//    shiftUp(); 
//    rotate180();
//  }
//  
//  void move(int x, int y) {
//    if (y<0) shiftUp();
//    else if (y>0) shiftDown();
//    else if (x<0) { transpose(); shiftUp(); transpose(); }
//    else if (x>0) { transpose(); shiftDown(); transpose(); }
//  }
//  
//  String toString() {
//    String result = "";
//    for (int row=0; row<rows; row++) {
//      for (int col=0; col<cols; col++) {
//        result += matrix[row][col] ? (" 1 ") : " - ";
//      }
//      result += '\n';
//    }
//    return result;
//  }
}

