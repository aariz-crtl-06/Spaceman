class Spikes{
  float xPos=0;
  float yPos=0;
  float sWidth=20;
  float sHeight=30;
  Spikes(float tempXpos, float tempYpos){
    xPos=tempXpos;
    yPos=tempYpos;
  }
  void tri(){
    fill(0);
    triangle(xPos, yPos, xPos +sWidth/2, yPos-sHeight, xPos+sWidth,yPos);
  }
  
}
