class Level{
  float xPos=0;
  float yPos=0;
  Level(float tempXpos, float tempYpos){
    xPos=tempXpos;
    yPos=tempYpos;
  }
  void plat() {
    stroke(255);
    fill(201,208,214);
    rect(xPos, yPos, 100,10);
    rect(xPos, yPos+2, 80,12);
    line(xPos+-27,yPos+8,xPos+-27,yPos+-4);
    line(xPos+-17,yPos+8,xPos+-17,yPos+-4);
    line(xPos+17,yPos+8,xPos+17,yPos+-4);
    line(xPos+27,yPos+8,xPos+27,yPos+-4);
    strokeWeight(0.5);
    stroke(0);
    fill(59,8,8);
    ellipse(xPos,yPos+2,10,10);
    fill(light,8,8);
    ellipse(xPos,yPos+2,6,6);
    
    }
    
  }
