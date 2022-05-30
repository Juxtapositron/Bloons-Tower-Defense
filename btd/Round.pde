public class Round {

  ArrayList<Bloon> bloons;
  public Round(ArrayList<Bloon> b) {
    bloons = b;
  }
  public void start() {

    paths.get(0).addSet(bloons);
    int x = 0;
    while (x < paths.size()) {
      paths.get(x).display();
      paths.get(x).move();
      
      x = x + 1;
    }
  }
}
