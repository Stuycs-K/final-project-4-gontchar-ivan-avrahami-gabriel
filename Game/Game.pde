import java.util.*;
Baseball ball;
Controller keyboardInput;
Player pitcher, batter, fielder;
ArrayList<Player> runners;
Base first, second, third, home, ruling, rPrev;
Scoreboard board = new Scoreboard("Home Team", "Away Team");
boolean shouldPitch, hasSwung, canSwing, stopHit, throwBase, ballOnTime, atHome;
int[] results, res;
int xDistance, yDistance;
int translate = 50;
int currentTop = 0;
Field ivan_lacks_neurons;
int scorer;
int runsHome = 0;
int runsAway = 0;
boolean homeBatting = true;

void setup(){
  size(1600,1000);
  runners = new ArrayList<Player>();
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
  if (mouseX < 250 && mouseY < 200+translate) {
    runners.get(currentTop).setShouldRun(true);
  }
  ivan_lacks_neurons.strikes += batter.swing(mouseX,mouseY);
}
