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

  The GCodeCommand class is inspired by GCode.cs from the Repetier-Host project.
  https://github.com/repetier/Repetier-Host/blob/master/src/RepetierHost/model/GCode.cs
*/

class GCodeCommand {
  boolean hasN,hasM,hasG,hasX,hasY,hasZ,hasE,hasF,hasT,hasS,hasP,hasI,hasJ,hasR,hasD,hasText;
  boolean isComment = false;
  boolean isBin = true;
  boolean isV2 = true;
  float x,y,z,e,f,i,j,r;
  int n,s,p,g,m,t;
  String text = null;

  GCodeCommand() {
  }

  GCodeCommand(String cmd) {
    parse(cmd);
  }

  void parse(String cmd) {    
    //strip comments
    if (cmd.indexOf(";")>=0) {
      cmd = cmd.substring(0, max(0, cmd.indexOf(";")-1));
    }
    cmd = trim(cmd);
    if (cmd.length()==0) {
      isComment = true;
      return;
    }

    //parse code pairs
    for (String part : split(cmd, " ")) {
      if (hasText) {
        text = part; //FIXME: create better parser to get full sentence
        break;  
      }
      char code = part.toUpperCase().charAt(0);
      String value = part.substring(1);
      setCode(code,value);
    }
  }
  
  void setCode(char code, String value) { 
    switch (code) {
      case 'N': hasN = true; n = parseInt(value); break;
      case 'M': hasM = true; m = parseInt(value); break;
      case 'G': hasG = true; g = parseInt(value); break;
      case 'X': hasX = true; x = parseFloat(value); break;
      case 'Y': hasY = true; y = parseFloat(value); break;
      case 'Z': hasZ = true; z = parseFloat(value); break;
      case 'E': hasE = true; e = parseFloat(value); break;
      case 'F': hasF = true; f = parseFloat(value); break;
      case 'T': hasT = true; t = parseInt(value); break;
      case 'S': hasS = true; s = parseInt(value); break;
      case 'P': hasP = true; p = parseInt(value); break;
      case 'I': hasI = true; i = parseFloat(value); break;
      case 'J': hasJ = true; j = parseFloat(value); break;
      case 'R': hasR = true; r = parseFloat(value); break;
    }
    
    if (hasM && m==117) hasText = true;
  }

  byte[] getBinary() {
    ArrayList<Byte> buf = new ArrayList();
    int flags = 0;
    if (hasN) flags |= 1<<0;
    if (hasM) flags |= 1<<1;
    if (hasG) flags |= 1<<2;
    if (hasX) flags |= 1<<3;
    if (hasY) flags |= 1<<4;
    if (hasZ) flags |= 1<<5;
    if (hasE) flags |= 1<<6;
    if (isBin) flags |= 1<<7;
    if (hasF) flags |= 1<<8;
    if (hasT) flags |= 1<<9;
    if (hasS) flags |= 1<<10;
    if (hasP) flags |= 1<<11;
    if (isV2) flags |= 1<<12;
    if (hasText) flags |= 1<<15;
    if (hasI) flags |= 1<<16;
    if (hasJ) flags |= 1<<17;
    if (hasR) flags |= 1<<18;
    
    addBytes(buf,flags);
    
    if (hasText) buf.add((byte)text.length());
    if (hasN) addBytes(buf,n);
    if (hasM) addBytes(buf,(short)m);
    if (hasG) addBytes(buf,(short)g);
    if (hasX) addBytes(buf,x);
    if (hasY) addBytes(buf,y);
    if (hasZ) addBytes(buf,z);
    if (hasE) addBytes(buf,e);
    if (hasF) addBytes(buf,f);
    if (hasT) addBytes(buf,t);
    if (hasS) addBytes(buf,s);
    if (hasP) addBytes(buf,p);
    if (hasI) addBytes(buf,i);
    if (hasJ) addBytes(buf,j);
    if (hasR) addBytes(buf,r);
    if (hasText) addBytes(buf,text);
       
    //calculate checksum
    int a=0, b=0;
    for (byte value : buf) {
      a = (a+int(value)) % 255;
      b = (b+a) % 255;
    }
    buf.add((byte)a);
    buf.add((byte)b);
    
    //convert ArrayList<Byte> to primitive byte[]
    byte arr[] = new byte[buf.size()];
    for (int i=0; i<buf.size(); i++) {
      arr[i] = (byte)buf.get(i);
    }
    return arr;
  }
  
  void addBytes(ArrayList<Byte> buf, short v) {
    buf.add((byte)(v>>0 & 255));
    buf.add((byte)(v>>8 & 255));
  }
  
  void addBytes(ArrayList<Byte> buf, int v) {
    buf.add((byte)(v>>0 & 255));
    buf.add((byte)(v>>8 & 255));
    buf.add((byte)(v>>16 & 255));
    buf.add((byte)(v>>24 & 255));
  }
  
  void addBytes(ArrayList<Byte> buf, float v) {
    addBytes(buf,Float.floatToIntBits(v));
  }
  
  void addBytes(ArrayList<Byte> buf, String s) {
    for (int i=0; i<s.length(); i++) {
      buf.add((byte)s.charAt(i));
    }
  }
  
}

