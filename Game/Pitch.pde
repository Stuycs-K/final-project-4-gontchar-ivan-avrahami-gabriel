class Pitch {
  int f;
  public Pitch(int speed) {
    f = speed;
  }
  
  public int down() {
    return 4*f;
  }
  
  public int right() {
    if (f == 2) {
      return 0;
    }
    return (int) (Math.random() * 5 - 3);
  }
}
