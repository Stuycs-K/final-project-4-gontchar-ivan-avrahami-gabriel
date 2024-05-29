class Baseball {
  int xLoc;
  int yLoc;
  public Baseball(int x, int y) {
    xLoc = x;
    yLoc = y;
  }
  
  public void displayBaseball() {
    PImage ball = loadImage("ball.png");
    ball.resize(30,0);
    image(ball, xLoc, yLoc);    
  }
  
  public void move(int hor, int ver) {
    xLoc += hor;
    yLoc += ver;
  }
  
}
