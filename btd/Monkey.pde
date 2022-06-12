Monkey monkeyWithUpgradeOpen;
public class Monkey {
  float attackRadius;
  float attackSpeed;
  float price;
  int type;
  float damage;
  PImage photo;
  int dim = 30;
  float x;
  float y;
  float whereX;
  float whereY;
  float angle= 0;
  int mtick;
  boolean hovered;
  boolean clicked = false;
  boolean menuShown = false;
  boolean hoveredCloseMenuButton = false;
  int MenuX = 686;
  int MenuY = 0;
  
  ArrayList<Upgrade> upgrades = new ArrayList<Upgrade>();
  PImage sBackground = loadImage("./src/shopbackground.png");
  public Monkey(int _type, String img, float _x, float _y) {
    type = _type;
    photo = loadImage(img);
    photo.resize(dim, dim);
    x = _x;
    y = _y;
    whereX = x-dim/2;
    whereY = y-dim/2;
    if (type == 1){
       attackRadius = 90;
       attackSpeed = 16;
    }
    if (type == 2){
      attackRadius = 180;
      attackSpeed = 4;
    }
    mtick = (int) attackSpeed;
  }
  
  
  float getWhereX() {
    return whereX;
  }

  float getWhereY() {
    return whereY;
  }
  
  float getRadius(){
    return attackRadius;
  }
  
  float getSpeed(){
    return attackSpeed;
  }
  
  void displayUpgrades() {
    for (int i = 0; i < upgrades.size(); i++) {
      Upgrade u = upgrades.get(i);
      u.display();
    }
  }
  void display() {
    hovered = overRect();
    hoveredCloseMenuButton = overCloseButton();
    if (hovered && !clicked) {
      tint(0, 153, 204);
    } else {
      tint(255);
    }

    showMenu();
    
    
    if (this == monkeyWithUpgradeOpen) {
      fill(0, 0, 0, 50);
      ellipse(x, y, attackRadius *2, attackRadius *2);
      displayUpgrades();
    }

    imageMode(CENTER);
    //image(photo, X, Y);
    pushMatrix(); // remember current drawing matrix
    translate(x, y);
    //println(angle);
    rotate(radians(angle)); // rotate 45 degrees
    image(photo, 0, 0);
    popMatrix();
    imageMode(CORNER);
  }
  float getAngle(float pX1, float pY1, float pX2, float pY2) {
    return atan2(pY2 - pY1, pX2 - pX1)* 180/ PI;
  }
  public int targetBloon() {
    int greatestPath = 0;
    int indexWithGreatestPath = -1;
    float angleWithGreatestPath = -1;

    for (int i = bindex.size()-1; i>=0; i--) {
      int targetPath = bindex.get(i);

      Path target = paths.get(targetPath);
      //println("distance from this to path " + i + " is " + dist(getWhereX(), getWhereY(), target.location()[0], target.location()[1]) + " away");
      if (dist(getWhereX(), getWhereY(), target.location()[0], target.location()[1]) <= attackRadius) {
        //println("hi");

        if (targetPath > greatestPath) {
          greatestPath = targetPath;
          indexWithGreatestPath = i;
          angleWithGreatestPath = getAngle(target.location()[0], target.location()[1], getWhereX(), getWhereY()) + 270; //add 270 to get the correct angle
        }
      }
    }
    if (greatestPath == -1) {
      return -1;
    } else {
      if (angleWithGreatestPath != -1) {
        angle = angleWithGreatestPath; //only set it when the angle has changed
      }
      return indexWithGreatestPath;
    }
  }

  public void attack() {
    if (mtick % attackSpeed == 0) { //attack cooldown

      int bIndexTargetIndex = targetBloon();
      if (bIndexTargetIndex != -1) {

        int PathNumber = bindex.get(bIndexTargetIndex);
        Path targetPath = paths.get(PathNumber);

        if (targetPath != null) {
          ArrayList<Bloon> targetBloons = targetPath.b;
          for (int i = 0; i < targetBloons.size(); i++) {
            Bloon target = targetBloons.get(i);
            line(x, y, target.location()[0], target.location()[1]);
            int hp = target.deplete();
            money += 1;

            if (hp == 0) {
              targetPath.removeBloon(target);
              if (targetPath.size() == 0) {
                bindex.remove(bIndexTargetIndex);
              }
            }
          }
        }
      } else {
        //this case is when there are no targets to shoot
        mtick = (int) attackSpeed -1;
      }
    }
    mtick++;
  }

  boolean overRect() {
    return mouseX >= whereX && mouseX <= whereX+dim && mouseY >= whereY && mouseY <= whereY+dim;
  }

  boolean overX() {
    return mouseX >= MenuX && mouseX <= MenuX+25 && mouseY >= whereY && mouseY <= whereY+dim;
  }
  void onClick() {
    if (hovered && !menuShown) {
      monkeyWithUpgradeOpen = this;
    }
    
    if (hoveredCloseMenuButton && monkeyWithUpgradeOpen == this) {
      monkeyWithUpgradeOpen = null;
    }
    
    if (this == monkeyWithUpgradeOpen) {
      for (int i = 0; i < upgrades.size(); i++) {
        Upgrade u = upgrades.get(i);
        u.onClick();
      }
    }
  }

  void showMenu() {
    
    if (this == monkeyWithUpgradeOpen) {
      tint(255);
      image(sBackground, imageWidth, 0); 
      
      textSize(25);
      
      //photo.resize(dim, dim);
      
      text("Upgrades For ", imageWidth+12, 45);
      
      imageMode(CENTER);
      image(photo, imageWidth+195, 40);
      drawCloseButton();
    }

  }

  void drawCloseButton() {
    fill(255, 0, 0);
    rect(706, 324, 180, 54, 20, 20, 20, 20);
    
    fill(0);
    textMode(CENTER);
    text("Close Menu", 728, 365);
  }
  
  boolean overCloseButton() {
    return mouseX >= 706 && mouseX <= 706+180 && mouseY >= 324 && mouseY <= 324+54;
  }
  
  void addUpgradesAndMonkey(Upgrade f, Upgrade s) {
    f.addMonkey(this);
    s.addMonkey(this);
    upgrades.add(f);
    upgrades.add(s);
  }
  
  void hoverUpgrades() {
    upgradeShopHover = upgrades.get(0).hovered || upgrades.get(1).hovered;
  }
  
  
}
