/*
Ryan Chisholm
April 13th 2022
Computer Science Object Oriented Programming Assignment
Brick Breaker Game
Built using classes, superclasses, ArrayLists, and functions.
Has a main menu screen as well as an additional info menu, a restart button, quit button
and 3 different levels to play through, as well as a live scoreboard.
*/

int screen = 0;//start screen
int Level = 1;//starting level
PImage img,Extra,close,GameOver,NO,PlayAgain,YES,Winner,Restart,Back;//image imports
int score = 0;
int balls = 20;
int width = 640;
int height = 480;

class physics{//main physics and game engine 
  int sx,sy,x,y;//speedx,speedy  Ballx,Bally  Blockx,Blocky score
  physics(){
    this.x = 320;
    this.y = 420;
    this.sx = 0;//default x speed is zero
    this.sy = -5;//default y speed is negative five
  }
  void move(){//movement constructor
    this.x += this.sx;
    this.y += this.sy;
    if(this.x >= width - 10 || this.x <= 10) this.sx = -this.sx;
    else if(this.y <= 10) this.sy = -this.sy;
    else if(this.y >= 420){//when the ball returns down after hitting ball
      screen = 2;
      this.sy = -this.sy;//ensure it goes right direction at restart
      this.sx = 0;
      balls = balls - 1;//decrease number of remaining balls
    }
  }
  void collision(){//collision function for the blocks
    for(int i=0; i<Balls.size(); i++){
      for(int l=0; l<Blocks.size(); l++){
        if(Balls.get(i).x >= Blocks.get(l).x && Balls.get(i).x <= Blocks.get(l).x + 40){
          if(Balls.get(i).y >= Blocks.get(l).y && Balls.get(i).y <= Blocks.get(l).y + 40){
             Balls.get(i).sy = -Balls.get(i).sy;//bounce back
             Blocks.get(l).x = -100000;//remove block
             score = score + 1;//increase score
          }
        }
      }
    }
  }
  void endgame(){//endgame functions
    if(Level == 1){
      if(score == 24) screen = 5;//if destroyed all the blocks, go to win screen
      else if(balls == 0) screen = 6;//if run out of balls, go to game over screen
    }//because of increased number of blocks on the next levels the score to win is higher
    else if(Level == 2){
      if(score == 32) screen = 5;
      else if(balls == 0) screen = 6;
    }
    else if(Level == 3){
      if(score == 40) screen = 5;
      else if(balls == 0) screen = 6;
    }
  }
  void restart(){//restart function
    screen = 1;
    score = 0;
    this.x = 320;
    this.y = 420;
    balls = 15;
    for(int i=0; i<Blocks.size(); i++) Blocks.get(i).remove();//remove all the old blocks
    spawn();//spawn new blocks
  }
}

class blocks extends physics{//blocks class
  blocks(int a, int b){
     super();
     this.x = a;
     this.y = b;
  }
  void render(){
    rect(this.x,this.y,40,40);
  }
  void remove(){//remove function
    for(int i=0; i<Blocks.size(); i++) Blocks.get(i).x = -1000;
  }
}
  
class ball extends physics{//ball class
  ball(int a, int b){
    super();
    this.x = a;
    this.y = b;
  }
  void render(){
    ellipse(this.x,this.y,24,24);
  }
}

