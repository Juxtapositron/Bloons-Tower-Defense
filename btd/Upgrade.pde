public class Upgrade {
  Monkey m;
  int cost;
  float AttackSpeedIncrease;
  float RangeIncrease;
  boolean firstBox; //when true, the upgrade is on top, and when false, it's on the bottom
  boolean hovered = false;
  boolean bought = false;
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
  
  void detectHover() {
    if (firstBox) {
      hovered = overRect(684, 70, 898, 179);
    } else {
      hovered = overRect(686, 183, 898, 284);
    }
  }
  void display() {
    detectHover();
    
    if (firstBox) {
      text("Increases the attack speed of the monkey by " + RangeIncrease/ m.attackRadius + "%", 716, 104);
    } else {
      text("Increases the range of the monkey by " + AttackSpeedIncrease/ m.attackSpeed + "%", 716, 104);
    }
  }
  void onClick() {
    
  }
  
  
  
}
