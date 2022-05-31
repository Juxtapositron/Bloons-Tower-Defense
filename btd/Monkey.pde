public class Monkey {
  float attackRadius = 200;
  float attackSpeed = 15;
  float price;
  float damage;
  PImage photo;
  int dim = 50;
  float x;
  float y;
  float whereX;
  float whereY;
  
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
    image(photo, getWhereX(), getWhereY());
  }
  
  public int targetBloon() {
    for (int i = bindex.size()-1; i>=0; i--) {
      int targetPath = bindex.get(i);

      Path target = paths.get(targetPath);
      //println("distance from this to path " + i + " is " + dist(getWhereX(), getWhereY(), target.location()[0], target.location()[1]) + " away");
      if (dist(getWhereX(), getWhereY(), target.location()[0], target.location()[1]) <= attackRadius) {
        //println("hi");
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
