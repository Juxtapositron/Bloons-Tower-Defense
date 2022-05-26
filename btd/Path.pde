import java.util.*;
public class Path{
private float x, y;
private ArrayList<Bloon> b;
public Path(float _x, float _y, ArrayList<Bloon> _b){
  x = _x;
  y = _y;
  b = _b;
}
public Path(float _x, float _y){
  this(_x, _y, new ArrayList<Bloon>());
}



public float[] location(){
  return new float[] {x, y};
}
public Bloon addBloon(Bloon other){
  b.add(other);
  return other;
}
public Bloon removeBloon(Bloon other){
  b.remove(other);
  return other;
}


}
