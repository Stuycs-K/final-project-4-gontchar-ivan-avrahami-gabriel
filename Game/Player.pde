class Player {
  PImage picture;
  int horizontal, vertical;
  boolean hasBall;
  Base whichBase, nextBase;
  boolean shouldRun, keepRunning;
  String role;

  public Player(String rol, String img, int hor, int ver) {
    picture = loadImage(img);
    if (rol.equals("fielder")) {
      picture.resize(0,70);
    }
    else if (rol.substring(0,2).equals("ru")) {
      picture.resize(0,50);
    }
    else {
      picture.resize(0,95);
    }
    role = rol;
    horizontal = hor;
    vertical = ver;
    hasBall = false;
    whichBase = home;
    nextBase = first;
    shouldRun = false;
    if (rol.equals("pitcher")) {
      keepRunning = false;
    }
    else {
      keepRunning = true;
    }  
    System.out.println(rol + " " + hor + " " + ver);
    System.out.println(rol + " " + (hor + picture.width) + " " + (ver + picture.width));
}

  public void displayPlayer() {
    image(picture, horizontal, vertical);
  }
  
  public int xCenter() {
    return horizontal + picture.width/2;
  }

  public int yCenter() {
    return vertical + picture.height/2;
  }
  
  public boolean hasBall() {
    return hasBall;
  }
 
  public void move(int hor, int ver) {
    horizontal += hor;
    vertical += ver;
    if (hasBall) {
      horizontal -= (hor/2);
      vertical -= (ver/2);
      ball.move(hor/2, ver/2);
    }
  }
  
  public void throwBall() {
    hasBall = false;
    int aNeg = 1;
    int bNeg = 1;
    if (results[0] < 0) {
      aNeg = -1;
    }
    if (results[1] < 0) {
      bNeg = -1;
    }
    int a = res[0];
    int b = res[1];
    if (a > 0 && b > 0) {
      double rand = (double) a / (a+b);
      if (a < b) {
        rand = (double) b / (a+b);
      }
      if (Math.random() < rand) {
        res[0]--;
        ball.move(aNeg, 0);
      }
      else {
        res[1]--;
        ball.move(0, bNeg);
      }
    }
    else if (a > 0) {
      res[0]--;
      ball.move(aNeg, 0);
    }
    else if (b > 0) {
      res[1]--;
      ball.move(0, bNeg);
    }
    else {
      throwBase = false;
      ballOnTime = true;
    }
  }
  /*public void throwBall(Base base) {
      if (hasBall) {
      hasBall = false;
      int[] results = base.toHere(ball.x(), ball.y());
      int aNeg = 1;
      int bNeg = 1;
      if (results[0] < 0) {
        aNeg = -1;
      }
      if (results[1] < 0) {
        bNeg = -1;
      }
      int a, b;
      for (int i = 0; i < results[2]; i++) {
        a = Math.abs(results[0]);
        b = Math.abs(results[1]);
        while (a > 0 && b > 0) {
          double rand = (double) a / (a+b);
          if (a > b) {
            rand = (double) b / (a+b);
          }
          if (Math.random() < rand) {
            a--;
            ball.move(aNeg, 0);
          }
          else {
            b--;
            ball.move(0, bNeg);
          }
        }
        while (a > 0) {
          a--;
          ball.move(aNeg, 0);
        }
        while (b > 0) {
          b--;
          ball.move(0, bNeg);
        }
      }
      //System.out.println(ball.x() + " " + ball.y() + " " + results[0] + " " + results[1] + " " + results[2]);
    }
  }*/

  public void pitch(Pitch p) {
    canSwing = true;
    if (! hasSwung) {
      ball.move(p.right(),p.down());
    }
  }

  public int swing(int xMouse, int yMouse){
    if (canSwing && ! hasSwung) {
      if (xMouse > 700 && xMouse < 900 && yMouse > 675 + translate && yMouse < 875 + translate) {
        xDistance = xMouse - ball.x();
        yDistance = Math.abs(yMouse - ball.y()) + 1;//in case it's 0
        runners.add(new Player("runners["+runners.size()+"]", "onBase.png", 730, 770+translate));
        runners.get(runners.size()-1).move(20,0);
        home.addPlayer(runners.get(runners.size()-1));
        board.addEvent("in play");
        hasSwung = true;
        canSwing = false;
      }
      else {
        board.addEvent("strike");
        ball = new Baseball(800, 625);
        canSwing = false;
        return 1;
      }
    }
    return 0;
  }
  
  public void pickUpBall() {
    if (! hasBall && Math.abs(ball.x() - this.xCenter()) < 35 && Math.abs(ball.y() - this.yCenter()) < 35) {
      hasBall = true;
      stopHit = true;
    }
  }
  
  public Base getWhichBase() {
    return whichBase;
  }

  /*public Base getNextBase() {
    return nextBase;
  }*/
  
  /*public void setWhichBase(int num) {
    if (num == 1) {
      whichBase = first;
      nextBase = second;
    }
    if (num == 2) {
      whichBase = second;
      nextBase = third;
    }
    if (num == 3) {
      whichBase = third;
      nextBase = home;
    }
    if (num == 4) {
      whichBase = home;
      nextBase = first;
    }
  }*/
  
  public void actuallyRun() {
    int xShift = 1;
    int yShift = 1;
    if (whichBase == first || whichBase == second) {
      xShift = -1;
    }
    if (whichBase == first || whichBase == home) {
      yShift = -1;
    }
    move(2*xShift,2*yShift);
  }
  
  public void runToBase() {
    //System.out.println(batter.getShouldRun() + " " + batter.xCenter() + " " + next.x() + " " + batter.yCenter() + " " + next.y());
    if (role != "pitcher" && (keepRunning || runners.get(currentTop).keepRunning)) {
    
      if (this.xCenter() < nextBase.x() + 25 && this.xCenter() > nextBase.x() - 15
      && this.yCenter() < nextBase.y() + 30 && this.yCenter() > nextBase.y() - 10) {
        
        if (nextBase.num() == 4) {
          atHome = true;
          scorer = Integer.parseInt(role.substring(8,9));
        }
        
        else {
          if (nextBase.num() == 1) {
            this.move(20,20);
          }
          else if (nextBase.num() == 2) {
            this.move(4,-4);
          }
          else {
            this.move(-14,-14);
          }
          
          //System.out.println("runToBase, whichBase: "+whichBase.num()+" keepRunning: "+keepRunning+" shouldRun: " + shouldRun);
          System.out.println(whichBase.num() + " Curr base's player: " + whichBase.getPlayer().vertical);
          System.out.println(nextBase.num() + " Next base's player: " + nextBase.getPlayer().vertical);
          whichBase.addPlayer(pitcher);
          nextBase.addPlayer(this);
          System.out.println(whichBase.num() + " Curr base's player: " + whichBase.getPlayer().vertical);
          System.out.println(nextBase.num() + " Next base's player: " + nextBase.getPlayer().vertical);
          Base temp = which(nextBase);
          whichBase = nextBase;
          nextBase = temp;
          System.out.println(whichBase.num() + " Curr base's player: " + whichBase.getPlayer().vertical);
          System.out.println(nextBase.num() + " Next base's player: " + nextBase.getPlayer().vertical);
          System.out.println(whichBase.num() + " Curr base's player: " + whichBase.getPlayer().vertical);
          System.out.println(nextBase.num() + " Next base's player: " + nextBase.getPlayer().vertical);
          keepRunning = shouldRun;
          shouldRun = false;
        }
      }
      else {
        this.actuallyRun();
      }
    }
  }
  
  public Base which(Base b) {
    if (b.num() == 1) {
      return second;
    }
    if (b.num() == 2) {
      return third;
    }
    if (b.num() == 3) {
      return home;
    }
    return first;
  }
  
  public void setShouldRun(boolean bool) {
    shouldRun = bool;
  }
}
