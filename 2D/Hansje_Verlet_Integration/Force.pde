class Force {
  float radius=10;
  float x=100,y=100;
  float xr=4;
  float yr=4;
  color col=0;
  
  Force(float argX, float argY, float argRadius, float argSpeed) {
    x = argX;
    y = argY;
    xr = yr = argSpeed;
    radius = argRadius;    
  }
  void draw() {
    x+=xr; if (x-radius/2<xMin || x+radius/2>xMax) xr=-xr;
    y+=yr; if (y-radius/2<yMin || y+radius/2>yMax) yr=-yr;  

    fill(col);
    stroke(col);
    ellipse(x,y,radius,radius);
  }
}
