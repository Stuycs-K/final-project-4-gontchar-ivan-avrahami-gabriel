class Baseball {
  int xLoc;
  int yLoc;
  PImage ball;
  //double speed = 0;
  public Baseball(int x, int y) {
    xLoc = x;
    yLoc = y;
    ball = loadImage("ball.png");
    ball.resize(30,0);
  }
  
  public void displayBaseball() {
    image(ball, xLoc, yLoc);    
  }
  
  public void move(int hor, int ver) {
    xLoc += hor;
    yLoc += ver;
    //speed = Math.sqrt(hor * hor + ver * ver);
  }
  
  public int x() {
    return xLoc;
  }
  
  public int y() {
    return yLoc;
  }
  
  
}
