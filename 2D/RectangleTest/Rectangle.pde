class Rectangle {
  float x=0, y=0, w=0, h=0;

  Rectangle() {

  }

  Rectangle(float x, float y, float w, float h) {
    set(x,y,w,h);
  }
  
  void set(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void set(Rectangle r) {
    set(r.x,r.y,r.w,r.h);
  }
  
  Boolean inside(float px, float py) {
    return (px>=x && px<=x+w && py>=y && py<=y+h); 
  }
  
  String toString() {
    return (int)x + "," + (int)y + "," + (int)w + "," + (int)h; 
  }
  
  void growToInclude(Rectangle rect) {
//    println("growToInclude rect");
    growToInclude(rect.getMinX(),rect.getMinY()); //top-left
    growToInclude(rect.getMaxX(),rect.getMaxY()); //bottom-right
  }

  void growToInclude(PVector p) {
    growToInclude(p.x,p.y);
  }

  void growToInclude(float x, float y) {
    if (this.x==0 && this.y==0 && w==0 && h==0) {
      set(x,y,0,0);
      return; 
    }
    
    float x0 = min(getMinX(),x);
    float x1 = max(getMaxX(),x);
    float y0 = min(getMinY(),y);
    float y1 = max(getMaxY(),y);

    float w = x1 - x0;
    float h = y1 - y0;
//    println("growToInclude",x,y,"----",x0,y0,x1,y1,w,h);

    set(x0,y0,w,h);
    
  }

  // void fixNegativeDimensions() {
  //   set(getMinX(),getMinY(),abs(w),abs(h));
  // }

  PVector getCenter() { 
    float cx = (getMaxX()-getMinX()) / 2;
    float cy = (getMaxY()-getMinY()) / 2;
    return new PVector(cx,cy);
  }

  float getArea() {
    return w*h;
  }

  Rectangle clone() {
    return new Rectangle(x,y,w,h);
  }

  float getX() { return x; }
  float getY() { return y; }
  float getWidth()  { return w; }
  float getHeight() { return h; }
  float getMinX() { return min(x, x + w); }
  float getMaxX() { return max(x, x + w); }
  float getMinY() { return min(y, y + h); }
  float getMaxY() { return max(y, y + h); }

};


