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

import processing.serial.*;

class Printer {
  PApplet app;
  Serial serial;
  String deviceName;
  int deviceSpeed;
  BufferedReader reader;
  String line;
  float temperature = 0;
  boolean processingFile;

  Printer(PApplet app, String deviceName, int deviceSpeed) {
    this.app = app;
    this.deviceName = deviceName;
    this.deviceSpeed = deviceSpeed;
    serial = new Serial(app, deviceName, deviceSpeed);
    serial.bufferUntil('\n');
  }

  void enterFirmwareMode() {
    serial.write("Q"); //from bootloader mode
  }

  void home() {
    sendGCode("G28");
  }
  
  void homeZ() {
    sendGCode("G1 Z0");
  }

  void setTemperature(int temp) {
    sendGCode("M104 S"+temp);
  }

  void getTemperature() {
    sendGCode("M105");
  }
  
  void disableMotors() {
    sendGCode("M83");
  }

  void getInfo() {
    sendGCode("M115");
  }

  void reconnect() {
    serial.stop();
    serial = new Serial(app, deviceName, deviceSpeed);
    serial.bufferUntil('\n');
  }
  
  void pausePrint() {
    processingFile = !processingFile;
    if (processingFile) {
      sendNextLine();
      println("resume");
    } else {
      println("pause");
    }
  }

  void sendGCode(String gcode) {
    GCodeCommand cmd = new GCodeCommand(gcode);
    if (cmd.isComment) {
      println("Error: you cannot send comments or empty lines to printer");
    } else {
      serial.write(cmd.getBinary());
    }
  }

  void sendFile(String filename) {
    reader = createReader(filename);
    processingFile = true;
    sendNextLine();
  }

  void onSerial() {
    while (serial.available () > 0) {
      String response = serial.readString();   
      if (response != null) {
        parseResponse(trim(response));
      }
    }
  }

  void parseResponse(String response) {
    println("< "+response);
    
    if (response.indexOf("ok")==0) { //startsWith
      if (processingFile) {
        sendNextLine(); 
      }
    } else if (response.indexOf("T:")==0) {
      float t = parseFloat(response.substring(2));
      if (t>0) temperature = t;
    }
  }

  void sendNextLine() {
    if (!processingFile) { 
      return;
    }
    try {
      String line = reader.readLine();
      if (line != null) {
        println("> " + line);
        if (new GCodeCommand(line).isComment) {
          sendNextLine();
        } else {
          sendGCode(line);
        }    
      }
    } 
    catch (IOException e) {
      processingFile = false;
      println("Error reading from file");
    }
  }
}

