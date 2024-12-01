Character character;
Level[] level= new Level[22];

boolean right = false;

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
 
 character.astroJump = loadImage("jump2.png");
 
  character.position= new PVector(100,character.yPos);
  character.velocity= new PVector(0,0);
  character.acceleration= new PVector(0,0.3);
  
  for(int i=0; i<level.length; i++){
    level[i]=new Level(random(20,320), random(20,320), random(20,30), random(20,30));
  }
}

void draw(){
  background(0);
  
  character.movement();
  if(right == true){
    for(int i=0; i< level.length; i++){
   level[i].xPos=level[i].xPos-2;
    }
  }
  for(int i=0; i<level.length; i++){
   level[i].plat();
  }
  }

void keyPressed(){
  if(key=='d'){
 character.isWalking=true; 
 right=true;
  }
  
  if(key=='w'){
 character.jump(); 
  }
}

void keyReleased(){
 if(key=='d'){
 character.isWalking=false; 
 right=false;
 }
}
