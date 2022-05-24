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

public float[] move(float x1, float y1){
  float tempx = x;
  float tempy = y;
  x = x1;
  y = y1;
  return new float[]{tempx, tempy};
}

}
