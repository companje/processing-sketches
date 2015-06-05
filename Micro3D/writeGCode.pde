/*
  Micro3D-controller-experiment.
  Copyright (c) Rick Companje, Doodle3D, June 5th 2015
  Licenced under GPLv3 licence.
  http://www.doodle3d.com
  
  The writeGCode function creates a .gcode file in the data folder of your project.
  It creates a simple 'doodle', a twisted hexagon with radius 30mm and a height of 100mm.
*/


void writeGCode() {
  PrintWriter file = createWriter("data/cube.gcode");
  file.println("M104 S200"); //heatup and continue
  file.println("G90"); //absolute coordinates
  file.println("G28"); //home XY (Z is unaffected)
  file.println("G1 Z0"); //goto Z0
  file.println("M109 S200"); //heatup and wait
  file.println("M106"); //fan on
  
  float cx = 50; //bed center x
  float cy = 50; //bed center y
  float radius = 30; //object radius
  float corners = 6; 
  float twist = 1;
  float layerHeight = .3; //mm
  float objectHeight = 100; //mm
  float filamentThickness = 1.75; //mm
  float wallThickness = .4; //mm
//  float speed = 100; //mm/s
  float e = 0;
  float extrudeRate = wallThickness / filamentThickness * layerHeight;
  int layers = int(objectHeight / layerHeight);
  PVector prev = new PVector(cx,cy,0); 
  for (int layer=0; layer<layers; layer++) {
    for (int i=0; i<corners; i++) {
      float ii = float(i)/corners;
      float zz = float(layer)/layers;
      float a = float(i)/corners * TWO_PI;
      a += zz*twist;
      float x = cos(a)*radius+cx;
      float y = sin(a)*radius+cy;
      float z = zz*objectHeight;
      if (layer>2) z+=ii*layerHeight; //sublayers/spiralize
      float flowRate = (layer<3) ? 2 : 1;
      e += prev.dist(prev = new PVector(x,y,z)) * extrudeRate * flowRate;
      file.println("G1 X"+nf(x,0,2)+" Y"+nf(y,0,2)+" Z"+nf(z,0,2)+" E"+nf(e,0,2)); //+" F"+speed*60);
    }
  }
  file.println("G1 X100 Y100"); //right-back corner
  file.println("M83"); //disable motors
  file.println("M107"); //fan off
  file.flush();
  file.close();
  println("done");
}
