public class Upgrade {
  Monkey m;
  int cost;
  float AttackSpeedIncrease;
  float RangeIncrease;
  boolean firstBox; //when true, the upgrade is on top, and when false, it's on the bottom
  boolean hovered = false;
  boolean bought = false;
  
  float topx1 = 698;
  float topy1 = 85;
  float topx2 = 888;
  float topy2 = 167;
  
  float botx1 = 698;
  float boty1 = 192;
  float botx2 = 888;
  float boty2 = 277;
  
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
      hovered = overRect(topx1, topy1, topx2, topy2);
    } else {
      hovered = overRect(botx1, boty1, botx2, boty2);
    }
  }
  void display() {
    if (!bought) {
      
      detectHover();
      
      stroke(0);
      strokeWeight(1);
      if (hovered) {
        stroke(0, 153, 204);
        strokeWeight(5);
      }
      
      textSize(13);
  
      if (firstBox) {
        noFill();
        rect(topx1, topy1, topx2-topx1, topy2-topy1);
        
        fill(0, 255, 0);
        text("Increase attackspeed by " + (int) ((AttackSpeedIncrease * 100)/ (m.attackSpeed)) + "%", topx1+5, topy1 + 15);
        
        fill (255, 0, 0);
        text("Cost: $" + cost, topx1 + 60, topy1 + 76);
      } else {
        noFill();
        rect(botx1, boty1, botx2-botx1, boty2-boty1);
        
        fill(0, 255, 0);
        text("Increase range by " + (int) ((RangeIncrease * 100)/ (m.attackRadius)) + "%", botx1+5, boty1 + 15);
        
        fill(255, 0, 0);
        text("Cost: $" + cost, botx1+60, boty1 + 80);
      }
      
      stroke(0);
      strokeWeight(1);
    }
  }
  void onClick() {
    if (hovered) {
      if (money >= cost) {
        money -= cost;
        bought = true;
        hovered = false;
        
        m.increaseRange(RangeIncrease);
        m.increaseAttackSpeed(AttackSpeedIncrease);
      } else {
        println("insuffient funds");
      }
      
    }
  }
  
  Upgrade shallowCopy() {
    Upgrade u = new Upgrade(m, cost, AttackSpeedIncrease, RangeIncrease, firstBox);
    return u;
  }
  
  
  
}
