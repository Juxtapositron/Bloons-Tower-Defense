public class Shop {
  ArrayList<PurchaseMonkey> MonkeySale = new ArrayList<PurchaseMonkey>();
  
  public Shop() {
    PurchaseMonkey DartMonkey = new PurchaseMonkey(1, 200, "./src/000-DartMonkey.png", "./src/Dart_Monkey_Flash.png", 1200, 100);
    MonkeySale.add(DartMonkey);
    PurchaseMonkey SuperMonkey = new PurchaseMonkey(2, 2500, "SuperMonkey.png", "./src/Dart_Monkey_Flash.png", 1200, 500);
    MonkeySale.add(SuperMonkey);
    money = 650;
  }
 
  void display() {
      
      line(1000, 0, 1000, 1000);
      
      fill(0);
      textSize(50);
      text("Monkey Shop", 1040, 45);
      text("Money: $" + money, 1040, 300);
    for (int i = 0; i < MonkeySale.size(); i++) {
      PurchaseMonkey monkey = MonkeySale.get(i);
      monkey.display();
    }
  }
  
  boolean mouseClicked() {
    for (int i = 0; i < MonkeySale.size(); i++) {
      PurchaseMonkey monkey = MonkeySale.get(i);
      monkey.onClick();
    }
    return false;
  }
}
