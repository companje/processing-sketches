String s="█▓▒░";
//String s=" ░▒▓█";
PImage img = loadImage("heart.png");

size(750,750);
img.resize(width,height);

float xStep = width/25;
float yStep = height/25;

background(255);
noStroke();
fill(0);
textSize(16);

image(img,0,0);

for (float y=0; y<height; y+=yStep) {
  for (float x=0; x<width; x+=xStep) {
    color c = img.get(int(x+xStep/2),int(y+yStep/2));
    int b = int(brightness(c)/256.*s.length());
    char ch = s.charAt(b); 
//    text(ch,x,y);
    fill(255,0,0);
    ellipse(x+xStep/2,y+yStep/2,4,4);
    print(ch+""+ch+""+ch);
  }
  println();
}

