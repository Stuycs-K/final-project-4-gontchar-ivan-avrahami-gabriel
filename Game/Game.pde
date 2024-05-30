String homeTeam, awayTeam;
Scoreboard board;
Baseball ball;
Controller keyboardInput;
Player pitcher, batter, fielder;
Base first, second, third, home;
boolean hasSwung = false;
boolean hasBall = false;
boolean canSwing = false;
int xdistance, ydistance;
int translate = 50;

void setup(){
  size(1600,1000);
  // trying to load a batter
  fielder = new Player("batterExperimental.png", 775, 125+translate);
  batter = new Player("batSwung.jpg", 747, 700+translate);
  pitcher = new Player("batterExperimental.png", 775, 550+translate);
  first = new Base(1, 1000, 950);
  second = new Base(2, 800, 500);
  third = new Base(3, 600, 650);
  home = new Base(4, 800, 800);
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
