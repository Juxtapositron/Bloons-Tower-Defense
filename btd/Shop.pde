public class Shop {
  ArrayList<PurchaseMonkey> MonkeySale = new ArrayList<PurchaseMonkey>();
  PImage sBackground;
  public Shop() {

    sBackground = loadImage("./src/shopbackground.png");
    
    PurchaseMonkey DartMonkey = new PurchaseMonkey(1, 200, "./src/000-DartMonkey.png", "./src/Dart_Monkey_Flash.png", imageWidth + 50, 100);

    MonkeySale.add(DartMonkey);
    PurchaseMonkey SuperMonkey = new PurchaseMonkey(2, 600, "SuperMonkey.png", "Super_Monkey.png", imageWidth + 50, 200);
    MonkeySale.add(SuperMonkey);
    money = 650;
  }
 
  void display() {

      image(sBackground, imageWidth, 0);
      
      fill(0);
      textSize(30);
      text("Monkey Shop", imageWidth+15, 45);
      
      fill(0, 255, 0);
      text("$" + money, imageWidth+15, 490);
      fill(0);
      
    boolean tempHovered = false;  
    for (int i = 0; i < MonkeySale.size(); i++) {
      PurchaseMonkey monkey = MonkeySale.get(i);
      monkey.display();
      
      
      if (monkey.hovered) {
        tempHovered = true;
      }
    }
    pmHover = tempHovered;
  }
  
  boolean mouseClicked() {
    for (int i = 0; i < MonkeySale.size(); i++) {
      PurchaseMonkey monkey = MonkeySale.get(i);
      monkey.onClick();
      
    }
    return false;
  }
}
