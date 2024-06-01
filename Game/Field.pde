class Field {
  Field() {
    String cat = "meow";
  }
  
  void makeField() {
    background(0,148,60,255);
    stroke(21, 212, 53);
    fill(21,212,53);
    arc(width / 2, 930 + translate, 1900, 1900, PI+QUARTER_PI, PI+PI-QUARTER_PI);
    fill(235,157,95,255);
    arc(width / 2, 865 + translate, 1025, 1100, PI+QUARTER_PI, PI+PI-QUARTER_PI);
    
    
    //fill(255);
    //rect(125,25,1200,75);
    //fill(21,212,53);
    ////green outer quad
    //quad(800,425+translate,1000,615+translate,800,825+translate,600,615+translate);
    //fill(237,247,87);
    ////yellow quad
    //quad(800,425+translate,975,600+translate,800,775+translate,625,600+translate);
    stroke(21,212,53);
    fill(21,212,53);
    //green inner quad
    quad(800,380+translate,1015,570+translate,800,800+translate,585,570+translate);
    //rotate(PI);
    //arc(-800,-425-translate,550,550,-QUARTER_PI,PI+QUARTER_PI,PIE);
    //rotate(-PI);
    
    stroke(255);
    strokeWeight(2);
    line(243,287+translate,800,847+translate);
    line(1357,287+translate,800,847+translate);
    line(1150,508+translate,1185,543+translate);
    line(450,507+translate,415,542+translate);
    
    stroke(235,157,95,255);
    fill(235,157,95,255);
    circle(800,825+translate,100);

    //drawing the bases
    fill(255, 255, 255);
    //home
    rect(width / 2 - 15, 810 + translate, 30, 30);
    //1st
    rect(1020, 555 + translate, 30, 30);
    ////2nd
    rect(785, 345 + translate, 30, 30);
    ////3rd
    rect(560, 555 + translate, 30, 30);
  
    fielder.displayPlayer();
    batter.displayPlayer();
    pitcher.displayPlayer();
    ball.displayBaseball();
    
    fielder.pickUpBall();
  
    //check if the button P1_LEFT is being pressed:
    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      fielder.move(-8,0);
    }
    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
      fielder.move(8,0);
    }
    if (keyboardInput.isPressed(Controller.P1_UP)) {
      fielder.move(0,-8);
    }
    if (keyboardInput.isPressed(Controller.P1_DOWN)) {
      fielder.move(0,8);
    }
    if (keyboardInput.isPressed(Controller.BASE_1)) {
      fielder.throwBall(first);
    }
    if (keyboardInput.isPressed(Controller.BASE_2)) {
      fielder.throwBall(second);
    }
    if (keyboardInput.isPressed(Controller.BASE_3)) {
      fielder.throwBall(third);
    }
    if (keyboardInput.isPressed(Controller.BASE_HOME)) {
      fielder.throwBall(home);
    }
    if (keyboardInput.isPressed(Controller.PITCH)) {
      pitcher.pitch(new Pitch("curveball"));
    }

    if (hasSwung) {
      if (! fielder.hasBall()) {
        ball.move(-xDistance/4, Math.max(-5, -250 / yDistance));
      }
      batter.runToBase();
    
    //board.getEvents();
    }
  }
}
