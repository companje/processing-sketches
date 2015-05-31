ArrayList<Piece> pieces = new ArrayList();
Grid grid = new Grid(8,8);
Piece selected;

int w = 400;
int h = 400;
int cw = w / grid.w;
int ch = h / grid.h;

void setup() {
  size(w*2+20,h+100);
  colorMode(HSB);
  loadPieces("blokjes.txt");
  
  selected = pieces.get(0);
  
}

void draw() {
  background(0);
  translate(10,10);
  drawGrid();
  
  fill(0,255,255);
  drawPiece(selected);

  pushMatrix();
  translate(0,height-80);
  scale(.25,.25);
  for (int i=0; i<pieces.size(); i++) {
    fill(float(i)/pieces.size()*255,255,255);
    drawPiece(pieces.get(i));
    translate(5*cw,0);
  }
  popMatrix();
  
}

void drawGrid() {
  fill(255);
  strokeWeight(1);
  
  for (int x=0; x<w; x+=cw) {
    for (int y=0; y<h; y+=ch) {
      rect(x,y,cw,ch);
    }
  }
}

void keyPressed() {
  if (selected==null) return;
  if (key==ENTER) selected.rotate90();  
  if (keyCode==DOWN) selected.move(0,1);
  if (keyCode==UP) selected.move(0,-1);
  if (keyCode==RIGHT) selected.move(1,0);
  if (keyCode==LEFT) selected.move(-1,0);
}

void drawPiece(Piece p) {
  strokeWeight(p==selected ? 2 : 1);
  
  for (int row=0; row<p.rows; row++) {
    for (int col=0; col<p.cols; col++) {
      if (p.matrix[row][col]) rect(col*cw,row*ch,cw,ch);
    }
  }
}

void loadPieces(String filename) {
  String lines[] = loadStrings(filename);
  for (int i=0; i<lines.length; i++) {
    pieces.add(new Piece(lines[i]));
  }
}
