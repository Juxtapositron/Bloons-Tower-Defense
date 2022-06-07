public class Monkey {
  float attackRadius;
  float attackSpeed;
  float price;
  int type;
  float damage;
  PImage photo;
  int dim = 50;
  float x;
  float y;
  float whereX;
  float whereY;
  float angle= 0;
  int mtick;
  boolean hovered;
  boolean clicked = false;
  boolean menuShown = false;

  int MenuX = 1000;
  int MenuY = 500;
  public Monkey(int _type, String img, float _x, float _y) {
    type = _type;
    photo = loadImage(img);
    photo.resize(dim, dim);
    x = _x;
    y = _y;
    whereX = x-dim/2;
    whereY = y-dim/2;
    if (type == 1){
       attackRadius = 150;
       attackSpeed = 16;
    }
    if (type == 2){
      attackRadius = 300;
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
  
  void display() {
    hovered = overRect();

    if (hovered && !clicked) {
      tint(0, 153, 204);
    } else {
      tint(255);
    }
    if (menuShown) {
      showMenu();
    }
    
    if (clicked) {
      fill(0, 0, 0, 50);
      ellipse(x, y, 300, 300);
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

  void onClick() {
    if (hovered && !menuShown) {
      clicked = !clicked;
      menuShown = !menuShown;
    }
  }

  void showMenu() {
    rect(MenuX, MenuY, 400, 500);
    drawX();
  }

  void drawX() {
    int circleSize = 50;

    ellipseMode(CENTER);
    fill(255, 0, 0);
    ellipse(MenuX, MenuY, circleSize, circleSize);
  }
}
