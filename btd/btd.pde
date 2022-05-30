Shop shopping;
Map map;
public ArrayList<Path> paths = new ArrayList<Path>();
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
PImage or;
ArrayList<Bloon> round1 = new ArrayList<Bloon>();

Round one;


void setup() {
  size(1400, 1000);
  shopping = new Shop();
  map = new Map();

  or = loadImage("./src/or.jpg");
  or.resize(1000, 1000);

  for (int i = 0; i<20; i++) {
    //paths.get(0) is the first path, and we are directing every bloon to it
    Bloon first = new Bloon(1, paths.get(0));
    round1.add(first);
  }
  one = new Round(round1);
}

void draw() {

  background(255);

  image(or, 0, 0);
  shopping.display();
  map.display();

  one.start();
}

void mouseClicked() {
  shopping.mouseClicked();
  System.out.println(mouseX + " " + mouseY);
}
