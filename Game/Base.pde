class Base {
  int baseNum, xLoc, yLoc;
  public Base(int num, int x, int y) {
    baseNum = num;
    xLoc = x;
    yLoc = y;
  }
  
  public PVector toHere(int xStart, int yStart) {  
    return new PVector();
  }
  
  public int x() {
    return xLoc;
  }
  public int y(){
    return yLoc;
  }
  
  public int onBase(Player person){
    //if(person.xCenter() >= 0 && person.xCenter() <= 0){
    //}
    return baseNum;
  }
}
