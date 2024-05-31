class Field {
  Field() {
    String cat = "meow";
  }
  
  void makeField() {
    background(0,148,60,255);
    stroke(255, 255, 255);
    fill(21,212,53);
    arc(width / 2, 930 + translate, 1700, 1700, PI+QUARTER_PI, PI+PI-QUARTER_PI);
    fill(235,157,95,255);
    arc(width / 2, 865 + translate, 1000, 1000, PI+QUARTER_PI, PI+PI-QUARTER_PI);
    
    //fill(255);
    //rect(125,25,1200,75);
    //fill(21,212,53);
    ////green outer quad
    //quad(800,425+translate,1000,615+translate,800,825+translate,600,615+translate);
    //fill(237,247,87);
    ////yellow quad
    //quad(800,425+translate,975,600+translate,800,775+translate,625,600+translate);
    //fill(21,212,53);
    ////green inner quad
    //quad(800,450+translate,950,600+translate,800,750+translate,650,600+translate);
    //rotate(PI);
    //arc(-800,-425-translate,550,550,-QUARTER_PI,PI+QUARTER_PI,PIE);
    //rotate(-PI);
    stroke(255);
    strokeWeight(2);
    line(243,287+translate,800,847+translate);
    line(1357,287+translate,800,847+translate);
    line(1150,508+translate,1185,543+translate);
    line(450,507+translate,415,542+translate);

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
      pitcher.pitch(new Pitch("fastball"));
    }

    if (hasSwung && ! hasBall) {
      ball.move(-xDistance/4, Math.max(-5, -1000 / yDistance));
      batter.move(2,-2);
    }
    
    //board.getEvents();
  }
}
