public class Path{
private float x, y;
private int dir;
public Path(float _x, float _y, int direction){
  x = _x;
  y = _y;
  dir = direction;
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
