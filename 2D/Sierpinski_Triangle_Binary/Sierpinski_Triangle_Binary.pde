//Sierpinski Triangle by Rick Companje
//2007-01-18

size(512,512);

for(int x=0; x<width; x++)
  for(int y=0; y<height; y++)
    if ((x&y)!=0) point(x,y);
