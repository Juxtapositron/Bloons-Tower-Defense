public class Round {


  ArrayList<Bloon> bloons = new ArrayList<Bloon>();

  public Round(int[] arrayOfBloons) {
    //every even index specifies the strength of the bloon
    //every odd index specifies the quantity of the previous bloon

    for (int i = 0; i< arrayOfBloons.length; i+=2) {
      int strength = arrayOfBloons[i];
      int quantity = arrayOfBloons[i+1];

      while (quantity > 0) {
        Path zerothPath = paths.get(0);

        Bloon b = new Bloon(strength, zerothPath);
        bloons.add(b);
        quantity--;
      }
    }
  }

  public void start() {
    if (bloons.size() > 0) {
      Path beginning = paths.get(0);
      Bloon current = bloons.get(0);


      if (tick%10 == 0) {

        bloons.remove(0);
        beginning.addBloon(current);
        bindex.add(0);
        //println(bindex);
        //println(bloons);
      }
    }
  }


  public void move() {
    for (int i = bindex.size()-1; i >= 0; i--) {
      int index = bindex.get(i); 
      Path p = paths.get(index); //this is where the bloons lie so far

      p.display();
      p.move(index);


      bindex.remove(i);
    }
  }
}
