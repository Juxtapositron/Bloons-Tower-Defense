Shop shopping;
Map map;
ArrayList<Path> paths = new ArrayList<Path>();
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
void setup() {
  size(1400, 1000);
  shopping = new Shop();
  map = new Map();
}

void draw() {
  
  background(255);
  //System.out.println(mouseX + " " + mouseY);
  shopping.display();
  map.display();
}

void mouseClicked() {
  shopping.mouseClicked();
}
