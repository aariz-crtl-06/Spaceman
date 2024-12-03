//Use 'w' to jump and 'd' to progress forward
//You're the last person inside the nuclear poweplant deep within space.
//The core is about to explode any second, luckily, there's one last porta!l
//But the portal is on the other side of magma powered flooring that kills intstantly...
//Goodluck!

//Allows for sound library to work within code
import processing.sound.*;
//Creates a way to utilize sound files
SoundFile bgm;
SoundFile jump;
SoundFile win;
SoundFile death;
SoundFile core;
//Added variables for flickering lights
float light=0;
float light2=0;
//All the objects are having new instances created
Character character;
Level[] level= new Level[10];
Spikes[] spikes= new Spikes[100];

//Creates a way to utilize image files
PImage space;
PImage failed;
PImage success;
PImage proceed;
PImage portal[];
int portalFrame;

//Allows portal to be on the 10th platform
float portalX;
float portalY;

//Checks if the player is moving
boolean right = false;
//Acceleration value
float accel = 0.3;

//Dimensions of spikes
 float triangleWidth = 20;
 float triangleHeight = 30;

//A way to check if win/lose conditions are met
  int gameOver=0;
  int gameWon=0;
  int reset=0;
  int resetWin=0;

void setup(){
 size(400,400);
 
 //Allows the sound files to be recognized
 bgm=new SoundFile(this, "spaceTheme.wav");
 jump=new SoundFile(this, "jump.wav");
 win=new SoundFile(this, "win.wav");
 death=new SoundFile(this, "death.wav");
 core=new SoundFile(this, "core.wav");
 rectMode(CENTER);
 imageMode(CENTER);
 //Allows the image files to be recognized
 character= new Character();
 character.astro=loadImage("still.png");
 space=loadImage("space.jpg");
 
 failed=loadImage("failed.png");
 success=loadImage("success.png");
 proceed=loadImage("proceed.png");
 
 //An array to play a run cycle animation
 character.astroWalk = new PImage[4];
 character.astroWalk[0] = loadImage("walk1.png");
 character.astroWalk[1] = loadImage("walk2.png");
 character.astroWalk[2] = loadImage("walk3.png");
 character.astroWalk[3] = loadImage("walk4.png");
 
 //Allows for a jump animation
 character.astroJump = loadImage("jump2.png");
 
 //Creates a loop for the portal animation to run
 portal=new PImage[4];
for(int i=0; i<portal.length; i++){
 portal[i]= loadImage("port"+(i+1)+".png");
}
 
 
 //Initilizing the values of Position, velocity, and acceleration
  character.position= new PVector(100,character.yPos);
  character.velocity= new PVector(0,0);
  character.acceleration= new PVector(0,accel);

//The layout of the various platforms being created by an object array
  level[0] = new Level(320, 260);
  level[1] = new Level(500, 200);
  level[2] = new Level(650, 150);
  level[3] = new Level(850, 120);
  level[4] = new Level(1050, 200);
  level[5] = new Level(1250, 270);
  level[6] = new Level(1400, 170);
  level[7] = new Level(1500, 260);
  level[8] = new Level(1650, 170);
  level[9] = new Level(1800, 200);
  
  //Creates the spikes 
  for(int i=0; i<spikes.length; i++){
   spikes[i]=new Spikes(300+i*20, height - 70); 
  }
  //Calls function when the game needs to be reset
  restartGame();
}

//The function to reset game
void restartGame(){
  character.position = new PVector(100, character.yPos);
  character.velocity = new PVector(0, 0);
  character.acceleration = new PVector(0, accel);
  
  level[0] = new Level(320, 260);
  level[1] = new Level(500, 200);
  level[2] = new Level(650, 150);
  level[3] = new Level(850, 120);
  level[4] = new Level(1050, 200);
  level[5] = new Level(1250, 270);
  level[6] = new Level(1400, 170);
  level[7] = new Level(1500, 260);
  level[8] = new Level(1650, 170);
  level[9] = new Level(1800, 200);

  gameOver=0;
  gameWon=0;
    
 for (int i = 0; i < spikes.length; i++) {
 spikes[i] = new Spikes(300 + i * 20, height - 70);
  loop();
    }
    //Plays background music
    if(!bgm.isPlaying()){
    bgm.loop();
    }
}

void draw(){
  println(character.isJumping);
  //Sets the portal value to be at platform 9
  portalX=level[9].xPos;
  portalY=level[9].yPos;
  
  //Runs the loss screen once the player dies
  if (gameOver == 1) {
    death.play();
        background(0);
        image(failed,200,200,290,30);
        image(proceed,200,300,290,30);
        noLoop();
        return;
  }
  //Runs the win screen once the player reaches the portal
  if (gameWon == 1) {
    win.play();
        background(0);
        image(success,200,200,290,30);
        image(proceed,200,300,290,30);
        noLoop();
        return;
  }
  //Creates the background and light effects
  stroke(255);
  background(164,125,99);
  noStroke();
  image(space,200,165,600,330);
  light=(random(10,250));
  light2=(random(140,250));
  
  //Places the portal at the end of platform 9
  image(portal[portalFrame],portalX+50,portalY-60, 100,100);
  
  //Allows the movement function to run from the character class
  character.movement();
  
  //If the player moves right, everything from the level class moves left
  if(right == true){
    for(int i=0; i< level.length; i++){
      if(level[i] !=null){
   level[i].xPos=level[i].xPos-2;
      }
    }
    //If the player moves right, everything from the spikes class moves left
    for(int i=0; i< spikes.length; i++){
      if(spikes[i] !=null){
   spikes[i].xPos=spikes[i].xPos-2;
      }
    }
  }
  //Sketches the spikes from the spikes class
  for(int i=0; i<spikes.length; i++){
   spikes[i].tri(); 
  }
 //Sketches the platforms from the level class
  for(int i=0; i<level.length; i++){
    if(level[i] !=null){
   level[i].plat();
    }
  }
  //Once the player passes a certain point the core meltdown warning plays
  if(character.position.x>200 && character.position.x<201){
   if(!core.isPlaying()){   
    core.play();
  }
}
//Has the baseline for the floor
  stroke(255);
  line(0,330,3000,330);
  
  //Creates the out of bounds area for loss condtion
  if (character.position.x > 127 && character.position.y >= 280) {
        gameOver = 1;
  }
  
  //Creates the required position for win condition
  if (character.position.x > 328 && character.position.y < 280) {
        gameWon = 1;
  }
  
  //Allows the portal animation to be played using the frameCount
  if(frameCount % 12==0){
   portalFrame=(portalFrame+1)%portal.length;
  }
  
  }

void keyPressed(){
  //Allows the player to progress when 'd' is pressed
  if(key=='d'){
 character.isWalking=true; 
 right=true;
  }
  
  if(key=='w'){
    //Allows the player to jump, as well as plays the jump sound effect
 character.jump(); 
 if(!jump.isPlaying()){
 jump.play();
  jump.amp(2.0);
  }
  }
  
  if(key=='o' && gameOver==1){
   //When loss condition is met, the player can press 'o' and try again
   restartGame(); 
  }
  
   if(key=='o' && gameWon==1){
     //When win condition is met, the player can press 'o' and try again
   restartGame(); 
  }
}

void keyReleased(){
  //When the player lets go of 'd' everything stops moving left and the character stops moving
 if(key=='d'){
 character.isWalking=false; 
 right=false;
 }
}
