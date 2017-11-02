char[][] tiles;

PImage background0, background1, background2;
PImage platform, coin, box, enemy, player, empty;
PImage [] playerCharacter;
int narutoCounter;
int tilesHigh, tilesWide;
float tileWidth, tileHeight;

//motion
float x, y;
float dx, dy;
boolean leftMotion, rightMotion, upwardMotion;

void setup() {
  size(640, 480); //4:3 in 480p, early 2000's DVD bois
  playerCharacter = new PImage[6];
  narutoCounter = 0;

  x = width/2;
  y = height/2;

  dx = 6;
  dy = 6;

  for (int i = 0; i <playerCharacter.length; i++) {
    playerCharacter[i] = loadImage("narutoCharacter" + i + ".gif");
  }
}

void draw() {
  background(255);
  moveCharacter();
  animateCharacter();
}

void keyPressed () {
  //sets the booleans for motion to true if the key is pressed
  //each key coresponds with a different direction
  if (key == 'd' || key == 'D') {
    rightMotion = true;
  } 
  if (key == 'a' || key == 'A') {
    leftMotion = true;
  }
  if (key == ' ') {
    upwardMotion = true;
  }
}

void keyReleased () {
  //sets the booleans for motion back to false if the key is released
  if (key == 'd' || key == 'D') {
    rightMotion = false;
  } 
  if (key == 'a' || key == 'A') {
    leftMotion = false;
  }
  if (key == ' ') {
    upwardMotion = false;
  }
}

void moveCharacter () {
  //each if statement states if that boolean == true then set the x or y to the earlier mentioned movement speed, creates character motion 
  if (rightMotion) {
    x += dx;
  }
  if (leftMotion) {
    x -= dx;
  }
  if (upwardMotion) {
    y -= dy;
  }
}

void animateCharacter() {
  imageMode(CENTER);

  image(playerCharacter[narutoCounter], x, y, 100, 100);
  if (frameCount % 2 == 0) {
    narutoCounter ++;
    narutoCounter = narutoCounter % playerCharacter.length;
  }
}

void loadImages() {
  //load backgrounds
  //background0 = loadImage(
  //background1 = loadImage(
  //background2 = loadImage(
}