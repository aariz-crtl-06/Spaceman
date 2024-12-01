Character character;

void setup(){
 size(400,400);
 rectMode(CENTER);
 imageMode(CENTER);
 character= new Character();
 character.astro=loadImage("still.png");
 
 character.astroWalk = new PImage[4];
 character.astroWalk[0] = loadImage("walk1.png");
 character.astroWalk[1] = loadImage("walk2.png");
 character.astroWalk[2] = loadImage("walk3.png");
 character.astroWalk[3] = loadImage("walk4.png");
 
 character.astroJump = new PImage[3];
 character.astroJump[0] = loadImage("jump1.png");
 character.astroJump[1] = loadImage("jump2.png");
 character.astroJump[2] = loadImage("jump3.png");
 
  character.position= new PVector(100,250);
  character.velocity= new PVector(0,0);
  character.acceleration= new PVector(0,0.5);
}

void draw(){
  background(0);
  
  character.movement();
}

void keyPressed(){
  if(key=='d'){
 character.isWalking=true; 
  }
  
  if(key=='w'){
 character.isJumping=true; 
  }
}

void keyReleased(){
 character.isWalking=false; 
 character.isJumping=false; 
  
}
