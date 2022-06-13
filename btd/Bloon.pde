public class Bloon {

  private int hp;
  private float x, y;
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


    if (hp > 0 && hp < 6) {
      if (hp == 5)
        bloon = loadImage("Pink.png");
      if (hp == 4)
        bloon = loadImage("Yellow.png");
      if (hp == 3)
        bloon = loadImage("Green.png");
      if (hp == 2)
        bloon = loadImage("Blue.png");
      if (hp == 1)
        bloon = loadImage("Red.png");
      bloon.resize(30, 30);
    }
  }

  public Bloon(int _hp) {
    this(_hp, 0f, 0f);
  }

  public Bloon(int _hp, Path p) {
    this(_hp, p.location()[0], p.location()[1]);
  }
  public int getHP() {
    return hp;
  }
  public void setHP(int newHP) {
    hp = newHP;
  }
  public int getVel() {
    return hp * 2;
  }
  public PImage getImg() {
    return bloon;
  }
  public int deplete() {
    hp--;
    if (hp == 0) {
      x = 0; 
      y = 0;
    }
    if (hp == 5)
      bloon = loadImage("Pink.png");
    if (hp == 4)
      bloon = loadImage("Yellow.png");
    if (hp == 3)
      bloon = loadImage("Green.png");
    if (hp == 2)
      bloon = loadImage("Blue.png");
    if (hp == 1)
      bloon = loadImage("Red.png");
    bloon.resize(30, 30);
    return hp;
  }

  public float[] location() {
    return new float[]{x, y};
  }
  public float[] setLocation(float[] newLoc) {
    x = newLoc[0];
    y = newLoc[1];
    return newLoc;
  }
}
