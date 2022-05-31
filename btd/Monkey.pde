public class Monkey {
  float attackRadius;
  float attackSpeed;
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
  
  public Path targetBloon(){
    for (int i = paths.size()-1; i>=0; i--){
      Path target = paths.get(i);
      if (target.size() > 0 && dist(getWhereX(), getWhereY(), target.location()[0], target.location()[1]) <= attackRadius)
      return paths.get(i);
    }
    return null;
  }
}
