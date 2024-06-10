class Scoreboard {
  String homeTeam, awayTeam;
  ArrayList<String> events;
  public Scoreboard(String homeT, String awayT) {
    homeTeam = homeT;
    awayTeam = awayT;
    events = new ArrayList<String>();
  }
  
  public void addEvent(String event) {
    events.add(event);
  }
  
  public void getEvents() {
    fill(0,0,0);
    int k = 0;
    for (int i = events.size()-1; i >= 0; i--) {
      if (k < 5) {
        text(events.get(i), 1300, 695 + 30 * k);
        k++;
      } 
    }
  }
  
  public void display(int strikes, int outs, int innings){
    fill(0, 0, 0);
    stroke(255, 255, 255);
    strokeWeight(10);
    rect(0, 700, 500, 500);
    PFont font = createFont("retro.ttf", 24);
    textFont(font);
    textSize(28);
    fill(255, 255, 255);
    text(homeTeam + ":" + runsHome, 17, 790, 0);
    text(awayTeam + ":" + runsAway, 17, 835, 0);
    text("Inning:" + innings, 17, 880, 0);
    text("Strikes:" + strikes, 17, 925, 0);
    text("Outs:" + outs, 17, 975, 0);
    if(homeBatting){
      text("Team Batting:" + homeTeam, 17, 745, 0);
    }
    else{
      text("Team Batting:" + awayTeam, 17, 745, 0);
    }
  }
  
  public void genericSetup() {
    shouldPitch = false;
    hasSwung = false;
    canSwing = false;
    stopHit = false;
    throwBase = false;
    ballOnTime = false;
    atHome = false;
    fielder = new Player("fielder", "outFielderStanced.png", 775, 125+translate);
    batter = new Player("batter", "batterStanced.png", 730, 770+translate);
    pitcher = new Player("pitcher", "pitcherStanced.png", 775, 530+translate);
    ball = new Baseball(800,625);
    scorer = 10;
    ruling = new Base(10,2000,2000);
    rPrev = new Base(9,2000,2000);
    for (int i = 0; i < runners.size(); i++) {
      runners.get(i).keepRunning = true;
    }
  }
}
