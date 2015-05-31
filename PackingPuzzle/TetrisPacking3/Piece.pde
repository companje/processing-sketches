class Piece {
  
  int orientation = 0; //0...shapes.length
  int row=0, col=0;
  Shape shapes[];
  
  Piece(String data) {
    String s[] = split(data,'/');
    shapes = new Shape[s.length];
    for (int i=0; i<s.length; i++) {
      shapes[i] = new Shape(s[i]);
    }
  }

  Shape getShape() {
    return shapes[orientation];
  }

  void locate(int r, int c) {
    row = r;
    col = c;
  }
  
  void rotate() {
    orientation++;
    if (orientation>shapes.length-1) orientation=0;
  }

};
