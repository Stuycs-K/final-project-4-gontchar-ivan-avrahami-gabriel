class Base {
  int baseNum, xLoc, yLoc;
  public Base(int num, int x, int y) {
    baseNum = num;
    xLoc = x;
    yLoc = y;
  }
  
  public int num() {
    return baseNum;
  }
  
  public int[] toHere(int xStart, int yStart) {
    int xDist = xLoc - xStart;
    int yDist = yLoc - yStart;
    //int g_c_f = gcf(Math.abs(xDist), Math.abs(yDist));
    //System.out.println(xDist + " " + yDist + " " + g_c_f);
    //return new int[]{xDist / g_c_f, yDist / g_c_f, g_c_f};
    return new int[]{xDist, yDist};
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
  
  //public int onBase(Player person){
    //if(person.xCenter() >= 0 && person.xCenter() <= 0){
    //}
    //return baseNum;
  //}
}
