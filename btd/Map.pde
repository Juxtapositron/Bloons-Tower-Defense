ArrayList<int[]> pivots = new ArrayList<int[]>();

ArrayList<Integer> bindex = new ArrayList<Integer>();
int previousBindexLength; //how many bloons are left

int lives = 200;

int RoundNumber = 1;
PImage mapImage;
public class Map {

  public Map() {
    addPivot(616, 1);
    addPivot(616, 153);
    addPivot(508, 153);
    addPivot(508, 89);
    addPivot(77, 89);
    addPivot(77, 261);
    addPivot(168, 261);
    addPivot(168, 186);
    addPivot(249, 186);
    addPivot(249, 260);
    addPivot(332, 260);
    addPivot(332, 185);
    addPivot(417, 185);
    addPivot(417, 339);
    addPivot(519, 339);
    addPivot(519, 244);
    addPivot(618, 244);
    addPivot(618, 405);
    addPivot(318, 405);
    addPivot(318, 342);
    addPivot(1, 342);


    fillPath();
  }
  void progress() {
    RoundNumber++;
  }
  void addPivot(int x, int y) {
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
    boolean tempHovered = false;

    for (int i = 0; i < monkies.size(); i++) {
      Monkey m = monkies.get(i);
      m.display();
      if (m.hovered) {
        tempHovered = true;
      }
    }
    mHover = tempHovered;

    textSize(30);
    fill(0, 0, 0);
    text("Round "+ (RoundNumber+cheat), 10, 40);
    fill(255, 0, 0);
    text(lives + "❤", imageWidth+120, 490);

    fill(0, 255, 0);
    text("$" + money, imageWidth+120, 451);
    fill(0);
  }
}
