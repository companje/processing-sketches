ArrayList<Piece> pieces = new ArrayList();
ArrayList<Piece> usedPieces = new ArrayList();
ArrayList<Piece> unusedPieces = new ArrayList();

// int nPieces = 12;
int rows = 8;
int cols = 8;
int w = 400;
int h = 400;
int cw = w / cols;
int ch = h / rows;

void setup() {
  size(w*2+20,h+100);
  colorMode(HSB);

  //load all pieces from textfile
  for (String line:loadStrings("blokjes.txt")) {
    pieces.add(new Piece(line));
  }

  for (Piece p:pieces) { //all pieces are unused at start
    unusedPieces.add(p);
  }

}

void draw() {
  background(0);
  translate(10,10);
  
  fill(255);
  drawGrid();

  int i=0;
  for (Piece p:usedPieces) {
    fill(i,255,255);
    drawPiece(p);
    i+=255/12;
  }

  // int i = int(float(mouseX)/width*pieces.size());
  // cur = int(float(mouseY)/height*pieces.get(i).shapes.length);;
  // fill(255,0,0);
  // drawPiece(pieces.get(i));
}

void keyPressed() {
  //if (key==' ') solveStep();
  if (key=='1') usePiece(pieces.get(0));
  if (key=='!') unusePiece(pieces.get(0));
}

void solveStep() {
  //use random piece
  if (unusedPieces.size()<1) return;
  int rnd = (int)random(unusedPieces.size());
  Piece p = unusedPieces.get(rnd);
  usePiece(p);
  p.col = 0;
  p.row = 0;
}

void usePiece(Piece p) {
  usedPieces.add(p);
  unusedPieces.remove(p);
}

void unusePiece(Piece p) {
  usedPieces.remove(p);
  unusedPieces.add(p); 
}

Boolean isValid(Piece p) {

  // if (p.col)
  return false;
}

Boolean hitTest(Piece a, Piece b) {
  return false;
}

void drawPiece(Piece p) {
  Shape s = p.getShape();

  for (int row=0; row<s.rows; row++) {
    for (int col=0; col<s.cols; col++) {
      if (!s.shape[row][col]) continue;
      rect(p.col*cw+col*cw,p.row*ch+row*ch,cw,ch);
    }
  } 
}

void drawGrid() {
  for (int x=0; x<w; x+=cw) {
    for (int y=0; y<h; y+=ch) {
      rect(x,y,cw,ch);
    }
  }
}
