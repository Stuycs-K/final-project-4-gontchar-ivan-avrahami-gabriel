class Player {
  PImage picture;
  int horizontal;
  int vertical;
  int heightPlayer = 100;
  int widthPlayer = 100;

  public Player(String img, int hor, int ver) {
    picture = loadImage(img);
    picture.resize(50,0);
    horizontal = hor;
    vertical = ver;
  }

  public void displayPlayer() {
    image(picture, horizontal, vertical);
  }

  public void move(int rl, int du) {
    horizontal+=rl;
    vertical+=du;
  }

  public void throwBall(Base b) {
    if (hasBall) {
      b.location();
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
      if (xMouse > 700 && xMouse < 900 && yMouse > 625 + translate && yMouse < 825 + translate) {
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
}
