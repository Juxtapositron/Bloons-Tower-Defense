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
  boolean hoveredSellButton = false;
  int MenuX = 686;
  int MenuY = 0;

  ArrayList<Upgrade> upgrades = new ArrayList<Upgrade>();
  PImage sBackground = loadImage("./src/shopbackground.png");
  public Monkey(int _type, String img, float _x, float _y, float _price) {
    type = _type;
    photo = loadImage(img);
    photo.resize(dim, dim);
    x = _x;
    y = _y;
    whereX = x-dim/2;
    whereY = y-dim/2;
    if (type == 1) {
      attackRadius = 90;
      attackSpeed = 16;
    }
    if (type == 2) {
      attackRadius = 180;
      attackSpeed = 4;
    }
    mtick = (int) attackSpeed;
    price = _price;
  }


  float getWhereX() {
    return whereX;
  }

  float getWhereY() {
    return whereY;
  }

  float getRadius() {
    return attackRadius;
  }

  float getSpeed() {
    return attackSpeed;
  }

  void displayUpgrades() {
    //self explainatory
    for (int i = 0; i < upgrades.size(); i++) {
      Upgrade u = upgrades.get(i);
      u.display();
    }
  }
  
  void rotateMonkey() {
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
  
  void hoverEffect() {
    if (hovered && !clicked) {
      tint(0, 153, 204);
    } else {
      tint(255);
    }
  }
  
  void thisMonkeyIsSelectedMonkey() {
    if (this == monkeyWithUpgradeOpen) {
      showMenu();
      fill(0, 0, 0, 50);
      ellipse(x, y, attackRadius *2, attackRadius *2);
      displayUpgrades();
    }
  }
  void display() {
    hovered = overRect(); //is it over the Monkey?
    hoveredCloseMenuButton = overCloseButton(); //is it over the close menu button?
    hoveredSellButton = overRect(716, 300, 716+160, 300+40);
    hoverEffect();
    
    thisMonkeyIsSelectedMonkey();
    rotateMonkey();
    
  }
  float getAngle(float pX1, float pY1, float pX2, float pY2) {
    return atan2(pY2 - pY1, pX2 - pX1)* 180/ PI;
  }
  
  public int targetBloon() {
    int greatestPath = 0;
    int indexWithGreatestPath = -1;
    float angleWithGreatestPath = -1;


    for (int i = bindex.size()-1; i>=0; i--) { //loops through all indexes where bloons are in the path
      int targetPath = bindex.get(i);

      Path target = paths.get(targetPath);
      //println("distance from this to path " + i + " is " + dist(getWhereX(), getWhereY(), target.location()[0], target.location()[1]) + " away");
      if (dist(getWhereX(), getWhereY(), target.location()[0], target.location()[1]) <= attackRadius) {

        if (targetPath > greatestPath) {
          greatestPath = targetPath;
          indexWithGreatestPath = i;
          angleWithGreatestPath = getAngle(target.location()[0], target.location()[1], getWhereX(), getWhereY()) + 270; //add 270 to get the correct angle
        }
      }
    }
    
    if (greatestPath == -1) { //no valid path with a bloon on it is within range
      return -1;
    } else {
      if (angleWithGreatestPath != -1) {
        angle = angleWithGreatestPath; //change the angle to look at the bloon
      }
      return indexWithGreatestPath;
    }
  }

  public void attack() {
    if (mtick % attackSpeed == 0) { //attack cooldown

      int bIndexTargetIndex = targetBloon();
      if (bIndexTargetIndex != -1) { //bloon selected to be attacked

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

    if (hoveredCloseMenuButton && monkeyWithUpgradeOpen == this) { //closing the menu
      monkeyWithUpgradeOpen = null;
    }
  
    if (hoveredSellButton && monkeyWithUpgradeOpen == this) { //selling the monkey 
      sell();
    }
    if (mouseX > imageWidth) {

      if (this == monkeyWithUpgradeOpen) {
        for (int i = 0; i < upgrades.size(); i++) {
          Upgrade u = upgrades.get(i);
          u.onClick();
        }
      }
    }
  }

  void showMenu() {


    tint(255);
    image(sBackground, imageWidth, 0); 

    textSize(25);

    //photo.resize(dim, dim);

    text("Upgrades For ", imageWidth+12, 45);

    imageMode(CENTER);
    image(photo, imageWidth+195, 40);
    drawCloseButton();
    displaySellButton();
    
  }

  void drawCloseButton() {
    if (hoveredCloseMenuButton) {
      fill(255, 121, 121);
    } else {

      fill(255);
    }
    

    rect(685, 358, 214, 44);
    fill(0);
    text("Close Menu", 728, 390);
    
  }

  boolean overCloseButton() {
    return mouseX >= 685 && mouseX <= 685+214 && mouseY >=358 && mouseY <= 358+44;
  }

  boolean overRect(float x1, float y1, float x2, float y2) {
    return mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2;
  }
  
  void sell() {
      money += (int) (price * 0.75); //gain money back
      monkies.remove(this);
      monkeyWithUpgradeOpen = null;
  }
  
  void displaySellButton() {
    if (hoveredSellButton) {
      fill(255, 121, 121);
    } else {
      fill(255, 0, 0);
    }
    
    rect(716, 300, 160, 40, 20, 20, 20, 20);
    textSize(25);
    fill(0);
    text("Sell: $" + (int) (price * 0.75), 738, 330);
    
  }
  void addUpgradesAndMonkey(Upgrade f, Upgrade s) {
    f.addMonkey(this);
    s.addMonkey(this);
    upgrades.add(f.shallowCopy());
    upgrades.add(s.shallowCopy());
  }

  void hoverUpgrades() {
    upgradeShopHover = upgrades.get(0).hovered || upgrades.get(1).hovered;
  }

  void increaseRange(float increase) {
    attackRadius += increase;
  }

  void increaseAttackSpeed(float increase) {
    attackSpeed -= increase;
  }
}
