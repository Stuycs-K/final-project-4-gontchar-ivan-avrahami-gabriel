class Field {
  Field() {
  }
  Scoreboard xyz = new Scoreboard("Blue", "Red");
  int strikes = 0;
  float innings = 1;
  int outs = 0;
  
  void makeField() {
    System.out.println("I AM AT HOME: " + atHome);
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

    if ((runsAway > runsHome && innings > 9 || (int)innings == innings && innings >= 10 && runsHome != runsAway)) {
      fill(0, 0, 0);
      textSize(80);
      if (runsHome > runsAway) {
        text(xyz.homeTeam+" beats "+xyz.awayTeam+" by a score of "+runsHome+"-"+runsAway, 200, 350);
      }
      else {
        text(xyz.awayTeam+" beats "+xyz.homeTeam+" by a score of "+runsAway+"-"+runsHome, 200, 350);
      }  
    }
  
    fielder.displayPlayer();
    batter.displayPlayer();
    pitcher.displayPlayer();
    for (int i = 0; i < runners.size(); i++) {
      if (runners.get(i).horizontal < 1300) {
        runners.get(i).displayPlayer();
        System.out.println(i+" hor: "+runners.get(i).horizontal+" ver: "+runners.get(i).vertical+" role: "+runners.get(i).role+" whichBase: "+runners.get(i).getWhichBase().num()+" nextBase: "+runners.get(i).nextBase.num());
      }
    }
    ball.displayBaseball();
    
    fielder.pickUpBall();
  
  
  
  
    if (keyboardInput.isPressed(Controller.END_GAME)) {
      innings = 9;
    }
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
      board.addEvent("foul");
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
      for (int i = 0; i < 12; i++) {
        fielder.throwBall();
      }
    }
    
    if (hasSwung) {
      System.out.println("SIZE: " + runners.size() +" "+runners.get(runners.size()-1).role+" "+ runners.get(runners.size()-1).keepRunning);
      for (int i = runners.size()-1; i >= 0; i--) {
        if (runners.get(i).horizontal < 1300) {
          currentTop = i;
          break;
        }
      }
      System.out.println("SIZE: " + runners.size() +" "+ runners.get(currentTop).role+" "+runners.get(currentTop).keepRunning);
      if (! runners.get(currentTop).keepRunning) {
        /*if (ballOnTime && ruling.num() == runners[numRunners].getWhichBase().num()) {
          runners[numRunners] = new Player("batterStanced.png", 2000, 2000+translate);
          board.addEvent("out");
          outs++;
        }
        else {*/
          board.addEvent("safe");
        //}
        strikes = 0;
        System.out.println("HI");
        board.genericSetup();
      }
      else {
 
        
      Player r = rPrev.getPlayer();
      
      if (! stopHit) {
        ball.move(0, Math.max(-10, -450 / yDistance));
      }
      System.out.println(runners.get(runners.size()-1).keepRunning+" "+runners.get(currentTop).keepRunning);
      System.out.println("home: "+home.getPlayer().role+" first: "+first.getPlayer().role+" second: "+second.getPlayer().role+"\n");
      //System.out.println(runners.get(runners.size()-1).role+" is size-1's role, this is its keepRunning: "+runners.get(runners.size()-1).keepRunning+"; h,1,2,3.getPlayer(): "+home.getPlayer().role+" "+home.getPlayer().vertical+" "+home.getPlayer().keepRunning+" "+first.getPlayer().role+" "+first.getPlayer().vertical+" "+first.getPlayer().keepRunning+" "+second.getPlayer().role+" "+second.getPlayer().vertical+" "+second.getPlayer().keepRunning+" "+third.getPlayer().role+" "+third.getPlayer().vertical+" "+third.getPlayer().keepRunning);
      third.getPlayer().runToBase();
      System.out.println("AT HOME 2: " + atHome);
      if (atHome) {
        if (homeBatting) {
          runsHome++;
        }
        else {
          runsAway++;
        }
        runners.set(scorer, new Player(runners.get(scorer).role, "batterStanced.png", 2000, 2000));
        third.addPlayer(pitcher);
        atHome = false;
        if (home.getPlayer().role.equals("pitcher") && first.getPlayer().role.equals("pitcher") && second.getPlayer().role.equals("pitcher") && third.getPlayer().role.equals("pitcher")) {
          board.genericSetup();
        }
      }
      second.getPlayer().runToBase();
      first.getPlayer().runToBase();
      home.getPlayer().runToBase();
    //board.getEvents();
    
      if (! r.role.equals("pitcher") && ballOnTime && r != ruling.getPlayer()) {
        System.out.println("hi, r: " + r.role + " rPrev: "+ rPrev.num() + " r.role: " + " ruling: " + ruling.num() + 
        " and ruling.getPlayer().role: " + ruling.getPlayer().role + " and ruling.getPlayer().getWhichBase(): " + ruling.getPlayer().getWhichBase().num());
        ballOnTime = false;
        rPrev.addPlayer(pitcher);
        int n = Integer.parseInt(r.role.substring(8,9));
        runners.set(n, new Player(runners.get(n).role, "batterStanced.png", 2000, 2000+translate));
        board.addEvent("out");
        strikes = 0;
        outs++;
        if (!home.getPlayer().keepRunning && !first.getPlayer().keepRunning && !second.getPlayer().keepRunning && !third.getPlayer().keepRunning) {
          board.genericSetup();
        }
      }
      
      }    
  
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
      runners = new ArrayList<Player>();
      board.genericSetup();
      textSize(100);
      fill(0, 0, 0);
      //text("SWITCHING BATTING TEAMS", 200, 500);
      //delay(5000);
      outs = 0;
      strikes = 0;
      homeBatting = !homeBatting;
      innings += 0.5;
    }
    
    xyz.display(strikes, outs, (int)innings);
    //System.out.println(xDistance + " " + yDistance);
  }
}
