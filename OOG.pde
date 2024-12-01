Character character;
Level level;
void setup(){
 size(400,400);
 rectMode(CENTER);
 imageMode(CENTER);
 character= new Character();
 level= new Level();
 character.astro=loadImage("still.png");
 
 character.astroWalk = new PImage[4];
 character.astroWalk[0] = loadImage("walk1.png");
 character.astroWalk[1] = loadImage("walk2.png");
 character.astroWalk[2] = loadImage("walk3.png");
 character.astroWalk[3] = loadImage("walk4.png");
 
 character.astroJump = loadImage("jump2.png");
 
  character.position= new PVector(100,250);
  character.velocity= new PVector(0,0);
  character.acceleration= new PVector(0,0.3);
  
}

void draw(){
  background(0);
  
  character.movement();
  level.ground();
  
  if(level.right == true){
   level.xax=level.xax-2;
  }
}

void keyPressed(){
  if(key=='d'){
 character.isWalking=true; 
 level.right=true;
  }
  
  if(key=='w'){
 character.jump(); 
  }
}

void keyReleased(){
 if(key=='d'){
 character.isWalking=false; 
 level.right=false;
 }
}
