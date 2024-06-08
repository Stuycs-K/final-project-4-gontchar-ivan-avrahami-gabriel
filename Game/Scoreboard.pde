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
    System.out.println(events);
  }
  
  public void display(int strikes, int outs, int innings){
    textSize(30);
    fill(0, 0, 0);
    text("Inning: " + innings, 100, 765, 0);
    text("Strikes: " + strikes, 100, 800, 0);
    text("Outs: " + outs, 100, 835, 0);
    if(homeBatting){
      text("Team Batting: " + homeTeam, 100, 870, 0);
      text("Runs: " + runsHome, 100, 905, 0);
    }
    else{
      text("Team Batting: " + awayTeam, 100, 870, 0);
      text("Runs: " + runsAway, 100, 905, 0);
    }
  }
  
  public void genericSetup() {
    shouldPitch = false;
    hasSwung = false;
    canSwing = false;
    stopHit = false;
    throwBase = false;
    atHome = false;
    ballOnTime = false;
    fielder = new Player("fielder", "outFielderStanced.png", 775, 125+translate);
    batter = new Player("batter", "batterStanced.png", 730, 770+translate);
    pitcher = new Player("pitcher", "pitcherStanced.png", 775, 530+translate);
    ball = new Baseball(800,625);
    scorer = 10;
    ruling = new Base(10,2000,2000);
    rPrev = new Base(9,2000,2000);
    for (int i = 0; i < runners.length; i++) {
      runners[i].keepRunning = true;
    }
  }
}
