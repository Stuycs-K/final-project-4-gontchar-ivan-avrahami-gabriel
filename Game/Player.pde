class Player {
  PImage picture;
  int horizontal;
  int vertical;
  boolean hasSwung;
  public Player(String img, int hor, int ver) {
    picture = loadImage(img);
    horizontal = hor;
    vertical = ver;
    image(picture, horizontal, vertical);
    hasSwung = false;
  }
  
  public void move(int rl, int du) {
    image(picture, horizontal+rl, vertical+du);
  }
  
  public void pitch(Baseball b, Pitch p){
    int right = 0;
    int speed = 10;
    if (p.getPitch() == "curveball") {
      //right = (int) (Math.random() * 5 - 3);
    }
    if (p.getPitch() == "fastball") {
      speed = 15;
    }
    /* WILL CAUSE INFINITE LOOP. SHOULD BE ON MAIN SOMEHOW.
    while (! hasSwung) {
      b.move(right,speed);
    }*/
    b.move(right,speed);
  }
}
