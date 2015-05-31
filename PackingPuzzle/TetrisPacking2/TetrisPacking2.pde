String solution[] = {
 "aaabbbbbcadddeeecaffdeheccgfdhhhiggffjhmiiggjjkmilljjkkmilljkkmm",
  "iiiicccalligcaaallgggfdajjgfffdbkjjfdddbkkjjheebmkkhhhebmmmmheeb",
  "mmkkjllimkkjjllimkjjggiimhjffggihhhdfgccehedffaceeedddacbbbbbaaa",
  "beehmmmmbehhhkkmbeehjjkkbdddfjjkbdfffgjjadfgggllaaacgillaccciiii" };

int r=0;

//String a = "7,2,2 1,7,1 2,2,7 4,7,4";
String a = "";

//a {7,2,2}, 

ArrayList<Piece> pieces = new ArrayList();
//Grid grid = new Grid(8,8);
//Piece selected;

int nPieces = 12;
int rows = 8;
int cols = 8;
int w = 400;
int h = 400;
int cw = w / cols;
int ch = h / rows;

void setup() {
  size(w*2+20,h+100);
  colorMode(HSB);
  loadPieces("blokjes.txt");
  println(pieces.get(0).orientations[0]);
  //selected = pieces.get(0);  
}

void draw() {
  background(0);
  translate(10,10);
  stroke(0);
  drawGrid();
  
//  translate(410,00);
//  scale(.5,.5);
  drawPieces();
}

void drawPieces() {
  noStroke();
  for (int row=0; row<rows; row++) {
    for (int col=0; col<cols; col++) {
      int index = solution[r].charAt(row*rows+col)-'a';
      fill(float(index)/nPieces*255,100,255);
      rect(col*cw,row*ch,cw,ch);
    }
  } 
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


//  fill(0,255,255);
//  drawPiece(selected);
//  for (int i=0; i<pieces.size(); i++) {
//    fill(float(i)/pieces.size()*255,255,255);
//    if (pieces.get(i)==selected) drawPiece(pieces.get(i));
//  }
  

//  pushMatrix();
//  translate(0,height-80);
//  scale(.25,.25);
//  for (int i=0; i<pieces.size(); i++) {
//    fill(float(i)/pieces.size()*255,255,255);
//    drawPiece(pieces.get(i));
//    translate(5*cw,0);
//  }
//  popMatrix();
//  
//}
//

//
void keyPressed() {
  r++;
  if (r>3) r=0;  
}

//  if (selected==null) return;
//  if (key==ENTER) selected.rotate90();  
//  if (keyCode==DOWN) selected.move(0,1);
//  if (keyCode==UP) selected.move(0,-1);
//  if (keyCode==RIGHT) selected.move(1,0);
//  if (keyCode==LEFT) selected.move(-1,0);
//  if (key>='0' && key<='9') selected = pieces.get(key-'0');
//
//}
//
//void drawPiece(Piece p) {
//  strokeWeight(p==selected ? 2 : 1);
//  
//  for (int row=0; row<p.rows; row++) {
//    for (int col=0; col<p.cols; col++) {
//      if (p.matrix[row][col]) rect(col*cw,row*ch,cw,ch);
//    }
//  }
//}
//
void loadPieces(String filename) {
  String lines[] = loadStrings(filename);
  for (int i=0; i<lines.length; i++) {
    pieces.add(new Piece(lines[i]));
  }
}
