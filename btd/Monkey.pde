public class Monkey {
  float attackRadius = 150;
  float attackSpeed = 16;
  float price;
  float damage;
  PImage photo;
  int dim = 50;
  float x;
  float y;
  float whereX;
  float whereY;
  float angle= 0;
  public Monkey(String img, float _x, float _y) {
    photo = loadImage(img);
    photo.resize(dim, dim);
    x = _x;
    y = _y;
    whereX = x-dim/2;
    whereY = y-dim/2;
  }

  float getWhereX() {
    return whereX;
  }

  float getWhereY() {
    return whereY;
  }
  void display() {
    tint(255);
    imageMode(CENTER);
    image(photo, X, Y);
    pushMatrix(); // remember current drawing matrix
    translate(x, y);
    println(angle);
    rotate(radians(angle + 270)); // rotate 45 degrees
    image(photo, 0, 0);
    popMatrix();
    imageMode(CORNER);
  }
  float getAngle(float pX1, float pY1, float pX2, float pY2) {
    return atan2(pY2 - pY1, pX2 - pX1)* 180/ PI;
  }
  public int targetBloon() {
    for (int i = bindex.size()-1; i>=0; i--) {
      int targetPath = bindex.get(i);

      Path target = paths.get(targetPath);
      //println("distance from this to path " + i + " is " + dist(getWhereX(), getWhereY(), target.location()[0], target.location()[1]) + " away");
      if (dist(getWhereX(), getWhereY(), target.location()[0], target.location()[1]) <= attackRadius) {
        //println("hi");

       
        angle = getAngle(target.location()[0], target.location()[1], getWhereX(), getWhereY());
        
        return i;
      }
    }
    return -1;
  }

  public void attack() {
    int bIndexTargetIndex = targetBloon();
    if (bIndexTargetIndex != -1) {

      int PathNumber = bindex.get(bIndexTargetIndex);
      Path targetPath = paths.get(PathNumber);

      if (targetPath != null) {
        ArrayList<Bloon> targetBloons = targetPath.b;
        for (int i = 0; i < targetBloons.size(); i++) {
          Bloon target = targetBloons.get(i);
          line(getWhereX(), getWhereY(), target.location()[0], target.location()[1]);
          int hp = target.deplete();

          if (hp == 0) {
            targetPath.removeBloon(target);
            if (targetPath.size() == 0) {
              bindex.remove(bIndexTargetIndex);
            }
          }
        }
      }
    }
  }
}
