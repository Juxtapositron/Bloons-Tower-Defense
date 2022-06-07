public class Shop {
  ArrayList<PurchaseMonkey> MonkeySale = new ArrayList<PurchaseMonkey>();
  PImage sBackground;
  public Shop() {

    sBackground = loadImage("./src/shopbackground.png");
    sBackground.resize(1000, 1000);
    
    PurchaseMonkey DartMonkey = new PurchaseMonkey(1, 200, "./src/000-DartMonkey.png", "./src/Dart_Monkey_Flash.png", 1200, 100);

    MonkeySale.add(DartMonkey);
    PurchaseMonkey SuperMonkey = new PurchaseMonkey(2, 200, "SuperMonkey.png", "Super_Monkey.png", 1200, 500);
    MonkeySale.add(SuperMonkey);
    money = 650;
  }
 
  void display() {
      image(sBackground, 1000, 0);
      
      fill(0);
      textSize(50);
      text("Monkey Shop", 1040, 45);
      text("Money: $" + money, 1040, 300);
      
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
