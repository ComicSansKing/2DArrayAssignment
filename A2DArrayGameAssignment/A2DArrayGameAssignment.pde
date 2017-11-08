
//game tiles from https://opengameart.org/content/platformer-art-deluxehttps://opengameart.org/content/platformer-art-deluxe

char[][] tiles;

PImage background1, background2;
PImage grass, rasengan, spike;
PImage [] playerCharacter;
int characterX, characterY;

PImage [] background0;
int narutoCounter, backgroundCounter;
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

  loadArrays();
  setValues();
  tileSetup();
  loadImages();
}


void draw() {
  background(255);


  displayBackground();
  animateCharacter();
}

void loadArrays() {
  background0 = new PImage[28];
  playerCharacter = new PImage[6];
  narutoCounter = 0;
  backgroundCounter = 0;

  for (int i = 0; i <playerCharacter.length; i++) {
    playerCharacter[i] = loadImage("narutoCharacter" + i + ".gif");
  }

  for (int i = 0; i <background0.length; i++) {
    background0[i] = loadImage("level0/" + "level0Background" + i + ".png");
  }
}

void setValues() { 
  x = width/2;
  y = height/1.1;
  dx = 6;
  dy = 6;
}

void tileSetup() {
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
  }
}

void keyPressed () {
  //sets the booleans for motion to true if the key is pressed
  //each key coresponds with a different direction
  if (key == 'd' || key == 'D') {
    moveRight();
  } 
  if (key == 'a' || key == 'A') {
    moveLeft();
  }
  if (key == ' ') {
    upwardMotion = true;
  }
}

void moveRight() {
  if (characterX < tilesWide - 1) {
    tiles[characterX][characterY] = 0;
    characterX ++;
    tiles[characterX][characterY] = 1;
  }
}

void moveLeft() {
  if (characterX >= 1) {
    tiles[characterX][characterY] = 0;
    characterX--;
    tiles[characterX][characterY] = 1;
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

void displayBackground() {
  image(background0[backgroundCounter], width/2, height/2, width, height);
  for (int y = 0; y < tilesHigh; y++) {
    for (int x = 0; x < tilesWide; x++) {
      displayTile(tiles[x][y], x+0.5, y+0.5);
    }
  }
  if (frameCount %  3 == 0) {
    backgroundCounter ++;
    backgroundCounter = backgroundCounter % background0.length;
  }
}

void displayTile (char location, float x, float y) {
  if (location == '#') {
    image(grass, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'R') {
    image(rasengan, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'S') {
    image(spike, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'P') {
    //image(playerCharacter, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  }
}

void loadImages() {
  imageMode(CENTER);
  //load backgrounds
  //background0 = loadImage(
  //background1 = loadImage(
  //background2 = loadImage(

  //load tiles
  grass = loadImage("grass.png");
  spike = loadImage("spikes.png");
  rasengan = loadImage("Rasengan.png");
}