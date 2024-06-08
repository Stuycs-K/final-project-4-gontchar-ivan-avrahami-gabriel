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
    rect(1010, 560 + translate, 30, 30);
    ////2nd
    rect(785, 345 + translate, 30, 30);
    ////3rd
    rect(560, 560 + translate, 30, 30);
  
    fielder.displayPlayer();
    batter.displayPlayer();
    pitcher.displayPlayer();
    for (int i = 0; i < runners.length; i++) {
      runners[i].displayPlayer();
    }
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
        rPrev = home;
      }
      if (keyboardInput.isPressed(Controller.BASE_2)) {
        results = second.toHere(ball.x(), ball.y());
        res = new int[]{Math.abs(results[0]), Math.abs(results[1])};
        throwBase = true;
        ruling = second;
        rPrev = first;
      }
      if (keyboardInput.isPressed(Controller.BASE_3)) {
        results = third.toHere(ball.x(), ball.y());
        res = new int[]{Math.abs(results[0]), Math.abs(results[1])};
        throwBase = true;
        ruling = third;
        rPrev = second;
      }
      if (keyboardInput.isPressed(Controller.BASE_HOME)) {
        results = home.toHere(ball.x(), ball.y());
        res = new int[]{Math.abs(results[0]), Math.abs(results[1])};
        throwBase = true;
        ruling = home;
        rPrev = third;
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
      
      Player r = rPrev.getPlayer();
      int n = 0;
      if (r == runners[0]) {
        n = 0;
      }
      if (r == runners[1]) {
        n = 1;
      }
      if (r == runners[2]) {
        n = 2;
      }
      if (r == runners[3]) {
        n = 3;
      }
      
      if (! stopHit) {
        ball.move(0, Math.max(-10, -450 / yDistance));
      }
      System.out.println("numRunners: "+numRunners+"; h,1,2,3,4.getPlayer(): " + home.getPlayer().role+" "+first.getPlayer().role+" "+second.getPlayer().role+" "+third.getPlayer().role);
      third.getPlayer().runToBase();
      second.getPlayer().runToBase();
      first.getPlayer().runToBase();
      home.getPlayer().runToBase();
    //board.getEvents();
    }
    
    if (! r.role.equals("pitcher") && ballOnTime) {
      System.out.println("hi, ruling: " + ruling.num() + " and numRunners: " + numRunners + 
      " and ruling.getPlayer().role: " + ruling.getPlayer().role + " and ruling.getPlayer().getWhichBase(): " + ruling.getPlayer().getWhichBase().num());
      ballOnTime = false;
      rPrev.addPlayer(pitcher);
      for (int i = n; i < numRunners; i++) {
        runners[i] = runners[i+1];
        int num = runners[i+1].getWhichBase().num();
        if (num == 1) {
          first.addPlayer(runners[i]);
          System.out.println("FIRST BASE RUNNERS " + i);
        }
        if (num == 2) {
          second.addPlayer(runners[i]);
          System.out.println("SECOND BASE RUNNERS " + i);
        }   
        if (num == 3) {
          third.addPlayer(runners[i]);
          System.out.println("THIRD BASE RUNNERS " + i);
        }
      }
      runners[numRunners] = new Player("runners"+numRunners, "batterStanced.png", 2000, 2000+translate);
      board.addEvent("out");
      outs++;
      strikes = 0;
      board.genericSetup();
    }
    
    if (! runners[numRunners].getKeepRunning()) {
      /*if (ballOnTime && ruling.num() == runners[numRunners].getWhichBase().num()) {
        runners[numRunners] = new Player("batterStanced.png", 2000, 2000+translate);
        board.addEvent("out");
        outs++;
      }
      else {*/
        board.addEvent("safe");
        numRunners++;
      //}
      strikes = 0;
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
      for (int i = 0; i < runners.length; i++) {
        runners[i] = new Player("runners:"+i, "batterExperimental.png", 2000, 2000+translate);
      }
    }
    
    xyz.display(strikes, outs, homeBatting, (int)innings, 0);
    //System.out.println(xDistance + " " + yDistance);
  }
}
