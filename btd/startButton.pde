public class StartButton {

  float x;
  float y;
  int dimX = 70;
  int dimY= 190;

  boolean clicked = false;
  boolean overlap = false;
  boolean hovered;
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
  
  void onPress() { //trigerred by spacebar
    clicked = true;
    roundStarted = true;
  }
  
  void unClick() {
    clicked = false;
  }

  boolean overRect() {
    return mouseX >= x && mouseX <= x+dimY && mouseY >= y && mouseY <= y+dimX;
  }

  void display() {
    hovered = overRect();
    sHover = hovered; //this is fine because there is only one start button
    if (!clicked) {
      textSize(30);
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
