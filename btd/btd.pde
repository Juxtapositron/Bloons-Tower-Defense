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
  
  
  int[] p1 = {900, 1};
  int[] p2 = {900, 297};
  int[] p3 = {744, 297};
  int[] p4 = {744, 176};
  int[] p5 = {112, 176};
  int[] p6 = {112, 508};
  int[] p7 = {239, 508};
  int[] p8 = {239, 360};
  int[] p9 = {365, 360};
  int[] p10 = {365, 505};
  int[] p11 = {487, 505};
  int[] p12 = {487, 359};
  int[] p13 = {611, 359};
  int[] p14 = {611, 668};
  int[] p15 = {757, 668};
  int[] p16 = {757, 470};
  int[] p17 = {902, 470};
  int[] p18 = {902, 803};
  int[] p19 = {463, 803};
  int[] p20 = {463, 669};
  int[] p21 = {2, 669};

  pivots.add(p1);
  pivots.add(p2);
  pivots.add(p3);
  pivots.add(p4);
  pivots.add(p5);
  pivots.add(p6);
  pivots.add(p7);
  pivots.add(p8);
  pivots.add(p9);
  pivots.add(p10);
  pivots.add(p11);
  pivots.add(p12);
  pivots.add(p13);
  pivots.add(p14);
  pivots.add(p15);
  pivots.add(p16);
  pivots.add(p17);
  pivots.add(p18);
  pivots.add(p19);
  pivots.add(p20);
  pivots.add(p21);
}

void draw() {
  
  background(255);
  
  image(or, 0, 0);
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
  System.out.println(mouseX + " " + mouseY);
}
