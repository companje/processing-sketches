class Point extends PVector {
  Point nextPoint;
  
  Point(float x, float y) { 
    super(x,y); 
  }
  
  void draw() {
    if (nextPoint!=null) nextPoint.draw();
    vertex(x,y);
  }
}
