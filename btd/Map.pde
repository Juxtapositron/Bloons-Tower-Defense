ArrayList<int[]> pivots = new ArrayList<int[]>();

public class Map {
  
  public Map() {
    addPivot(900, 1);
    addPivot(900, 297);
    addPivot(744, 297);
    addPivot(744, 176);
    addPivot(112, 176);
    addPivot(112, 508);
    addPivot(239, 508);
    addPivot(239, 360);
    addPivot(365, 360);
    addPivot(365, 505);
    addPivot(487, 505);
    addPivot(487, 359);
    addPivot(611, 359);
    addPivot(611, 668);
    addPivot(757, 668);
    addPivot(757, 470);
    addPivot(902, 470);
    addPivot(902, 803);
    addPivot(463, 803);
    addPivot(463, 669);
    addPivot(2, 669);
  
    
    fillPath();
  }
  
  void addPivot(int x , int y) {
    int[] pivot = {x, y};
    pivots.add(pivot);
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
