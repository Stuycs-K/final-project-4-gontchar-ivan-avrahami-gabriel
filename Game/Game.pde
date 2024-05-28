String homeTeam;
String awayTeam;
Scoreboard board;
Baseball ball;
Controller keyboardInput;

void setup(){
  int translate = 50;
  size(1600, 1000);
  background(0);
  fill(255);
  rect(125,25,1200,75);
  fill(21,212,53);
  //green outer quad
  quad(800,425+translate,1000,615+translate,800,825+translate,600,615+translate);
  fill(237,247,87);
  //yellow quad
  quad(800,425+translate,975,600+translate,800,775+translate,625,600+translate);
  fill(21,212,53);
  //green inner quad
  quad(800,450+translate,950,600+translate,800,750+translate,650,600+translate);
  rotate(PI);
  arc(-800,-425-translate,550,550,-QUARTER_PI,PI+QUARTER_PI,PIE);
  rotate(-PI);
  stroke(255);
  strokeWeight(2);
  line(330,300+translate,800,776+translate);
  line(1270,300+translate,800,776+translate);
  line(800,425+translate,975,600+translate);
  line(800,425+translate,625,600+translate);
  
  
  keyboardInput = new Controller();
}

void draw(){
  //check if the button P1_LEFT is being pressed:
  if (keyboardInput.isPressed(Controller.P1_LEFT)) {
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
  }
}

void keyPressed() {
  //send the number of the key to your controller object
  keyboardInput.press(keyCode);
}

void keyReleased() {
  //send the number of the key to your controller object
  keyboardInput.release(keyCode);
}

void pitch(Pitch p){
  int right = 0;
  int speed = 10;
  if (p.getPitch() == "curveball") {
    //right = (int) (Math.random() * 5 - 3);
  }
  if (p.getPitch() == "fastball") {
    speed = 15;
  }
  
}
