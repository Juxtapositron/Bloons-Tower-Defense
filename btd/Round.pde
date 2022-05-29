public class Round{

  ArrayList<Bloon> bloons;
  public Round(ArrayList<Bloon> b){
    b = bloons;
  }
  public void start(){

  paths.get(0).addSet(bloons);
  int x = 0;
  while (x < paths.size()){
    paths.get(x).display();
    x = x + 1;
    paths.get(x).move();
  }
  }
 
}
