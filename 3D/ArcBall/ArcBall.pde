Quaternion qTo = new Quaternion();

void setup() {
  size(500,500,P3D);
}

void draw() {
  background(0);
  translate(width/2,height/2);
  PVector v = qTo.getAxis();
  rotate(qTo.getAngle(),v.x,v.y,v.z);
  box(200);
}

void mouseDragged() {
  float px = map(pmouseX,0,width,-.5,.5);
  float py = map(pmouseY,0,height,-.5,.5);
  float x = map(mouseX,0,width,-.5,.5);
  float y = map(mouseY,0,height,-.5,.5);
  PVector from = toSphere(px,py);
  PVector to = toSphere(x,y);
  PVector axis = from.cross(to);
  qTo.mult(new Quaternion(from.dot(to),axis.x,axis.y,axis.z)); //w,x,y,z
  qTo.normalize();
}

PVector toSphere(float x, float y) {  //-0.5 ... +0.5
  PVector v = new PVector(x,y);
  if (v.mag()>1.0f) v.normalize();
  else v.z = sqrt(1.0 - v.mag());
  return v;
}


