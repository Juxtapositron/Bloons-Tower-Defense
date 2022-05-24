public class Path{
private float x, y;
private int dir;
private Bloon b;
public Path(float _x, float _y, int direction, Bloon _b){
  x = _x;
  y = _y;
  dir = direction;
  b = _b;
}
public Path(float _x, float _y, int direction, int x1){
  this(_x, _y, direction, new Bloon(x1));
}



public float[] location(){
  return new float[] {x, y};
}
public int getDir(){
  return dir;
}
public int setDir(int other){
  int x = dir;
  dir = other;
  return x;
}


}
