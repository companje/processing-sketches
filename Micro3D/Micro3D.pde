import processing.serial.*;

String deviceName = "/dev/tty.usbmodem1411";
int deviceSpeed = 115200;
Serial serial;
GCodeCommand gcode = new GCodeCommand();

void setup() {
  size(500,500);
  serial = new Serial(this, deviceName, deviceSpeed);
}

void draw() {
  
}

void keyPressed() {
  switch(key) {
    case 'q':
    case 'Q':
      serial.write('Q');
      break;
    case 'i':
      serial.write(new GCodeCommand("M115").getBinary());
      break;
    case 'h':
      serial.write(new GCodeCommand("G28").getBinary());
      break;
    case 't':
      serial.write(new GCodeCommand("M105").getBinary());
      break;
    case 'T':
      serial.write(new GCodeCommand("M104 S200").getBinary());
      break;
    case 'f':
      sendFile();
      break;
    case 'r': //reconnect
      serial.stop();
      serial = new Serial(this, deviceName, deviceSpeed);
      break;
    case 'x':
      serial.write(new GCodeCommand("G1 X10").getBinary());
      break;
    case 'X':
      serial.write(new GCodeCommand("G1 X-10").getBinary());
      break;
    case 'y':
      serial.write(new GCodeCommand("G1 Y10").getBinary());
      break;
    case 'Y':
      serial.write(new GCodeCommand("G1 Y-10").getBinary());
      break;
  }
}

void sendFile() {
  serial.write(new GCodeCommand("G91").getBinary());
  serial.write(new GCodeCommand("G1 E20").getBinary());
}

void serialEvent(Serial serial) {
  while (serial.available () > 0) {
    int b = serial.read();
    if (b==0x0A) {
      println();
    }
    else if (b>=' ' && b<=127) {
      print((char)b);
    } else {
      print(hex(b,2)+" ");
    }
  }
}

