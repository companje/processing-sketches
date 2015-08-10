//Sierpinski Triangle by Rick Companje
//2007-01-18

void setup() {
  size(256,256);
  
  for(int x=0; x<width; x++)
    for(int y=0; y<height; y++)
      if ((x&y)!=0) point(x,y);
}

