class Character{
PImage astro;
PImage astroWalk[];
PImage astroJump[];
boolean isWalking;
boolean isJumping;
int astroFrame;
PVector position;
PVector velocity;
PVector acceleration;


void movement(){
  if(frameCount % 12 == 0){
    astroFrame=(astroFrame + 1) % astroWalk.length;
  }
  pushMatrix();
  translate(position.x, position.y);
  if (isWalking) {
    image(astroWalk[astroFrame], 0, 0);
  } else {
    image(astro, 0, 0);
  }
  popMatrix();
  
  
}
}
