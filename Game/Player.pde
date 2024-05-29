class Player {
  PImage picture;
  int horizontal;
  int vertical;
  int heightPlayer = 100;
  int widthPlayer = 100;
  boolean hasBaseball = false;

  public Player(String img, int hor, int ver) {
    picture = loadImage(img);
    horizontal = hor;
    vertical = ver;
    image(picture, horizontal, vertical);
  }
  
  public void move(int rl, int du) {
    horizontal+=rl;
    vertical+=du;
    image(picture, horizontal, vertical);
  }
  
  public boolean hasBall() {
    return hasBaseball;
  }
  
  public void throw(Base b) {
    b.location();
  }
}
