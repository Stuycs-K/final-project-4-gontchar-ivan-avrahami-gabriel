class Base {
  int baseNum, xLoc, yLoc;
  public Base(int num, int x, int y) {
    baseNum = num;
    xLoc = x;
    yLoc = y;
  }
  
  public int[] toHere(int xStart, int yStart) {
    int xDist = xLoc - xStart;
    int yDist = yLoc - yStart;
    int g_c_f = gcf(xDist, yDist);
    return new int[]{xDist / gcf, yDist / gcf, gcf};
  }
  
  public int gcf(int a, int b) {
    int hi = max(a,b);
    int lo = min(a,b);
    
    while (lo > 0) {
      int temp = hi % lo;
      hi = lo;
      lo = temp;
    }
    
    return hi;
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
