public class Upgrade {
  Monkey m;
  int cost;
  float AttackSpeedIncrease;
  float RangeIncrease;
  boolean firstBox; //when true, the upgrade is on top, and when false, it's on the bottom
  boolean hovered = false;
  public Upgrade(Monkey _m, int _cost, float _AttackSpeedIncrease, float _RangeIncrease, boolean _firstbox) {
    m = _m;
    cost = _cost;
    AttackSpeedIncrease = _AttackSpeedIncrease;
    RangeIncrease = _RangeIncrease;
    firstBox = _firstbox;
  }
  
  //x1,y2 are the coordinates of the top left corner of the rectangle,
  //x2,y2 are the coordinates of the bottom right corner of the rectangle
  boolean overRect(float x1, float y1, float x2, float y2) {
    return mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2;
  }
  
  void display() {

  }
  void onClick() {
    
  }
  
  
  
}
