class Constraint {
  Verlet v1,v2;
  float constraintLength;

  //constructor
  Constraint(Verlet verlet1, Verlet verlet2) {
    v1 = verlet1;
    v2 = verlet2;
    constraintLength = dist(v1.x,v1.y,v2.x,v2.y);
  }
  void solve() {
    float xdif = v1.x - v2.x;
    float ydif = v1.y - v2.y;
    float distance = dist(v1.x,v1.y,v2.x,v2.y);  
       
    //calculate new x,y for verlet 1 and 2
    xdif = (xdif/distance) * constraintLength / 2;
    ydif = (ydif/distance) * constraintLength / 2;
    v1.x = (v2.x + v1.x) / 2;
    v1.y = (v2.y + v1.y) / 2;
    v2.x = v1.x-xdif;
    v2.y = v1.y-ydif;
    v1.x += xdif;
    v1.y += ydif;
    
    //keep our solid verlets on the original place
    if (v1.solid) { v1.x = v1.xx; v1.y = v1.yy; }
    if (v2.solid) { v2.x = v2.xx; v2.y = v2.yy; }
    
  }  
}
