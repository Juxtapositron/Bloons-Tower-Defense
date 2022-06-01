public class PurchaseMonkey {
  float price;
  PImage photo;
  float x;
  float y;
  int dim = 120;
  float where;
  boolean clicked = false;
  String placeURL;
  boolean overlap = false;

  public PurchaseMonkey(float _price, String shopURL, String _placeURL, float _x, float _y) {
    placeURL = _placeURL;
    price = _price;
    photo = loadImage(shopURL);
    photo.resize(dim, dim);
    x = _x;
    y = _y;
    where = x-dim/2;
  }

  void onClick() {
    if (overRect()) {
      clicked = !clicked;
    } else {
      if (clicked) {
        //code for putting on map here
        if (mouseX < 1000) { //can't put it on the shop

          clicked = !clicked;

          if (!overlap && price<=money) {
            Monkey m = new Monkey(placeURL, mouseX, mouseY);
            monkies.add(m);
            money = money - (int)price;
          }
        }
      }
    }
  }

  void overlapCheck() {

    for (int i = 0; i < monkies.size(); i++) {
      Monkey existingMonkey = monkies.get(i);

      if (mouseX > existingMonkey.whereX && mouseX < existingMonkey.whereX + existingMonkey.dim
        && mouseY > existingMonkey.whereY && mouseY < existingMonkey.whereY + existingMonkey.dim)
      {
        overlap = true;
        return;
      }
    }
    
    for (int i = 0; i < paths.size(); i++) {
      Path path = paths.get(i);
      // dim = 120 for now, so 30 = dim/4
      if (dist(path.location()[0], path.location()[1], mouseX, mouseY) <= 30)
      {
        overlap = true;
        return;
      }
    overlap = false;
  }
  }
  
  boolean overRect() {
    return mouseX >= where && mouseX <= where+dim && mouseY >= y && mouseY <= y+dim;
  }

  void display() {

    overlapCheck();
    if (!clicked) {
      if (overRect()) {
        tint(0, 153, 204);
      } else {
        tint(255);
      }
      image(photo, where, y);
      
      tint(255);
    } else {

      PImage photo = loadImage(placeURL);
      photo.resize(50, 50);

      if (overlap) {
        tint(255, 0, 0);
      } else {
        tint(255);
      }
      fill(0, 0, 0, 50);
      ellipse(mouseX, mouseY, 300, 300);
      imageMode(CENTER);
      image(photo, mouseX, mouseY);
      imageMode(CORNER);
    }
  }
}
