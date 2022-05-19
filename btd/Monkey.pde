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
 
  void display() {
    tint(255);
    image(photo, whereX, whereY);
  }
}
