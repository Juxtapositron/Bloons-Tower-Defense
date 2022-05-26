Shop shopping;
Map map;
ArrayList<Path> paths = new ArrayList<Path>();
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
PImage or;
void setup() {
  size(1400, 1000);
  shopping = new Shop();
  map = new Map();
  
  or = loadImage("./src/or.jpg");
  or.resize(1000, 1000);
  
}

void draw() {
  
  background(255);
  
  image(or, 0, 0);
  //System.out.println(mouseX + " " + mouseY);
  shopping.display();
  map.display();
}

void mouseClicked() {
  shopping.mouseClicked();
}
