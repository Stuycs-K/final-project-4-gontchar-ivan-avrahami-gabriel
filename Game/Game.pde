import java.util.*;
String homeTeam, awayTeam;
Scoreboard board;
Baseball ball;
Controller keyboardInput;
Player pitcher, batter, fielder;
Base first, second, third, home;
boolean hasSwung = false;
boolean canSwing = false;
boolean stopHit = false;
boolean throwBase = false;
int[] results, res;
int xDistance, yDistance;
int translate = 50;

void setup(){
  size(1600,1000);
  // trying to load a batter
  first = new Base(1, 1010, 565+translate);
  second = new Base(2, 790, 355+translate);
  third = new Base(3, 565, 565+translate);
  home = new Base(4, 790, 810+translate);
  fielder = new Player("batterExperimental.png", 775, 125+translate);
  batter = new Player("batterExperimental.png", 730, 770+translate);
  pitcher = new Player("batterExperimental.png", 775, 530+translate);
  ball = new Baseball(800,625);
  homeTeam = "Home Team";
  awayTeam = "Away Team";
  board = new Scoreboard(homeTeam, awayTeam);

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
  batter.swing(mouseX,mouseY);
}
