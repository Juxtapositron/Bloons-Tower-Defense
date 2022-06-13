public class StartMenu {
  boolean started;

  public StartMenu(String s) {

    started = false;
  }


  public void start() {
    started = true;
  }

  public boolean started() {
    return started;
  }
  
  public void display() {
    image(thumb, 0, 0);
    fill(0);
    textSize(100);
    text("Press s to start", 100, 470);
  }
}
