Shop shopping;
Map map;
public ArrayList<Path> paths = new ArrayList<Path>();
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
PImage or;
ArrayList<Bloon> round1 = new ArrayList<Bloon>();
int tick;
Round one;
ArrayList<Integer> bindex = new ArrayList<Integer>();

void setup() {
  tick = 0;
  size(1400, 1000);
  shopping = new Shop();
  map = new Map();

  or = loadImage("./src/or.jpg");
  or.resize(1000, 1000);
  for(int i = 0; i<20; i++){
  Bloon first = new Bloon(1, paths.get(0));
  round1.add(first);
  }
  one = new Round(round1);
}

void draw() {
  tick++;
  background(255);

  image(or, 0, 0);
  shopping.display();
  map.display();


  one.start();
  one.move();
}

void mouseClicked() {
  shopping.mouseClicked();
  System.out.println(mouseX + " " + mouseY);
}
