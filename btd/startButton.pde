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
    if (overRect()) {
      clicked = true;
      roundStarted = true;
    }
  }
  
  void unClick() {
    clicked = false;
  }

  boolean overRect() {
    return mouseX >= x && mouseX <= x+dimY && mouseY >= y && mouseY <= y+dimX;
  }

  void display() {
    if (!clicked) {
      textSize(50);
      if (overRect()) {
        fill(38, 165, 52);
        rect(x, y, dimY, dimX, 20, 20, 20, 20);
        fill(0);
        text("Start round", x + dimX/8, y + dimY/4);
      } else {
        fill(35, 216, 84);
        rect(x, y, dimY, dimX, 20, 20, 20, 20);
        fill(0);
        text("Start round", x + dimX/8, y + dimY/4);
      }
    }
  }
}
