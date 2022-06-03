public class Path {
  private float x, y;
  private ArrayList<Bloon> b;
  public Path(float _x, float _y, ArrayList<Bloon> _b) {
    x = _x;
    y = _y;
    b = _b;
  }
  public Path(float _x, float _y) {
    this(_x, _y, new ArrayList<Bloon>());
  }



  public float[] location() {
    return new float[] {x, y};
  }
  public Bloon addBloon(Bloon other) {
    b.add(other);
    return other;
  }

  public Bloon removeBloon(Bloon other) {
    b.remove(other);
    return other;
  }

  public void addSet(ArrayList<Bloon> other) {
    for (int i = 0; i<other.size(); i++)
      b.add(other.get(i));
  }

  public void move(int currentPathIndex) { 
    //currentPath is where this is currently
    if (b.size() >= 1) {

      Bloon currBloon = b.get(0);


      int newPathIndex = currBloon.getVel() + currentPathIndex; //newPath is where it will land on

      if (newPathIndex >= paths.size()) { //this only triggers when the bloon reaches the end
        Path currPath = paths.get(currentPathIndex);
        currPath.removeBloon(currBloon);

        lives -= currBloon.getHP();
      } else { //triggers for moving the bloon
        Path newPath = paths.get(newPathIndex);
        Path currPath = paths.get(currentPathIndex);


        newPath.addBloon(currBloon);
        currPath.removeBloon(currBloon);
        currBloon.setLocation(newPath.location());
        bindex.add(newPathIndex);
      }
    }
  }

  public int size() {
    return b.size();
  }

  public void display(Bloon other) {
    image(other.getImg(), x-25, y-25);
  }


  public void display() {
    tint(255); //reset color
    for (int i = 0; i<b.size(); i++) {
      display(b.get(i));
    }
  }
}
