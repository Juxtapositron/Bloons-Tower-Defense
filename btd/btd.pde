Shop shopping;
Map map;
public ArrayList<Path> paths = new ArrayList<Path>();
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
PImage or;
ArrayList<Bloon> round1 = new ArrayList<Bloon>();
int tick;
Round one;
ArrayList<Integer> bindex = new ArrayList<Integer>();
boolean roundStarted = false;
StartButton button = new StartButton(35, 800);

int previousBindexLength;
void setup() {
  tick = 0;
  size(1400, 1000);
  shopping = new Shop();
  map = new Map();

  or = loadImage("./src/or.jpg");
  or.resize(1000, 1000);
  for (int i = 0; i<10; i++) {
    Bloon first = new Bloon(1, paths.get(0));
    round1.add(first);
  }

  for (int i = 0; i<10; i++) {
    Bloon first = new Bloon(2, paths.get(0));
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

  //round is over when bindex == 0 AND the previous bindex was greater than 0;
  if (roundStarted) {
    one.start();
    one.move();
    
    if (bindex.size() == 0 && previousBindexLength > 0) {
      roundStarted = false;
      button.unClick();
    }
    previousBindexLength = bindex.size();
  }
  
  button.display();
  
  
}

void mouseClicked() {
  shopping.mouseClicked();
  button.onClick();
  System.out.println(mouseX + " " + mouseY);
}
