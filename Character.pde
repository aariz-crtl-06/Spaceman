//Creates the character class
class Character{
//Allows for all the images to be used
PImage astro;
PImage astroWalk[];
PImage astroJump;
boolean isWalking;
boolean isJumping;
//Checks when the player is on a platform
boolean onPlatform=false;
int astroFrame;
//The PVectors for position, velocity, and acceleration
PVector position;
PVector velocity;
PVector acceleration;
//Tracks the Y-value of the player
int yPos = 290;

//Constructor of character
Character(){
 isWalking=false;
 isJumping=false;
 astroFrame=0;
}
//Function to allow for the player to jump up
void jump(){
 if(!isJumping){
   isJumping=true;
   velocity.y=-8;
 }
}
//Function to track movement of player
void movement(){
  //Checks when the player first hits a platform
  boolean firstOnPlatform=false;
 
  
  for(int i=0; i<level.length; i++){
    //If the level value isn't null, then it allows to check for platform boundries
   if(level[i] !=null){
    Level plt = level[i];
    //Creates the boundries to make the player be able to stand on the platforms
    if(position.x > plt.xPos - 100 / 2 && position.x < plt.xPos + 100 / 2 && position.y +39.3 >= plt.yPos - 20 / 2 && position.y + 20 < plt.yPos) {
      position.y=plt.yPos-49.5;
      //Recognizes the player is on a platform and stops the jump
      firstOnPlatform=true;
      velocity.y=0;
      break;
   }
  }
  }
  //Makes the checker for on platform to confirm the player's on a platform
  onPlatform=firstOnPlatform;
  
  //When the player gets off a platform, the velocity and acceleration of gravity continues
  if(!onPlatform){
   velocity.add(acceleration);
   position.add(velocity);
    
    //Makes the gravity work of pulling the player down to the ground
    if(position.y >= yPos){
      position.y=yPos;
      isJumping=false;
      velocity.y=0;
    }
  } 
  //When on a platform, the velocity pulling player down to ground stops
  if(onPlatform==true){
   isJumping=velocity.y<0; 
  }
  
  //Allows for the player to progress on the screen while running
  if(isWalking){
   position.x=position.x+0.3;
  }
  
  //Allows for the animation cycle to play for player walk
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
