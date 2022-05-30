public class Round {
  private int x;

  ArrayList<Bloon> bloons;
  public Round(ArrayList<Bloon> b, int _x) {
    bloons = b;
    x = _x;
  }
  public void start() {
    paths.get(x).addSet(bloons);
}

 public int getX(){
   return x;
 }

 public void move(){
   paths.get(x).move();
   x++;
 }
 
 
}
