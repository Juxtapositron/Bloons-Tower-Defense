ArrayList<Path> paths = new ArrayList<Path>();
ArrayList<int[]> pivots = new ArrayList<int[]>();

public class Map {
  
  public Map() {
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
    fillPath();
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
          paths.add(new Path(currx, z));
        }
      } else {
        for (int z = curry; z < nexty; z++) {
          paths.add(new Path(currx, z));
        }
      }
      
      
     
    } else if (curry == nexty) {
      if (currx > nextx) {
        for (int z = currx; z > nextx; z--) {
          paths.add(new Path(z, curry));
        }
      } else {
        for (int z = currx; z < nextx; z++) {
          paths.add(new Path(z, curry));
        }
      }
      
      
      
      
      }
    }
  }

  void display() {
    visualizePath();
    for (int i = 0; i < monkies.size(); i++) {
      Monkey m = monkies.get(i);
      m.display();
      
    }
  }
  
  
}
