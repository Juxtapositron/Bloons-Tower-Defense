public class StartButton {

  float x;
  float y;
  int dimX = 70;
  int dimY= 70;

  boolean clicked = false;
  boolean overlap = false;
  boolean hovered;
  PImage button;
  public StartButton(float _x, float _y) {
    x = _x;
    y = _y;
    button = loadImage("./src/playbutton.png");
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
    sHover = false;
  }

  boolean overRect() {
    return mouseX >= x && mouseX <= x+dimY && mouseY >= y && mouseY <= y+dimX;
  }

  void display() {
    hovered = overRect();
    sHover = hovered; //this is fine because there is only one start button

    if (!clicked) {
      if (overRect()) {

        tint(38, 165, 52);
      } else {
        tint(35, 216, 84);
      }

      button.resize(dimX, dimY);
      image(button, x, y);
    }
  }
}
