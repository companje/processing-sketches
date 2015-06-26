class Line {
 
  Point firstPoint,curPoint;
  
  Line(float x, float y) {
    curPoint = firstPoint = new Point(x,y);
  }
  
  void addPoint(float x, float y) {
     curPoint = curPoint.nextPoint = new Point(x,y);
  }
  
  void update(Point a, Ball ball) {
    if (a==null) return;
    Point b = a.nextPoint;
    if (b==null) return;
    
    update(b,ball);
    
    float labda = ((b.x-a.x) * (ball.pos.x-a.x) + (b.y-a.y) * (ball.pos.y-a.y)) / 
                  ((b.x-a.x) * (b.x-a.x) + (b.y-a.y) * (b.y-a.y));
    
    float distance = sqrt(pow(ball.pos.x-a.x - labda*(b.x-a.x),2) +
                          pow(ball.pos.y-a.y - labda*(b.y-a.y),2));
          
    PVector delta = PVector.sub(a,b);
    delta.normalize();
    PVector normal = new PVector(-delta.y,delta.x);
    
    if (distance<ball.r && labda>=0 && labda<=1) {
      PVector incidence = ball.vel.get();
      incidence.mult(-1);
      ball.vel = normal.get();
      ball.vel.mult(2*incidence.dot(normal));
      ball.vel.sub(incidence);
    }
  }
  
  void draw() {
    stroke(255);
    noFill();
    beginShape();
    firstPoint.draw();
    endShape();
  }
}
