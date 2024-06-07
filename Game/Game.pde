Baseball ball;
Controller keyboardInput;
Player pitcher, batter, fielder;
Player[] runners;
Base first, second, third, home, ruling, rPrev;
Scoreboard board = new Scoreboard("Home Team", "Away Team");
boolean shouldPitch, hasSwung, canSwing, stopHit, throwBase, ballOnTime;
int[] results, res;
int xDistance, yDistance;
int translate = 50;
Field ivan_lacks_neurons;
int numRunners = 0;

void setup(){
  size(1600,1000);
  // trying to load a batter
  runners = new Player[4];
  for (int i = 0; i < runners.length; i++) {
    runners[i] = new Player("batterExperimental.png", 2000, 2000+translate);
  }
  first = new Base(1, 1010, 570+translate);
  second = new Base(2, 790, 355+translate);
  third = new Base(3, 565, 570+translate);
  home = new Base(4, 790, 810+translate);
  board.genericSetup();
  ivan_lacks_neurons = new Field();

  keyboardInput = new Controller();
}

void draw(){
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
  if (mouseX < 300 && mouseY < 150+translate) {
    System.out.println("hi");
    runners[numRunners].setShouldRun(true);
  }
  ivan_lacks_neurons.strikes += batter.swing(mouseX,mouseY);
}
