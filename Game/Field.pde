class Field {
  Field() {
  }
  Scoreboard xyz = new Scoreboard("Blue", "Red");
  int strikes = 0;
  float innings = 1;
  int outs = 0;
  boolean homeBatting = true;
  
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
    quad(800,360+translate,1020,580+translate,800,800+translate,580,580+translate);
    //rotate(PI);
    //arc(-800,-425-translate,550,550,-QUARTER_PI,PI+QUARTER_PI,PIE);
    //rotate(-PI);
    
    stroke(255);
    strokeWeight(2);
    line(200,195+translate,800,847+translate);
    line(1400,195+translate,800,847+translate);
    //line(1150,508+translate,1185,543+translate);
    //line(450,507+translate,415,542+translate);
    
    stroke(235,157,95,255);
    fill(235,157,95,255);
    circle(800,825+translate,100);

    //drawing the bases
    fill(255, 255, 255);
    //home
    rect(width / 2 - 15, 810 + translate, 30, 30);
    //1st
    rect(1010, 555 + translate, 30, 30);
    ////2nd
    rect(785, 345 + translate, 30, 30);
    ////3rd
    rect(560, 555 + translate, 30, 30);
  
    fielder.displayPlayer();
    batter.displayPlayer();
    pitcher.displayPlayer();
    runner.displayPlayer();
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
    if (fielder.hasBall()) {
      if (keyboardInput.isPressed(Controller.BASE_1)) {
        results = first.toHere(ball.x(), ball.y());
        res = new int[]{Math.abs(results[0]), Math.abs(results[1])};
        throwBase = true;
        ruling = first;
      }
      if (keyboardInput.isPressed(Controller.BASE_2)) {
        results = second.toHere(ball.x(), ball.y());
        res = new int[]{Math.abs(results[0]), Math.abs(results[1])};
        throwBase = true;
        ruling = second;
      }
      if (keyboardInput.isPressed(Controller.BASE_3)) {
        results = third.toHere(ball.x(), ball.y());
        res = new int[]{Math.abs(results[0]), Math.abs(results[1])};
        throwBase = true;
        ruling = third;
      }
      if (keyboardInput.isPressed(Controller.BASE_HOME)) {
        results = home.toHere(ball.x(), ball.y());
        res = new int[]{Math.abs(results[0]), Math.abs(results[1])};
        throwBase = true;
        ruling = home;
      }
    }
    if (keyboardInput.isPressed(Controller.PITCH)) {
      shouldPitch = true;
    }
    
    if (shouldPitch) {
      pitcher.pitch(new Pitch("curveball"));
    }
    
    if(ball.x() < 0 && ball.y() > 200 || ball.x() > 1600 && ball.y() > 200){
      board.addEvent("strike");
      if(strikes < 2){
        strikes++;
      }
      board.genericSetup();
    }
    
    if (ball.y() > 1500+translate) {
      board.addEvent("strike");
      strikes++;
      board.genericSetup();
    }
    
    if (throwBase) {
      for (int i = 0; i < 10; i++) {
        fielder.throwBall();
      }
    }
    
    if (hasSwung) {
      if (! stopHit) {
        ball.move(-xDistance/6, Math.max(-5, -1000 / yDistance));
      }
      batter.runToBase();
    //board.getEvents();
    }
    
    if (! batter.getKeepRunning()) {
      if (ruling.num() == batter.getWhichBase().num() && ballOnTime) {
        board.addEvent("out");
        strikes = 0;
        outs++;
      }
      else {
        runner = batter;
        strikes = 0;
        board.addEvent("safe");
      }
      board.genericSetup();
    }
    
    if(strikes >= 3){
      textSize(100);
      fill(0, 0, 0);
      //text("3 STRIKES AND OUT", 400, 500);
      //delay(30000);
      strikes = 0;
      outs++;
    }
    
    if(outs >= 3){
      textSize(100);
      fill(0, 0, 0);
      //text("SWITCHING BATTING TEAMS", 200, 500);
      //delay(5000);
      outs = 0;
      strikes = 0;
      homeBatting = !homeBatting;
      innings += 0.5;
    }
    
    xyz.display(strikes, outs, homeBatting, (int)innings);
    //System.out.println(xDistance + " " + yDistance);
  }
}
