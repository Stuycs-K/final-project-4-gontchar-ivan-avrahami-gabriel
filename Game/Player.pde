class Player {
  PImage picture;
  int horizontal;
  int vertical;
  int heightPlayer = 100;
  int widthPlayer = 100;
  boolean hasBaseball = false;

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

  public boolean hasBall() {
    return hasBaseball;
  }

  public void throwBall(Base b) {
    b.location();
  }
  
  public void pitch(Pitch p) {
    int right = 0;
    int speed = 3;
    if (p.getPitch() == "curveball") {
      //right = (int) (Math.random() * 5 - 3);
    }
    if (p.getPitch() == "fastball") {
      speed = 5;
    }
    if (! hasSwung) {
      ball.move(right,speed);
    }      
  }
  public void swing(){
    picture = loadImage("batSwung.jpg");
    picture.resize(50,0);
    hasSwung = true;
  }
}
