class Baseball {
  int xLoc;
  int yLoc;
  public Baseball(int x, int y) {
    xLoc = x;
    yLoc = y;
  }
  
  public void move(int hor, int ver) {
    image(loadImage("baseball.jpg"), xLoc + hor, yLoc + ver);
  }
  
}
