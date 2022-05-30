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

public void addSet(ArrayList<Bloon> other){
  for (int i = 0; i<other.size(); i++)
   b.add(other.get(i));
}

public Bloon move(int index){
  Bloon target = b.remove(index);
  if (paths.size() > target.getVel() + index)
  paths.get(index + target.getVel()).addBloon(target);
  return target;
}

public int size(){
  return b.size();
}
public void move(){
  for (int i = 0; i<b.size(); i++){
    move(i);
  }
}

 public void display(Bloon other){
     image(other.getImg(), x, y);
  }
  
 public void display(){
   for(int i = 0; i<b.size(); i++){
     display(b.get(i));
   }
 }
}
