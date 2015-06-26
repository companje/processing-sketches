int xMin=0, xMax=400, yMin=0, yMax=180;
Verlet[] v = new Verlet[23];
Constraint[] c = new Constraint[40];
World w;
Force f1,f2;

void setup() {
  size(400,250);
  frameRate(30);

  //define world with gravity 1
  w = new World(1,.98);
  
  f1 = new Force(100,100,15,-12); f1.col=128;
  f2 = new Force(150,100,20,10); 
  
  //create verlets

  //head  
  v[0] = new Verlet(70,40);
  v[1] = new Verlet(80,30);
  v[2] = new Verlet(90,20);
  v[3] = new Verlet(80,10);
  v[4] = new Verlet(60,10);
  v[5] = new Verlet(50,20);
  v[6] = new Verlet(60,30);
  v[7] = new Verlet(70,10);

  //romp
  v[8] = new Verlet(50,50);
  v[9] = new Verlet(50,60);
  v[10] = new Verlet(70,80);
  v[11] = new Verlet(90,60);
  v[12] = new Verlet(90,50);
  
  //arms
  v[13] = new Verlet(30,70);
  v[14] = new Verlet(30,90);
  v[15] = new Verlet(110,70);
  v[16] = new Verlet(110,90);

  //legs
  v[17] = new Verlet(50,90);
  v[18] = new Verlet(90,90);
  v[19] = new Verlet(50,110);
  v[20] = new Verlet(50,130);
  v[21] = new Verlet(90,110);
  v[22] = new Verlet(90,130);
    
  //define solid verlets (fixed position)
  v[7].solid = true;  //keep hanging on the top of the head
  
  //connect the verlets with constraints
  c[0] = new Constraint(v[0],v[1]);
  c[1] = new Constraint(v[1],v[2]);
  c[2] = new Constraint(v[2],v[3]);
  c[3] = new Constraint(v[3],v[7]);
  c[4] = new Constraint(v[7],v[4]);
  c[5] = new Constraint(v[4],v[5]);
  c[6] = new Constraint(v[5],v[6]);
  c[7] = new Constraint(v[6],v[0]);
  c[8] = new Constraint(v[3],v[6]);
  c[9] = new Constraint(v[4],v[1]);
  c[10] = new Constraint(v[0],v[7]);
  c[11] = new Constraint(v[2],v[5]);
  c[12] = new Constraint(v[3],v[5]);
  c[13] = new Constraint(v[4],v[2]);
  
  //romp
  c[14] = new Constraint(v[0],v[8]);
  c[15] = new Constraint(v[8],v[9]);
  c[16] = new Constraint(v[9],v[10]);
  c[17] = new Constraint(v[10],v[11]);
  c[18] = new Constraint(v[11],v[12]);
  c[19] = new Constraint(v[12],v[0]);
  c[20] = new Constraint(v[11],v[0]);
  c[21] = new Constraint(v[9],v[0]);
  c[22] = new Constraint(v[8],v[10]);
  c[23] = new Constraint(v[0],v[10]);
  c[24] = new Constraint(v[8],v[12]);
  c[25] = new Constraint(v[9],v[11]);
  c[26] = new Constraint(v[10],v[12]);

  //arms
  c[27] = new Constraint(v[8],v[13]);
  c[28] = new Constraint(v[9],v[13]);
  c[29] = new Constraint(v[13],v[14]);
  c[30] = new Constraint(v[12],v[15]);
  c[31] = new Constraint(v[11],v[15]);
  c[32] = new Constraint(v[15],v[16]);
  
  //legs
  c[33] = new Constraint(v[10],v[17]);
  c[34] = new Constraint(v[10],v[18]);
  c[35] = new Constraint(v[17],v[19]);
  c[36] = new Constraint(v[19],v[20]);
  c[37] = new Constraint(v[18],v[21]);
  c[38] = new Constraint(v[21],v[22]);
  c[39] = new Constraint(v[17],v[18]);

  //c[40] = new Constraint(v[10],v[15]);
  //c[41] = new Constraint(v[10],v[13]);

  v[7].uberMove(86,63);
  
}
void draw() { 
  background(255);
  stroke(0);
  line(xMin,yMax,xMax,yMax);

  f1.draw();
  f2.draw();
  
  w.step(25);
  w.draw();

}
void mouseDragged() {
  v[7].uberMove(max(min(mouseX,xMax),xMin),63);
}
