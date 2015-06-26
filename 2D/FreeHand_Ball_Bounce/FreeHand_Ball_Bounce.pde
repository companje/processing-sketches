/**
 * Freehand line bouncing ball with linked list structure
 * Rick Companje, May 20th, 2010
 */

Ball b = new Ball();
Line l;

void setup(){
  size(640, 240);
  frameRate(10);
  fill(128);
  smooth();
  b.setup();
}

void draw(){
  fill(0, 50);
  noStroke();
  rect(0, 0, width, height);

  b.draw();
  b.update();
  
  if (l!=null) {
    l.update(l.firstPoint,b);
    l.draw();
  }
  
}

void keyPressed() {
  saveFrame();  
}

void mousePressed() {
  l = new Line(mouseX,mouseY);
}

void mouseDragged() {
  l.addPoint(mouseX,mouseY);
}

