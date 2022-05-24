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
         
         if (!overlap) {
            Monkey m = new Monkey(placeURL, mouseX, mouseY);
            monkies.add(m);
         }
       }
     }
   }
 }
 
 void overExisting() {
   
   for (int i = 0; i < monkies.size(); i++) {
     Monkey existingMonkey = monkies.get(i);

     if (mouseX > existingMonkey.whereX && mouseX < existingMonkey.whereX + existingMonkey.dim
     && mouseY > existingMonkey.whereY && mouseY < existingMonkey.whereY + existingMonkey.dim)
      {
       overlap = true;
       return;
     }
   }
   overlap = false;
   
   
 }
 boolean overRect()  {
  return mouseX >= where && mouseX <= where+dim && mouseY >= y && mouseY <= y+dim;
}
  
  void display() {
    
    overExisting();
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
      
      
      image(photo, mouseX, mouseY);
      
    }
}
}
