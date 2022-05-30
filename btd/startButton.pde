public class StartButton {

  float x;
  float y;
  int dim = 120;
  float where;
  boolean clicked = false;
  boolean overlap = false;

  public StartButton(float _x, float _y) {
    x = _x;
    y = _y;
    where = x-dim/2;
  }

  void onClick() {
  }

  boolean overRect() {
    return mouseX >= where && mouseX <= where+dim && mouseY >= y && mouseY <= y+dim;
  }

  void display() {
    rect(x, y, dim, dim);
    if (overRect()) {
      
    }
  }
}
