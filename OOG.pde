Character character;
Level[] level= new Level[10];

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

  level[0] = new Level(300, 250, 100, 20);
  level[1] = new Level(500, 200, 100, 20);
  level[2] = new Level(700, 150, 80, 20);
  level[3] = new Level(1000, 220, 100, 20);
  level[4] = new Level(1200, 260, 100, 20);
}

void draw(){
  background(0);
  
  character.movement();
  if(right == true){
    for(int i=0; i< level.length; i++){
      if(level[i] !=null){
   level[i].xPos=level[i].xPos-2;
      }
    }
  }
 
  for(int i=0; i<level.length; i++){
    if(level[i] !=null){
   level[i].plat();
    }
  }
  stroke(255);
  line(0,290,5000,290);
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
