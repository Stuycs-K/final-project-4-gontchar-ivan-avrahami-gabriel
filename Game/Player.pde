class Player {
  PImage picture;
  int horizontal, vertical;
  boolean hasBall;
  Base whichBase, nextBase;
  boolean shouldRun, keepRunning;

  public Player(String img, int hor, int ver) {
    picture = loadImage(img);
    picture.resize(50,0);
    horizontal = hor;
    vertical = ver;
    hasBall = false;
    whichBase = home;
    nextBase = first;
    shouldRun = false;
    keepRunning = true;
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
      int right = 0;
      int speed = 3;
      if (p.getPitch() == "curveball") {
        right = (int) (Math.random() * 5 - 3);
      }
      if (p.getPitch() == "fastball") {
        speed = 6;
      }
      ball.move(right,speed);
    }
  }

  public void swing(int xMouse, int yMouse){
    if (canSwing && ! hasSwung) {
      if (xMouse > 700 && xMouse < 900 && yMouse > 675 + translate && yMouse < 875 + translate) {
        xDistance = xMouse - ball.x();
        yDistance = Math.abs(yMouse - ball.y()) + 1;//in case it's 0
        runners[whoseTurn] = batter;
        runners[whoseTurn].move(20,20);
        board.addEvent("in play");
        hasSwung = true;
      }
      else {
        board.addEvent("strike");
        ball = new Baseball(800, 625);
      }
      canSwing = false;
    }
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
  }
  
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
    if (keepRunning) {
    
      if (this.xCenter() < nextBase.x() + 20 && this.xCenter() > nextBase.x() - 20
      && this.yCenter() < nextBase.y() + 40 && this.yCenter() > nextBase.y()) {
      
        whichBase = nextBase;
        keepRunning = shouldRun;
        shouldRun = false;
        
      }
      else {
        this.actuallyRun();
      }
    }
  }
  
  public void setShouldRun(boolean bool) {
    shouldRun = bool;
  }
  
  public boolean getKeepRunning() {
    return keepRunning;
  }
}
