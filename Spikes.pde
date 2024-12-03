//Class for the spikes to kill player
class Spikes{
  float xPos=0;
  float yPos=0;
  float sWidth=20;
  float sHeight=30;
  Spikes(float tempXpos, float tempYpos){
    xPos=tempXpos;
    yPos=tempYpos;
  }
  //Draws the spikes
  void tri(){
    noStroke();
    fill(245,129,27);
    stroke(255,0,0);
    fill(255,light2,5);
    triangle(xPos, yPos, xPos +sWidth/2, yPos-sHeight, xPos+sWidth,yPos);
  }
  
}
