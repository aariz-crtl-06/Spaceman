class Level{
  float xPos=0;
  float yPos=0;
  float xSize=0;
  float ySize=0;
  
  Level(float tempXpos, float tempYpos, float tempXsize, float tempYsize){
    xPos=tempXpos;
    yPos=tempYpos;
    xSize=tempXsize;
    ySize=tempYsize;
  }
  void plat() {
    stroke(255); 
    rect(xPos+800, yPos, xSize,ySize);
    }
    
  }
