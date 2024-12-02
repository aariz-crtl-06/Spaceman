class Character{
PImage astro;
PImage astroWalk[];
PImage astroJump;
boolean isWalking;
boolean isJumping;
boolean onPlatform=false;
int astroFrame;
PVector position;
PVector velocity;
PVector acceleration;
int yPos = 290;

Character(){
 isWalking=false;
 isJumping=false;
 astroFrame=0;
}

void jump(){
 if(!isJumping){
   isJumping=true;
   velocity.y=-8;
 }
}
void movement(){
  boolean firstOnPlatform=false;
 
  
  for(int i=0; i<level.length; i++){
   if(level[i] !=null){
    Level plt = level[i];
    if(position.x > plt.xPos - plt.xSize / 2 && position.x < plt.xPos + plt.xSize / 2 && position.y +39.4 >= plt.yPos - plt.ySize / 2 && position.y + 22 < plt.yPos) {
      position.y=plt.yPos-49.5;
      firstOnPlatform=true;
      velocity.y=0;
      break;
   }
  }
  }
  
  onPlatform=firstOnPlatform;
  
  if(!onPlatform){
   velocity.add(acceleration);
   position.add(velocity);
    
    if(position.y >= yPos){
      position.y=yPos;
      isJumping=false;
      velocity.y=0;
    }
  } 
  
  if(onPlatform==true){
   isJumping=velocity.y<0; 
  }
  
  if(isWalking){
   position.x=position.x+0.1;
  }
  
  if(frameCount % 12 == 0){
  if (isWalking){
    astroFrame=(astroFrame + 1) % astroWalk.length;
    }
  else {
   astroFrame=0; 
  }
  }
  pushMatrix();
  translate(position.x, position.y);
  if (isJumping){
   image(astroJump,0,0); 
  }
  else if (isWalking) {
    image(astroWalk[astroFrame], 0, 0);
  } else {
    image(astro, 0, 0);
  }
  popMatrix();
}
}
