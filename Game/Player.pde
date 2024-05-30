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
  
  public void swing(int x, int y){
    if (canSwing && ! hasSwung) {
      if (x > 700 && x < 900 && y > 675 + translate && y < 775 + translate) {
        int xdistance = x - ball.x();
        int ydistance = Math.abs(y - ball.y());
        ball.move(2 * xdistance, -5 * ydistance);
        board.add("in play");
      }
      else {
        board.add("strike");
      }
      hasSwung = true;
      canSwing = false;
    }
  }
}
