String homeTeam;
String awayTeam;
Scoreboard board;
Baseball ball;
Controller keyboardInput;
Player pitcher, batter, fielder;
Base first, second, third, home;
boolean hasSwung;

void setup(){
  size(1600,1000);
  // trying to load a batter
  fielder = new Player("batterExperimental.png", 600, 175);
  batter = new Player("batterExperimental.png", 800, 700);
  pitcher = new Player("batterExperimental.png", 800, 600);
  first = new Base(1, 1000, 950);
  second = new Base(2, 800, 500);
  third = new Base(3, 600, 650);
  home = new Base(4, 800, 800);
  ball = new Baseball(800,625);

  hasSwung = false;

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
