public class Upgrade {
  Monkey m;
  int cost;
  float AttackSpeedIncrease;
  float RangeIncrease;
  boolean firstBox; //when true, the upgrade is on top, and when false, it's on the bottom
  boolean hovered = false;
  boolean bought = false;
  float opacity = 255;
  
  public Upgrade(int _cost, float _AttackSpeedIncrease, float _RangeIncrease, boolean _firstbox) {
    cost = _cost;
    AttackSpeedIncrease = _AttackSpeedIncrease;
    RangeIncrease = _RangeIncrease;
    firstBox = _firstbox;
  }
  public Upgrade(Monkey _m, int _cost, float _AttackSpeedIncrease, float _RangeIncrease, boolean _firstbox) {
    m = _m;
    cost = _cost;
    AttackSpeedIncrease = _AttackSpeedIncrease;
    RangeIncrease = _RangeIncrease;
    firstBox = _firstbox;
  }
  
  void addMonkey(Monkey _m) {
    m = _m;
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
    
    tint(255, opacity);
    if (firstBox) {
      rect(684, 70, 898-684, 179-70);
      text("Increases the attack speed of the monkey by " + RangeIncrease * 100/ m.attackRadius + "%", 716, 104);
    } else {
      rect(686, 183, 898-684, 284-183);
      text("Increases the range of the monkey by " + AttackSpeedIncrease * 100/ m.attackSpeed + "%", 716, 104);
    }
  }
  void onClick() {
    if (hovered) {
      if (money > cost) {
        money -= cost;
      } else {
        println("insuffient funds");
      }
      
    }
  }
  
  
  
}
