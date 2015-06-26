/**
Copyright (c) Rick Companje, June 22th 2010 
Licenced under GPLv3 licence. http://www.companje.nl

This example contains the following concepts: 
1. The linked-list principle is used to describe a polyline (use mouse to draw a polyline). 
2. It moves a ball by adding its velocity to the position on every frame.
3. It checks for collision of the ball with a polyline.
4. The normal and dot-product are calculated to determine the angle of reflection when the ball bounces.
5. It uses the 'alpha-trail' trick which creates a 'motion-blur' effect by clearing the background with a semi-transparent rectangle.
*/

Ball b = new Ball();
Line l;

void setup(){
  size(640, 240);
  frameRate(60);
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

void mousePressed() {
  l = new Line(mouseX,mouseY);
}

void mouseDragged() {
  l.addPoint(mouseX,mouseY);
}

