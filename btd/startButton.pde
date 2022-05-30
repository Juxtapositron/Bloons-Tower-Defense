public class StartButton {

  float x;
  float y;
  int dimX = 120;
  int dimY= 300;

  boolean clicked = false;
  boolean overlap = false;
  int b = 0;
  public StartButton(float _x, float _y) {
    x = _x;
    y = _y;

  }

  void onClick() {
  }

  boolean overRect() {
    return mouseX >= x && mouseX <= x+dimY && mouseY >= y && mouseY <= y+dimX;
  }

  void display() {
    fill(255);
    rect(x, y, dimY, dimX, 20, 20, 20, 20);
    
    if (overRect()) {
      
    } else {
      
    }
  }
}
