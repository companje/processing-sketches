Rectangle r = new Rectangle();

void setup() {
  size(500,500);
  
  r.growToInclude(-50,-50);
  r.growToInclude(50,50);
  println(r);
}

void draw() {
  
}
  
