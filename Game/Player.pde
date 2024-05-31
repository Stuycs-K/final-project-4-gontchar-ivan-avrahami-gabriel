class Player {
  PImage picture;
  int horizontal;
  int vertical;
  boolean hasBall;
  int whichBase;

  public Player(String img, int hor, int ver) {
    picture = loadImage(img);
    picture.resize(50,0);
    horizontal = hor;
    vertical = ver;
    hasBall = false;
    whichBase = 1;
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
      ball.move(hor, ver);
    }
  }

  public void throwBall(Base b) {
    if (hasBall) {
      hasBall = false;
    }
  }

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
        batter.move(20,20);
        board.addEvent("in play");
        hasSwung = true;
        canSwing = false;
      }
      else {
        board.addEvent("strike");
      }
    }
  }
  
  public void pickUpBall() {
    if (! hasBall & Math.abs(ball.x() - (this.xCenter())) < 35 && Math.abs(ball.y() - (this.yCenter())) < 35) {
      hasBall = true;
    }
  }
  
  public void runToBase() {
    int xShift = 1;
    int yShift = 1;
    if (whichBase == 1 || whichBase == 2) {
      xShift = -1;
    }
    if (whichBase < 2) {
      yShift = -1;
    }
    move(2*xShift,2*yShift); 
  }
}
