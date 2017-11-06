
//game tiles from https://opengameart.org/content/platformer-art-deluxehttps://opengameart.org/content/platformer-art-deluxe

char[][] tiles;

PImage background0, background1, background2;
PImage grass, coin, spike;
PImage [] playerCharacter;
int narutoCounter;
int tilesHigh, tilesWide;
float tileWidth, tileHeight;
String lines[];
String backgroundLoader, levelLoader;


//motion
float x, y;
float dx, dy;
boolean leftMotion, rightMotion, upwardMotion;

void setup() {
  size(640, 480); //4:3 in 480p, early 2000's DVD bois
  levelLoader = "levels/0.txt";
  backgroundLoader = "level0Background.gif";

  background0 = 
  playerCharacter = new PImage[6];
  narutoCounter = 0;

  x = width/2;
  y = height/1.1;

  dx = 6;
  dy = 6;

  lines = loadStrings(levelLoader);

  tilesHigh = lines.length;
  tilesWide = lines[0].length();

  tileHeight = height/tilesHigh;
  tileWidth = width/tilesWide;

  tiles = new char[tilesWide][tilesHigh];

  for (int y = 0; y < tilesHigh; y++) {
    for (int x = 0; x < tilesWide; x++) {
      char typeOfTile = lines[y].charAt(x);
      tiles[x][y] = typeOfTile;
    }

    loadImages();
  }


  for (int i = 0; i <playerCharacter.length; i++) {
    playerCharacter[i] = loadImage("narutoCharacter" + i + ".gif");
  }
}

void draw() {
  background(255);
  moveCharacter();

  display();
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

  image(playerCharacter[narutoCounter], x, y, 90, 90);
  if (frameCount % 2 == 0) {
    narutoCounter ++;
    narutoCounter = narutoCounter % playerCharacter.length;
  }
}

void display() {
  image(background0, width/2, height/2, width, height);
  for (int y = 0; y < tilesHigh; y++) {
    for (int x = 0; x < tilesWide; x++) {
      displayTile(tiles[x][y], x+0.5, y+0.5);
    }
  }
}

void displayTile (char location, float x, float y) {
  if (location == '#') {
    image(grass, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'C') {
    image(coin, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'S') {
    image(spike, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  }
}

void loadImages() {
  imageMode(CENTER);
  background0 = loadImage(backgroundLoader);
  //load backgrounds
  //background0 = loadImage(
  //background1 = loadImage(
  //background2 = loadImage(

  //load tiles
  grass = loadImage("grass.png");
  spike = loadImage("spikes.png");
  coin = loadImage("coinBronze.png");
}