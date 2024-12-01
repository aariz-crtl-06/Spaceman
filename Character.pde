class Character{
PImage astro;
PImage astroWalk[];
PImage astroJump;
boolean isWalking;
boolean isJumping;
int astroFrame;
PVector position;
PVector velocity;
PVector acceleration;
int yPos = 250;

Character(){
 isWalking=false;
 isJumping=false;
 astroFrame=0;
}

void jump(){
 if(!isJumping){
   isJumping=true;
   velocity.y=-10;
 }
}
void movement(){
  if(isJumping){
    velocity.add(acceleration);
    position.add(velocity);
    
    if(position.y >= yPos){
      position.y=250;
      isJumping=false;
      velocity.set(0,0);
    }
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
