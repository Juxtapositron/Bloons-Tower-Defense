public class Round {


  ArrayList<Bloon> bloons;
  public Round(ArrayList<Bloon> b) {
    bloons = b;
  }
  public void start() {
    if (bloons.size() > 0) {
      Path beginning = paths.get(0);
      Bloon current = bloons.get(0);


      if (tick%70 == 0) {

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
      if (bindex.size() < 10) {

        println(bindex);
      }
      int index = bindex.get(i); 
      Path p = paths.get(index); //this is where the bloons lie so far
      
      p.display();
      p.move(index);
      

      bindex.remove(i);
    }
  }
}
