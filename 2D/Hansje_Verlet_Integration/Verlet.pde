class Verlet {
  float x,y;
  float xx,yy;
  float xv,yv;
  boolean solid = false;

  //constructor
  Verlet(float argX, float argY) {
    uberMove(argX,argY);
  }
  void uberMove(float argX, float argY) {
    x=xx=argX;
    y=yy=argY;
  }  
  void impulseStep(float aGravity) {
    
    if (!solid) {
      yv += aGravity;

      if (x<xMin) { xv = -xv; x = xMin; }
      if (x>xMax) { xv = -xv; x = xMax; }
      if (y<yMin) { yv = -yv; y = yMin; }
      if (y>yMax) { yv = -yv; y = yMax; } 
      
      x += xv;
      y += yv;
    }
  }
  void frictionStep(float friction) {
    xv = x-xx;
    yv = y-yy;
    xv *= friction;
    yv *= friction;
    xx = x;
    yy = y;
  }
  void forceStep(float argX, float argY, float radius) {
    float xdif = x-argX;
    float ydif = y-argY;
    float distance = sqrt(pow(xdif,2) + pow(ydif,2));
    if(distance < radius) {
      xdif = (xdif/distance)*radius;
      ydif = (ydif/distance)*radius;
      x = x+xdif;
      y = y+ydif;
    }
  }

}
