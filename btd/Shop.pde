public class Shop {
  ArrayList<PurchaseMonkey> MonkeySale = new ArrayList<PurchaseMonkey>();
  public Shop() {
    PurchaseMonkey DartMonkey = new PurchaseMonkey(300, "./src/000-DartMonkey.png", "./src/Dart_Monkey_Flash.png", 1200, 100);
    MonkeySale.add(DartMonkey);
  }
  
  void display() {
      
      line(1000, 0, 1000, 1000);
      
      fill(0);
      textSize(50);
      text("Monkey Shop", 1040, 45);
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
