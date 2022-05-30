public class Round {


  ArrayList<Bloon> bloons;
  public Round(ArrayList<Bloon> b) {
    bloons = b;
  }
  public void start() {
    Path beginning = paths.get(0);
    
    if(bloons.size() > 0){
      Bloon current = bloons.get(0);
      bloons.remove(0);
      if (tick%10 == 0)
        beginning.addBloon(current);
    }
  }


  public void move() {
    for (int i = 0; i<paths.size(); i++) {
      if (paths.get(i).size() > 0){
        paths.get(i).display();
      paths.get(i).move();
      }
    }
  }
}
