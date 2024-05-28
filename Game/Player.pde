class Player {
  PImage picture;
  int horizontal;
  int vertical;
  int heightPlayer = 100;
  int widthPlayer = 100;
  
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
  
  public void pitch(Pitch p){
    int right = 0;
    int speed = 10;
    if (p.getPitch() == "curveball") {
      //right = (int) (Math.random() * 5 - 3);
    }
    if (p.getPitch() == "fastball") {
      speed = 15;
    }
  
  }
}
