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
  
  public void genericSetup() {
    shouldPitch = false;
    hasSwung = false;
    canSwing = false;
    stopHit = false;
    throwBase = false;
    ballOnTime = false;
    fielder = new Player("batterExperimental.png", 775, 125+translate);
    batter = new Player("batterExperimental.png", 730, 770+translate);
    pitcher = new Player("batterExperimental.png", 775, 530+translate);
    ball = new Baseball(800,625);
    ruling = new Base(10,2000,2000);
  }
}
