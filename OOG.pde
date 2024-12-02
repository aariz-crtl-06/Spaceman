float light=0;
Character character;
Level[] level= new Level[10];
Spikes[] spikes= new Spikes[100];

boolean right = false;
float accel = 0.3;

 float triangleWidth = 20;
 float triangleHeight = 30;

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
  character.acceleration= new PVector(0,accel);

  level[0] = new Level(320, 260);
  level[1] = new Level(500, 200);
  level[2] = new Level(650, 150);
  level[3] = new Level(850, 120);
  level[4] = new Level(1050, 200);
  level[5] = new Level(1250, 270);
  
  for(int i=0; i<spikes.length; i++){
   spikes[i]=new Spikes(300+i*20, height - 70); 
  }
}

void draw(){
  background(0);
  light=(random(10,250));
  
  character.movement();
  
  if(right == true){
    for(int i=0; i< level.length; i++){
      if(level[i] !=null){
   level[i].xPos=level[i].xPos-2;
      }
    }
    
    for(int i=0; i< spikes.length; i++){
      if(spikes[i] !=null){
   spikes[i].xPos=spikes[i].xPos-2;
      }
    }
  }
  for(int i=0; i<spikes.length; i++){
   spikes[i].tri(); 
  }
 
  for(int i=0; i<level.length; i++){
    if(level[i] !=null){
   level[i].plat();
    }
  }
  stroke(255);
  line(0,330,3000,330);
  

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
