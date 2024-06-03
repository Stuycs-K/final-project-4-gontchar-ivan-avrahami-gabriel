Scoreboard board;
Baseball ball;
Controller keyboardInput;
Player pitcher, batter, fielder, runner;
Base first, second, third, home;
boolean shouldPitch, hasSwung, canSwing, stopHit, throwBase;
int[] results, res;
int xDistance, yDistance;
int translate = 50;

void setup(){
  size(1600,1000);
  // trying to load a batter
  runner = new Player("batterExperimental.png", 2000, 2000+translate);
  first = new Base(1, 1010, 565+translate);
  second = new Base(2, 790, 355+translate);
  third = new Base(3, 565, 565+translate);
  home = new Base(4, 790, 810+translate);
  board = new Scoreboard("Home Team", "Away Team");
  board.genericSetup();

  keyboardInput = new Controller();
}

void draw(){
  Field ivan_lacks_neurons = new Field();
  ivan_lacks_neurons.makeField();
}


void keyPressed() {
  //send the number of the key to your controller object
  keyboardInput.press(keyCode);
}

void keyReleased() {
  //send the number of the key to your controller object
  keyboardInput.release(keyCode);
}

void mouseClicked() {
  if (mouseX < 300 && mouseY > 400+translate) {
    batter.setShouldRun(true);
  }
  batter.swing(mouseX,mouseY);
}
