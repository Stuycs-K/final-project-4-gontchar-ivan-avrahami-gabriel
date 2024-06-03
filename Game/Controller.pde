class Controller {
  static final int P1_LEFT = 0;
  static final int P1_RIGHT = 1;
  static final int P1_UP = 2;
  static final int P1_DOWN = 3;
  static final int BASE_1 = 4;
  static final int BASE_2 = 5;
  static final int BASE_3 = 6;
  static final int BASE_HOME = 7;
  static final int PITCH_SPEED = 8;
  static final int PITCH = 9;
  
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[10];//10 valid buttons
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
    if(code == 'W')
      inputs[P1_UP] = true;
    if(code == 'S')
      inputs[P1_DOWN] = true;
    if(code == '1')
      inputs[BASE_1] = true;
    if(code == '2')
      inputs[BASE_2] = true;
    if(code == '3')
      inputs[BASE_3] = true;
    if(code == '4')
      inputs[BASE_HOME] = true;
    if(code == ' ')
      inputs[PITCH_SPEED] = true;
    if(code == 'P')
      inputs[PITCH] = true;
  }
  void release(int code) {
    if(code == 'A')
      inputs[P1_LEFT] = false;
    if(code == 'D')
      inputs[P1_RIGHT] = false;
    if(code == 'W')
      inputs[P1_UP] = false;
    if(code == 'S')
      inputs[P1_DOWN] = false;
    if(code == '1')
      inputs[BASE_1] = false;
    if(code == '2')
      inputs[BASE_2] = false;
    if(code == '3')
      inputs[BASE_3] = false;
    if(code == '4')
      inputs[BASE_HOME] = false;
    if(code == ' ')
      inputs[PITCH_SPEED] = false;
    if(code == 'P')
      inputs[PITCH] = false;
  }
}
