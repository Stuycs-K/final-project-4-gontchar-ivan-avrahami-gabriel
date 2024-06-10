class Field {
  Field() {
  }
  Scoreboard xyz = new Scoreboard("Away", "Home");
  int strikes = 0;
  float innings = 1;
  int outs = 0;
  
  int speed = 0;
  
  void makeField() {
    System.out.println("I AM AT HOME: " + atHome);
    background(0,148,60,255);
    stroke(21, 212, 53);
    fill(21,212,53);
    arc(width / 2, 930 + translate, 1900, 1900, PI+QUARTER_PI, PI+PI-QUARTER_PI);
    fill(235,157,95,255);
    arc(width / 2, 865 + translate, 1025, 1100, PI+QUARTER_PI, PI+PI-QUARTER_PI);
    
  
    stroke(21,212,53);
    fill(21,212,53);
    //green inner quad
    quad(800,360+translate,1020,580+translate,800,800+translate,580,580+translate);
    
    stroke(255);
    strokeWeight(2);
    line(200,195+translate,800,847+translate);
    line(1400,195+translate,800,847+translate);
    
    stroke(235,157,95,255);
    fill(235,157,95,255);
    circle(800,825+translate,100);

    //drawing the bases
    fill(255, 255, 255);
    //home
    rect(width / 2 - 15, 805 + translate, 30, 30);
    //1st
    rect(1010, 560 + translate, 30, 30);
    ////2nd
    rect(785, 345 + translate, 30, 30);
    ////3rd
    rect(560, 565 + translate, 30, 30);

    if ((runsAway > runsHome && innings > 9 || (int)innings == innings && innings >= 10 && runsHome != runsAway)) {
      fill(0, 0, 0);
      textSize(47);
      if (runsHome > runsAway) {
        text(xyz.homeTeam+" beats "+xyz.awayTeam+" by a score of "+runsHome+"-"+runsAway, 25, 350);
      }
      else {
        text(xyz.awayTeam+" beats "+xyz.homeTeam+" by a score of "+runsAway+"-"+runsHome, 25, 350);
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
      outs = 2;
      strikes = 2;
    }
    //check if the button P1_LEFT is being pressed:
    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      //if(!(fielder.yCenter() >= )){
        fielder.move(-8,0);
      //}
    }
    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
      //if(!(fielder.yCenter() >= 560 && fielder.yCenter() <= 1000) || !(fielder.xCenter() >= 750)){
        fielder.move(8,0);
      //}
    }
    if (keyboardInput.isPressed(Controller.P1_UP)) {
      //if(){
        fielder.move(0,-8);
      //}
    }
    if (keyboardInput.isPressed(Controller.P1_DOWN)) {
      if(hasSwung || fielder.yCenter() < 530){
        fielder.move(0,8);
      }
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
      speed = (int)(Math.random()*2+1);
    }
    if (keyboardInput.isPressed(Controller.CURVE)) {
      shouldPitch = true;
      speed = 1;
    }
    if (keyboardInput.isPressed(Controller.FAST)) {
      shouldPitch = true;
      speed = 2;
    }
    
    if (shouldPitch) {
      pitcher.pitch(new Pitch(speed));
    }
    
    if(ball.x() < 0 && ball.y() > 200 || ball.x() > 1600 && ball.y() > 200){
      board.addEvent("foul");
      runners.remove(runners.size()-1);
      if (third.getPlayer().role != "pitcher") {
        third.getPlayer().horizontal = 562;
        third.getPlayer().vertical = 624;
      }
      if (second.getPlayer().role != "pitcher") {
        second.getPlayer().horizontal = 774;
        second.getPlayer().vertical = 416;
      }
       if (third.getPlayer().role != "pitcher") {
        first.getPlayer().horizontal = 992;
        first.getPlayer().vertical = 618;
      }
      if(strikes < 2){
        strikes++;
      }
      board.genericSetup();
    }
    
    if (ball.y() > 1200+translate) {
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
        System.out.println("FIRST: "+first.getPlayer().horizontal+" "+first.getPlayer().vertical);
        System.out.println("SECOND: "+second.getPlayer().horizontal+" "+second.getPlayer().vertical);
        System.out.println("THIRD: "+third.getPlayer().horizontal+" "+third.getPlayer().vertical);
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
        ball.move(-xDistance/8, Math.max(-10, -450 / yDistance));
      }
      System.out.println(runners.get(runners.size()-1).keepRunning+" "+runners.get(currentTop).keepRunning);
      System.out.println("home: "+home.getPlayer().role+" first: "+first.getPlayer().role+" second: "+second.getPlayer().role+" third: "+third.getPlayer().role+"\n");
      //System.out.println(runners.get(runners.size()-1).role+" is size-1's role, this is its keepRunning: "+runners.get(runners.size()-1).keepRunning+"; h,1,2,3.getPlayer(): "+home.getPlayer().role+" "+home.getPlayer().vertical+" "+home.getPlayer().keepRunning+" "+first.getPlayer().role+" "+first.getPlayer().vertical+" "+first.getPlayer().keepRunning+" "+second.getPlayer().role+" "+second.getPlayer().vertical+" "+second.getPlayer().keepRunning+" "+third.getPlayer().role+" "+third.getPlayer().vertical+" "+third.getPlayer().keepRunning);
      System.out.println("AT HOME 2: " + atHome);
      third.getPlayer().runToBase();
      System.out.println("AT HOME 3: " + atHome);
      if (atHome) {
        if (homeBatting) {
          runsHome++;
          board.addEvent("home scores");
        }
        else {
          runsAway++;
          board.addEvent("away scores");
        }
        runners.set(scorer, new Player(runners.get(scorer).role, "onBase.png", 2000, 2000));
        third.addPlayer(pitcher);
        atHome = false;
        if (home.getPlayer().role.equals("pitcher") && first.getPlayer().role.equals("pitcher") && second.getPlayer().role.equals("pitcher") && third.getPlayer().role.equals("pitcher")) {
          board.genericSetup();
        }
      }
      second.getPlayer().runToBase();
      first.getPlayer().runToBase();
      home.getPlayer().runToBase();
    
      if (! r.role.equals("pitcher") && ballOnTime && r != ruling.getPlayer()) {
        System.out.println("hi, r: " + r.role + " rPrev: "+ rPrev.num() + " r.role: " + " ruling: " + ruling.num() + 
        " and ruling.getPlayer().role: " + ruling.getPlayer().role + " and ruling.getPlayer().getWhichBase(): " + ruling.getPlayer().getWhichBase().num());
        ballOnTime = false;
        rPrev.addPlayer(pitcher);
        int n = Integer.parseInt(r.role.substring(8,9));
        runners.set(n, new Player(runners.get(n).role, "onBase.png", 2000, 2000+translate));
        board.addEvent("out at base " + ruling.num());
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
      home.addPlayer(pitcher);
      first.addPlayer(pitcher);
      second.addPlayer(pitcher);
      third.addPlayer(pitcher);
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
    board.getEvents();
    //System.out.println(xDistance + " " + yDistance);
  }
}
