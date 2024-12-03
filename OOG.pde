import processing.sound.*;
SoundFile bgm;
SoundFile jump;
SoundFile win;
SoundFile death;
SoundFile core;
float light=0;
float light2=0;
Character character;
Level[] level= new Level[10];
Spikes[] spikes= new Spikes[100];

PImage space;
PImage failed;
PImage success;
PImage proceed;
PImage portal[];
int portalFrame;

float portalX;
float portalY;

boolean right = false;
float accel = 0.3;

 float triangleWidth = 20;
 float triangleHeight = 30;

  int gameOver=0;
  int gameWon=0;
  int reset=0;
  int resetWin=0;

void setup(){
 size(400,400);
 
 bgm=new SoundFile(this, "spaceTheme.wav");
 jump=new SoundFile(this, "jump.wav");
 win=new SoundFile(this, "win.wav");
 death=new SoundFile(this, "death.wav");
 core=new SoundFile(this, "core.wav");
 rectMode(CENTER);
 imageMode(CENTER);
 character= new Character();
 character.astro=loadImage("still.png");
 space=loadImage("space.jpg");
 
 failed=loadImage("failed.png");
 success=loadImage("success.png");
 proceed=loadImage("proceed.png");
 
 character.astroWalk = new PImage[4];
 character.astroWalk[0] = loadImage("walk1.png");
 character.astroWalk[1] = loadImage("walk2.png");
 character.astroWalk[2] = loadImage("walk3.png");
 character.astroWalk[3] = loadImage("walk4.png");
 
 character.astroJump = loadImage("jump2.png");
 
 portal=new PImage[4];
for(int i=0; i<portal.length; i++){
 portal[i]= loadImage("port"+(i+1)+".png");
}
 
 
 
  character.position= new PVector(100,character.yPos);
  character.velocity= new PVector(0,0);
  character.acceleration= new PVector(0,accel);

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
  
  for(int i=0; i<spikes.length; i++){
   spikes[i]=new Spikes(300+i*20, height - 70); 
  }
  restartGame();
}


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
    if(!bgm.isPlaying()){
    bgm.loop();
    }
}

void draw(){
  portalX=level[9].xPos;
  portalY=level[9].yPos;
  
  if (gameOver == 1) {
    death.play();
        background(0);
        image(failed,200,200,290,30);
        image(proceed,200,300,290,30);
        noLoop();
        return;
  }
  
  if (gameWon == 1) {
    win.play();
        background(0);
        image(success,200,200,290,30);
        image(proceed,200,300,290,30);
        noLoop();
        return;
  }
  stroke(255);
  background(164,125,99);
  noStroke();
  image(space,200,165,600,330);
  light=(random(10,250));
  light2=(random(140,250));
  
  image(portal[portalFrame],portalX+50,portalY-60, 100,100);
  
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
  
  if(character.position.x>200 && character.position.x<201){
   if(!core.isPlaying()){   
    core.play();
  }
}
  stroke(255);
  line(0,330,3000,330);
  
  if (character.position.x > 127 && character.position.y >= 280) {
        gameOver = 1;
  }
  
  if (character.position.x > 328 && character.position.y < 280) {
        gameWon = 1;
  }
  
  if(frameCount % 12==0){
   portalFrame=(portalFrame+1)%portal.length;
  }
  
  }

void keyPressed(){
  if(key=='d'){
 character.isWalking=true; 
 right=true;
  }
  
  if(key=='w'){
 character.jump(); 
 if(!jump.isPlaying()){
 jump.play();
  jump.amp(2.0);
  }
  }
  
  if(key=='o' && gameOver==1){
   restartGame(); 
  }
  
   if(key=='o' && gameWon==1){
   restartGame(); 
  }
}

void keyReleased(){
 if(key=='d'){
 character.isWalking=false; 
 right=false;
 }
}
