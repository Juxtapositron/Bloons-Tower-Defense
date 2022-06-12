public class Shop {
  ArrayList<PurchaseMonkey> MonkeySale = new ArrayList<PurchaseMonkey>();
  PImage sBackground;
  public Shop() {

    sBackground = loadImage("./src/shopbackground.png");

    Upgrade dartMonkeyFirst = new Upgrade(350, 10, 0, true);
    Upgrade dartMonkeySecond = new Upgrade(300, 0, 10, false);
    PurchaseMonkey DartMonkey = new PurchaseMonkey(1, 200, "./src/000-DartMonkey.png", "./src/Dart_Monkey_Flash.png", imageWidth + 50, 100);
    DartMonkey.addUpgrades(dartMonkeyFirst, dartMonkeySecond);
    MonkeySale.add(DartMonkey);
    
    
    Upgrade superMonkeyFirst = new Upgrade(400, 10, 0, true);
    Upgrade superMonkeySecond = new Upgrade(350, 0, 10, false);
    PurchaseMonkey SuperMonkey = new PurchaseMonkey(2, 200, "SuperMonkey.png", "Super_Monkey.png", imageWidth + 50, 200);
    SuperMonkey.addUpgrades(superMonkeyFirst, superMonkeySecond);
    MonkeySale.add(SuperMonkey);
    money = 650;
  }

  void display() {
    if (monkeyWithUpgradeOpen == null) { //have to include this or else they will be clickable through upgrades
      image(sBackground, imageWidth, 0);
  
      fill(0);
      textSize(30);
      text("Monkey Shop", imageWidth+15, 45);
  
  
      boolean tempHovered = false;  
      for (int i = 0; i < MonkeySale.size(); i++) {
        PurchaseMonkey monkey = MonkeySale.get(i);
        monkey.display();
  
  
        if (monkey.hovered) {
          tempHovered = true;
        }
      }
      pmHover = tempHovered;
    } else {
      pmHover = false;
    }
  }

  void mouseClicked() {
    if (monkeyWithUpgradeOpen == null) {
      for (int i = 0; i < MonkeySale.size(); i++) {
        PurchaseMonkey monkey = MonkeySale.get(i);
        monkey.onClick();
      }
    } 
  }
}
