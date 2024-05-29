class Player {
  PImage picture;
  int horizontal;
  int vertical;
//<<<<<<< HEAD
  int heightPlayer = 150;
  int widthPlayer = 100;
  
//=======
  boolean hasSwung;
//>>>>>>> g-pitching
  public Player(String img, int hor, int ver) {
    picture = loadImage(img);
    horizontal = hor;
    vertical = ver;
    hasSwung = false;
    loader();
  }
  
  public void loader(){
    image(picture, horizontal, vertical, widthPlayer, heightPlayer);
  }
  
  public void move(int rl, int du) {
    horizontal+=rl;
    vertical+=du;
    loader();
    //image(picture, horizontal, vertical, heightPlayer, widthPlayer);
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
