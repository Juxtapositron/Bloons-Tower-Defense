public class PurchaseMonkey {
  float price;
  PImage photo;
  float x;
  float y;
  int dim = 60;
  float where;
  boolean clicked = false;
  String placeURL;
  boolean overlap = false; //overlap for path
  int type;

  boolean hovered;
  Upgrade first; //first goes in the first upgrade slot
  Upgrade second; //second goes in the second upgrade slot
  public PurchaseMonkey(int _type, float _price, String shopURL, String _placeURL, float _x, float _y) {
    type = _type;
    placeURL = _placeURL;
    price = _price;
    photo = loadImage(shopURL);
    photo.resize(dim, dim);
    x = _x;
    y = _y;
    where = x-dim/2;
  }

  void addUpgrades(Upgrade f, Upgrade s) {
    first = f;
    second = s;
  }
  void onClick() {

    if (mouseX > imageWidth && overRect()) {
      clicked = !clicked;
    } else {
      if (mouseX < imageWidth) { //can't put it on the shop
        if (clicked) {
          //code for putting on map here


          clicked = !clicked;

          if (!overlap && price<=money) {

            Monkey m = new Monkey(type, placeURL, mouseX, mouseY);
            m.addUpgradesAndMonkey(first, second);
            monkies.add(m);
            money = money - (int)price;
          }
        } else {
          tint(0, 153, 204);
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
    text("$" + (int) price, x + dim/2, y + dim/2 + 12);

    overlapCheck();

    hovered = overRect();
    if (!clicked) {
      if (hovered) {

        tint(0, 153, 204);
      } else {
        tint(255);
      }
      image(photo, where, y);

      tint(255);
    } else {

      PImage photo = loadImage(placeURL);
      photo.resize(30, 30);

      if (overlap) {
        tint(255, 0, 0);
      } else {
        tint(255);
      }
      fill(0, 0, 0, 50);
      if (type == 1) {

        ellipse(mouseX, mouseY, 180, 180);
      } else if (type ==2) {
        ellipse(mouseX, mouseY, 360, 360);
      } 

      imageMode(CENTER);
      image(photo, mouseX, mouseY);
      imageMode(CORNER);
    }
  }
}
