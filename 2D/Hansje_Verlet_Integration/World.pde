class World {
  float gravity, friction;
  
  World(float argGravity, float argFriction) {
    gravity=argGravity;
    friction=argFriction;
  }
  
  void step(int iterations) {
 
    //calculate gravity
    for (int i=0; i<v.length; i++) {
      v[i].impulseStep(gravity);
    }
            
    for (int iteration=0; iteration<iterations; iteration++) {
      //solve all constraints
      
      for (int i=0; i<v.length; i++) {
        v[i].forceStep(f1.x, f1.y, f1.radius);
        v[i].forceStep(f2.x, f2.y, f2.radius);
      }
    
      for (int i=0; i<c.length; i++) {
        //Michiel zegt dat dit niet in een vaste volgorde moet omdat je dan een voorkeursrichting krijgt.
        //Michiel zegt dat ik met veerconstantes moet werken en niet zoals ik nu doe: evenwicht zetten en daarna dempen
        c[i].solve();    
      }
    }
      
    for (int i=0; i<v.length; i++) {
      v[i].frictionStep(friction);
    }
    
  }
  void draw() {  
    //draw constraint axes/bars
    for (int i=0; i<c.length; i++) {
      line(c[i].v1.x,c[i].v1.y,c[i].v2.x,c[i].v2.y);
    }
    //draw verlet points
    for (int i=0; i<v.length; i++) {
      fill(v[i].solid?255:0,0,0);
      noStroke();
      ellipse(v[i].x,v[i].y,4,4);
      noFill();
    }
  }
}
