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
          
          whichBase.addPlayer(pitcher);
          nextBase.addPlayer(this);
          Base temp = which(nextBase);
          whichBase = nextBase;
          nextBase = temp;
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
