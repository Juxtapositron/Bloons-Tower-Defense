Shop shopping;
Map map;
ArrayList<Path> paths = new ArrayList<Path>();
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
PImage or;
ArrayList<int[]> pivots = new ArrayList<int[]>();

void setup() {
  size(1400, 1000);
  shopping = new Shop();
  map = new Map();
  
  or = loadImage("./src/or.jpg");
  or.resize(1000, 1000);
  
  int[] pivotA = {5, 10};
  int[] pivotB = {5, 50};
  int[] pivotC = {100, 50};
  pivots.add(pivotA);
  pivots.add(pivotB);
  pivots.add(pivotC);
}

void draw() {
  
  background(255);
  
  image(or, 0, 0);
  System.out.println(mouseX + " " + mouseY);
  shopping.display();
  map.display();
  
  for (int i = 0; i < pivots.size()-1; i++) {
    int[] curr = pivots.get(i);
    int[] next = pivots.get(i+1);
    
    line(curr[0], curr[1], next[0], next[1]);
  }
}

void mouseClicked() {
  shopping.mouseClicked();
}
