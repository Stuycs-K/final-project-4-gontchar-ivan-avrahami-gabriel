class Scoreboard {
  String home, away;
  ArrayList<String> events;
  public Scoreboard(String homeT, String awayT) {
    home = homeT;
    away = awayT;
    events = new ArrayList<String>();
  }
  
  public void addEvent(String event) {
    events.add(event);
  }
  
  public void getEvents() {
    System.out.println(events);
  }
}
