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
  
  
  
}

void draw() {
  
  background(255);
  
  image(or, 0, 0);
  shopping.display();
  map.display();
  
  visualizePath();
  
}

void mouseClicked() {
  shopping.mouseClicked();
  System.out.println(mouseX + " " + mouseY);
  
}

void visualizePivot() {
  for (int i = 0; i < pivots.size()-1; i++) {
    int[] curr = pivots.get(i);
    int[] next = pivots.get(i+1);
    
    line(curr[0], curr[1], next[0], next[1]);
  }
}

void visualizePath() {
  for (int i = 0; i < paths.size(); i++) {
    Path p = paths.get(i);
    square(p.x, p.y, 5);
  }
}

void fillPath() {
  for (int i = 0; i < pivots.size()-1; i++) {
    int[] curr = pivots.get(i);
    int[] next = pivots.get(i+1);
    
    int currx = curr[0];
    int curry = curr[1];
    
    int nextx = next[0];
    int nexty = next[1];
    
    //when x coordinates of pivot are equal
    if (currx == nextx) {
      
      //make the for loop decrement when the current path's y is greater than the next
      if (curry > nexty) {
        for (int z = curry; z > nexty; z--) {
          paths.add(new Path(currx, z, 1, null));
        }
      } else {
        for (int z = curry; z < nexty; z++) {
          paths.add(new Path(currx, z, 1, null));
        }
      }
      
      
     
    } else if (curry == nexty) {
      if (currx > nextx) {
        for (int z = currx; z > nextx; z--) {
          paths.add(new Path(z, curry, 1, null));
        }
      } else {
        for (int z = currx; z < nextx; z++) {
          paths.add(new Path(z, curry, 1, null));
        }
      }
      
      
      
    }
  }
}
