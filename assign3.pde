//You should implement your assign3 here.
final int GAME_START = 0;
final int GAME_PLAYING = 1;
final int GAME_OVER = 2;

int gameState;

PImage fighterImg;
PImage enemyImg;
PImage hpImg;
PImage treasureImg;
PImage bg1Img;
PImage bg2Img;
PImage start1Img;
PImage start2Img;

int bgA = 0;
int bgB = -640;
int hp = floor(random(196));
int treasureX = floor(random(600));
int treasureY = floor(random(450));
int fighterX = 580;
int fighterY = 210;

boolean upPressed=false;
boolean leftPressed=false;
boolean downPressed=false;
boolean rightPressed=false;

void setup () {
  size(640, 480) ;
  fighterImg = loadImage("img/fighter.png") ;
  enemyImg = loadImage("img/enemy.png") ;
  hpImg = loadImage("img/hp.png") ;
  treasureImg = loadImage("img/treasure.png") ;
  bg1Img = loadImage("img/bg1.png") ;
  bg2Img = loadImage("img/bg2.png") ;
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  
}

void draw() {
  image(start2Img,0,0);
  switch(gameState){
    case GAME_START:
      if(mouseX>=200&&mouseX<=450&&mouseY>=380&&mouseY<=420){
        image(start1Img,0,0);
        if(mousePressed){
          gameState=GAME_PLAYING;
        }
      }
    break;
    case GAME_PLAYING:
      image(bg1Img,bgA,0);
      bgA = bgA + 1 ;
      if( bgA == 640) {
        bgA = bgA * -1 ;
      }
      image(bg2Img,bgB,0);
      bgB = bgB + 1 ;
      if( bgB == 640) {
      bgB = bgB * -1 ;
      } 
      //HP
      fill(#FF0000);
      rect(20,12,hp,20);
      image(hpImg,10,10);
      //Treasure
      image(treasureImg,treasureX,treasureY);
      //Fighter
      image(fighterImg,fighterX,fighterY);
      //Enemy
      PImage[] enemys = new PImage[5];
      boolean isGameOver = false;       
        while(! isGameOver){       
          for(int i =0 ; i < 5 ; i++){
          int y = floor(random(415));          
          image(enemys[i],enemys[i].x+100,random);
          if(enemys[i].x > screenWidth+enemys[i].width){
          image(enemys[i],0-enemys[i].width,y);
          }
        }
      }
              
    break;
  }
}