void aim(){//to show where player is aiming
/*the on screen graphic will show where the player is aiming based on what the
inputted x speed is
*/
  for(int i=0; i<Balls.size();i++){
    if(Balls.get(i).sx == 0){
      rect(317,356,5,60);
    }
    else if(Balls.get(i).sx < 0){
      if(Balls.get(i).sx == -1){
        pushMatrix();
        translate(317,375);
        rotate(radians(-10));
        rect(-8,-20,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == -2){
        pushMatrix();
        translate(317,375);
        rotate(radians(-25));
        rect(-19,-22,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == -3){
        pushMatrix();
        translate(317,375);
        rotate(radians(-35));
        rect(-26,-24,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == -4){
        pushMatrix();
        translate(317,375);
        rotate(radians(-43));
        rect(-30,-26,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == -5){
        pushMatrix();
        translate(317,375);
        rotate(radians(-49));
        rect(-35,-28,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == -6){
        pushMatrix();
        translate(317,375);
        rotate(radians(-54));
        rect(-40,-30,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == -7){
        pushMatrix();
        translate(317,375);
        rotate(radians(-60));
        rect(-45,-35,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == -9){
        pushMatrix();
        translate(317,375);
        rotate(radians(-65));
        rect(-45,-35,5,60);
        popMatrix();
      }
    }
    else if(Balls.get(i).sx > 0){
      if(Balls.get(i).sx == 1){
        pushMatrix();
        translate(317,375);
        rotate(radians(10));
        rect(8,-20,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == 2){
        pushMatrix();
        translate(317,375);
        rotate(radians(25));
        rect(19,-22,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == 3){
        pushMatrix();
        translate(317,375);
        rotate(radians(35));
        rect(26,-24,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == 4){
        pushMatrix();
        translate(317,375);
        rotate(radians(43));
        rect(30,-26,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == 5){
        pushMatrix();
        translate(317,375);
        rotate(radians(49));
        rect(35,-28,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == 6){
        pushMatrix();
        translate(317,375);
        rotate(radians(54));
        rect(40,-30,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == 7){
        pushMatrix();
        translate(317,375);
        rotate(radians(60));
        rect(40,-35,5,60);
        popMatrix();
      }
      else if(Balls.get(i).sx == 9){
        pushMatrix();
        translate(317,375);
        rotate(radians(65));
        rect(40,-35,5,60);
        popMatrix();
      }
    }
  }
}

ArrayList<ball> Balls = new ArrayList<ball>();
ArrayList<blocks> Blocks = new ArrayList<blocks>();

void spawn(){//spawns in the blocks
//while the spawn function brings in the blocks, it is only creating new blocks objects
//but blocks.get(i).render() is what actually makes the shapes appear on screen
  if(Level == 1){//block setup for level 1
    for(int i=0; i<8; i++){
      Blocks.add(new blocks(80+(i*60),120));
      Blocks.add(new blocks(80+(i*60),200));
      Blocks.add(new blocks(80+(i*60),280));
    }
  }
  else if(Level == 2){//the setup of blocks on level 2
    for(int i=0; i<8; i++){
      Blocks.add(new blocks(80+(i*60),60));
      Blocks.add(new blocks(80+(i*60),140));
      Blocks.add(new blocks(80+(i*60),220));
      Blocks.add(new blocks(80+(i*60),300));
      score = 0;
      balls = 16;
    }
  }
  else if(Level == 3){//the setup of blocks on level 3
    for(int i=0; i<10; i++){
      Blocks.add(new blocks(40+(i*60),80));
      Blocks.add(new blocks(40+(i*60),150));
      Blocks.add(new blocks(40+(i*60),230));
      Blocks.add(new blocks(40+(i*60),310));
      score = 0;
      balls = 16;
    }
  }
}
void setup(){
  size(640,480);
  //images 
  img = loadImage("BlockBreaker.jpeg");//main menu image
  Extra = loadImage("QuestionMark.jpg");
  close = loadImage("close.jpg");
  GameOver = loadImage("GameOver.jpg");
  NO = loadImage("NoButton.jpg");
  PlayAgain = loadImage("PlayAgain.jpg");
  YES = loadImage("YesButton.jpg");
  Winner = loadImage("Winner.jpg");
  Restart = loadImage("Restart.jpg");
  Back = loadImage("BackButton.jpg");
  //spawns in ball and blocks
  Balls.add(new ball(320,420));
  spawn();
}
void draw(){
  background(0);
  if(screen == 0){//main menu graphics
    background(0);
    image(img,0,0,640,480);
    image(Extra,40,0,40,40);
    image(close,0,0,40,40);
    textSize(30);
    text("PRESS ANYWHERE TO START",130,400);
    textSize(15);
    text("Version 1.0.0",535,475);
  }
  else if(screen == 1){//start menu
    background(0);
    image(img,-1000,-1000);
    image(Extra,40,0,40,40);
    image(close,0,0,40,40);
    image(Restart,80,0,40,40);
    textSize(30);
    text("PRESS UP BUTTON TO START",130,60);
    textSize(15);
    text("BRICK BREAKER",260,475);
    text("Version 1.0.0",535,475);
    textSize(20);
    text("Level " + Level,5,475);
    aim();
    for(int i=0; i<Blocks.size();i++) Blocks.get(i).render();
    for(int i=0; i<Balls.size(); i++) Balls.get(i).render();
  }
  else if(screen == 2){//stopped screen
    background(0);
    textSize(15);
    text("BRICK BREAKER",260,475);
    text("Version 1.0.0",535,475);
    textSize(20);
    text("SCORE: " + score,140,30);
    text("BALLS LEFT: " + balls,475,30);
    text("Level " + Level,5,475);
    image(Extra,40,0,40,40);
    image(close,0,0,40,40);
    image(Restart,80,0,40,40);
    aim();
    for(int i=0; i<Balls.size(); i++){//spawns blocks and balls
      for(int l=0; l<Blocks.size(); l++){
        Balls.get(i).render();
        Blocks.get(l).render();
        //return ball to starting spot
        Balls.get(i).x = 320;
        Balls.get(i).y = 420;
        Balls.get(i).endgame();
      }
    }
  }
  else if(screen == 3){//game screen
    textSize(15);
    text("BRICK BREAKER",260,475);
    text("Version 1.0.0",535,475);
    textSize(20);
    text("SCORE: " + score,140,30);
    text("BALLS LEFT: " + balls,475,30);
    text("Level " + Level,5,475);
    image(Extra,40,0,40,40);
    image(close,0,0,40,40);
    image(Restart,80,0,40,40);
    for(int i=0; i<Blocks.size(); i++) Blocks.get(i).render();
    for(int i=0; i<Balls.size(); i++){
      Balls.get(i).render();
      Balls.get(i).move();
      Balls.get(i).collision();
      Balls.get(i).endgame();
    }
  }
  else if(screen == 4){//additional info menu
    background(0);
    textSize(30);
    text("EXTRA'S",20,100);
    textSize(25);
    text("Additional Info",20,140);
    textSize(20);
    text("The objctive of the game is to hit all the blocks and complete",20,160);
    text("all the levels. There are some blocks that are not possible to",20,180);
    text("hit on their own, they must be bounced off of other blocks in",20,200);
    text("order to defeat them. This is a game of stratgey as well as a",20,220);
    text("game of precision. The number of balls is like the number of",20,240);
    text("lives remaining, the amount of balls left is the amount of",20,260);
    text("chances you have to destroy all the blocks. If you run out",20,280);
    text("of balls it's game over.",20,300);
    textSize(25);
    text("Creator Info",20,345);
    textSize(20);
    text("Created by: Ryan Chisholm",20,370);
    text("April of 2022",20,390);
    textSize(15);
    text("Version 1.0.0",5,470);
    image(close,0,0,40,40);
    image(Back,0,45,40,30);
  }
  else if(screen == 5){//victory screen
    if(Level != 3){//if the player beats any level other than level 3
      background(0);
      textSize(15);
      text("Version 1.0.0",535,475);
      textSize(40);
      text("Next Level ->",60,440);
      image(Winner,180,120,300,100);
      image(PlayAgain,200,260,240,50);
      image(NO,350,320,90,50);
      image(YES,180,320,90,50);
      image(close,0,0,40,40);
      image(Extra,40,0,40,40);
      image(Restart,80,0,40,40);
    }
    else if(Level == 3){//if the player beats level 3
      background(0);
      image(Winner,180,40,300,100);
      image(PlayAgain,200,260,240,50);
      image(NO,350,320,90,50);
      image(YES,180,320,90,50);
      image(close,0,0,40,40);
      image(Extra,40,0,40,40);
      image(Restart,80,0,40,40);
      textSize(15);
      text("Version 1.0.0",535,475);
      textSize(30);
      text("YOU BEAT THE ENTIRE GAME",100,180);
      text("CONGRATULATIONS",150,220);
    }
  }
  else if(screen == 6){//game over screen
    background(0);
    textSize(15);
    text("Version 1.0.0",535,475);
    image(GameOver,160,0,300,260);
    image(PlayAgain,200,260,240,50);
    image(NO,350,320,90,50);
    image(YES,180,320,90,50);
    image(close,0,0,40,40);
    image(Extra,40,0,40,40);
    image(Restart,80,0,40,40);
  }
}

void mousePressed(){
  if(screen == 0){//mouse click on main menu
    if(mouseX > 80 && mouseX < width && mouseY > 40 && mouseY < height){
      screen = 1;//starts game
    }
    else if(mouseX > 0 && mouseX < 40 && mouseY > 0 && mouseY < 40){
      exit();//close button
    }
    else if(mouseX > 40 && mouseX <= 80 && mouseY > 0 && mouseY < 40){
      screen = 4;//settings
    }
  }
  else if(screen == 1 || screen == 2){
    if(mouseX >= 0 && mouseX <= 40 && mouseY >= 0 && mouseY <= 40){
      exit();//close button
    }
    else if(mouseX > 40 && mouseX <= 80 && mouseY > 0 && mouseY < 40){
      screen = 5;//settings
    }
    else if(mouseX > 80 && mouseX < 120 && mouseY > 0 && mouseY < 40){
      for(int i=0; i<Balls.size(); i++) Balls.get(i).restart();//restart button
    }
  }
  if(screen == 3){
    if(mouseX >= 0 && mouseX <= 40 && mouseY >= 0 && mouseY <= 40){
      exit();
    }
    else if(mouseX > 40 && mouseX <= 80 && mouseY > 0 && mouseY < 40){
      screen = 4;
    }
    else if(mouseX > 80 && mouseX < 120 && mouseY > 0 && mouseY < 40){
      for(int i=0; i<Balls.size(); i++) Balls.get(i).restart();
    }
  }
  else if(screen == 4){//settings screen
    if(mouseX >= 0 && mouseX <= 40 && mouseY >= 0 && mouseY <= 40) exit();//close button
    else if(mouseX > 0 & mouseX <= 40 && mouseY >= 40 && mouseY < 80) screen = 2;//back button
  }
  else if (screen == 5){//victory screen
    if(mouseX > 60 && mouseX < 320 && mouseY > 400 && mouseY < 440){
      if(Level == 1){//if player beats level 1, proceed to level 2
        Level = 2;
        screen = 2;
        spawn();
      }
      else if(Level == 2){//if player beats level 2, proceed to level 3
        Level = 3;
        screen = 2;
        spawn();
      }
      else if(Level == 3){//if player beats level 3 and wants to start the whole game again
        Level = 1;
        screen = 2;
        //spawn();
       }
    }
    else if(mouseX >= 0 && mouseX <= 40 && mouseY >= 0 && mouseY <= 40){
      exit();
    }
    else if(mouseX > 40 && mouseX <= 80 && mouseY > 0 && mouseY < 40){
      screen = 4;
    }
    else if(mouseX > 350 && mouseX < 440 && mouseY > 320 && mouseY < 370){
      exit();
    }
    else if(mouseX > 80 && mouseX < 120 && mouseY > 0 && mouseY < 40){
      for(int i=0; i<Balls.size(); i++) Balls.get(i).restart();
    }
      else if(mouseX > 180 && mouseX < 270 && mouseY > 320 && mouseY < 370){
      for(int i=0; i<Balls.size(); i++) Balls.get(i).restart();
    }
  }
  else if(screen == 6){
    if(mouseX >= 0 && mouseX <= 40 && mouseY >= 0 && mouseY <= 40){
      exit();
    }
    else if(mouseX > 40 && mouseX <= 80 && mouseY > 0 && mouseY < 40){
      screen = 4;
    }
    else if(mouseX > 350 && mouseX < 440 && mouseY > 320 && mouseY < 370){
      exit();
    }
    else if(mouseX > 80 && mouseX < 120 && mouseY > 0 && mouseY < 40){
      for(int i=0; i<Balls.size(); i++) Balls.get(i).restart();
    }
      else if(mouseX > 180 && mouseX < 270 && mouseY > 320 && mouseY < 370){
      for(int i=0; i<Balls.size(); i++) Balls.get(i).restart();
    }
  }
}
void keyPressed(){
  if(screen == 2 || screen == 1){
    if(keyCode == LEFT){
      for(int i=0; i<Balls.size(); i++){
        Balls.get(i).sx = Balls.get(i).sx - 1;
        if(Balls.get(i).sx <= -8) Balls.get(i).sx = -9;
        else if(Balls.get(i).sx >= 8) Balls.get(i).sx = 7;
      }
    }
    else if(keyCode == RIGHT){
      for(int i=0; i<Balls.size(); i++){
        Balls.get(i).sx = Balls.get(i).sx + 1;
        if(Balls.get(i).sx >= 8) Balls.get(i).sx = 9;
        else if(Balls.get(i).sx <= -8) Balls.get(i).sx = -7;
      }
    }
    else if(keyCode == UP) screen = 3;
  }
}
