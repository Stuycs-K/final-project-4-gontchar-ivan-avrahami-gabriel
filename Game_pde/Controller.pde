class Controller {
  static final int P1_LEFT = 0;
  static final int P1_RIGHT = 1;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[2];//2 valid buttons
  }

  /**@param code: a valid constant e.g. P1_LEFT
  */
  boolean isPressed(int code) {
    return inputs[code];
  }

  //you can bind any keys to different "actions" to different actual keys
  void press(int code) {
    if(code == 'A')
      inputs[P1_LEFT] = true;
    if(code == 'D')
      inputs[P1_RIGHT] = true;
  }
  void release(int code) {
    if(code == 'A')
    inputs[P1_LEFT] = false;
    if(code == 'D')
    inputs[P1_RIGHT] = false;
  }
}
