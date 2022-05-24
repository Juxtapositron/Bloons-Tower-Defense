public class Bloon {

  private int hp;
  private float x, y;
  private float velocity;
  private PImage bloon;

  // if given hp > 6, sets it to 5.

  // also has skeleton code for what to do for image of different
  // bloons (based on hp)
  public Bloon(int _hp, float _x, float _y) {

    if (_hp > 6)
      hp = 5;

    hp = _hp;
    x = _x;
    y = _y;
    velocity = 0.6 * _hp;
    //if (hp == 5)
    // pink image
    //if (hp == 4)
    // yellow image
    //if (hp == 3)
    // green image
    //if (hp == 2)
    // blue image
    //if (hp == 1)
    // red image
    //if (hp == 0)
    // blank image
  }

public Bloon(int _hp) {
     this(_hp, 0f, 0f);
  }
  public int getHP() {
    return hp;
  }

  public int deplete() {
    hp--;
    if (hp == 0) {
      x = 0; 
      y = 0;
    }
    return hp;
  }

  public float[] location() {
    return new float[]{x, y};
  }
  
  public int move(){
    
    return 1;
  }
}
