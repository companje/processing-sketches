/*
  Micro3D-controller-experiment.
  Copyright (c) Rick Companje, Doodle3D, June 5th 2015
  Licenced under GPLv3 licence.
  http://www.doodle3d.com
  
  This is a Processing project to control your Micro3D by writing your own code.
  You need to download the Processing IDE from Processing.org.

  This code can be used to communicate with your Micro3D Printer (printm3d.com).
  It is an unofficial unfinished project and should only be used for experiments.
  You might break the warrenty of your Micro3D printer. Use this code at your own risk.
*/

Printer printer;

void setup() {
  size(500,500);
  printer = new Printer(this,"/dev/tty.usbmodem1421",115200);
}

void draw() {
  background(0);
  text("temperature:" + printer.temperature,10,20);
}

void keyPressed() {
  switch (key) {
    case ' ': printer.pausePrint(); break;
    case 'f': printer.enterFirmwareMode(); break;
    case 'r': printer.reconnect(); break;
    case 'h': printer.home(); break;
    case 'z': printer.homeZ(); break;
    case 'm': printer.disableMotors(); break;
    case 't': printer.getTemperature(); break;
    case 'T': printer.setTemperature(200); break;
    case 'i': printer.getInfo(); break;
    case 'p': printer.sendFile("cube.gcode"); break;
    case 'n': printer.sendNextLine(); break;
    case 'w': writeGCode(); break;
  }  
}

void serialEvent(Serial serial) {
  if (printer!=null) {
    printer.onSerial();
  } 
}

