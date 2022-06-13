Shop shopping;
Map map;
int money;
PImage or;
PImage thumb;
int cheat = 0;

StartButton button;
StartMenu start = new StartMenu("Thumbnail.png");
int tick;
boolean roundStarted = false;
boolean tickCheck;
ArrayList<Round> listOfRounds = new ArrayList<Round>();
boolean victory = false;
boolean lost = false;
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
public ArrayList<Path> paths = new ArrayList<Path>();

//Hover variables to decide cursor
boolean mHover = false;
boolean pmHover = false;
boolean sHover = false;
boolean closeShopHover = false;
boolean upgradeShopHover = false;
boolean sellHover = false;

int imageWidth = 686;

void setup() {
  tick = 0;
  size(900, 507);

  thumb = loadImage("Thumbnail.png"); //make the thumbnail image accessible for start
  thumb.resize(900, 507);
  start.display();

  shopping = new Shop();
  map = new Map();

  mapImage = loadImage("./src/or.jpg"); //loads the map in

  button = new StartButton(708, 430);

  //Create rounds here
  listOfRounds.add(new Round(new int[] {1, 15})); //this is like saying 15 red bloons
  listOfRounds.add(new Round(new int[] {1, 10, 2, 5})); //this is like saying 10 red bloons followed by 5 blue bloons
  listOfRounds.add(new Round(new int[] {1, 5, 2, 10}));
  listOfRounds.add(new Round(new int[] {2, 15}));
  listOfRounds.add(new Round(new int[] {1, 5, 2, 5, 3, 5})); 
  listOfRounds.add(new Round(new int[] {2, 5, 3, 10})); 
  listOfRounds.add(new Round(new int[] {3, 15})); 
  listOfRounds.add(new Round(new int[] {3, 5, 4, 5}));
  listOfRounds.add(new Round(new int[] {4, 10}));
  listOfRounds.add(new Round(new int[] {5, 5}));
  listOfRounds.add(new Round(new int[] {4, 5, 5, 5}));
  listOfRounds.add(new Round(new int[] {3, 30}));
  listOfRounds.add(new Round(new int[] {2, 10, 3, 10, 4, 10}));
  listOfRounds.add(new Round(new int[] {5, 5, 4, 5, 5, 5, 4, 5, 5, 5, 4, 5}));
  listOfRounds.add(new Round(new int[] {5, 10, 4, 10, 5, 10}));
  listOfRounds.add(new Round(new int[] {5, 20}));
  listOfRounds.add(new Round(new int[] {2, 10, 4, 10, 5, 10}));
  listOfRounds.add(new Round(new int[] {5, 5, 2, 5, 5, 5, 4, 5, 3, 10}));
  listOfRounds.add(new Round(new int[] {2, 20, 3, 20, 4, 20, 5, 20}));
  listOfRounds.add(new Round(new int[] {5, 30}));
  tickCheck = true;
}

void checkSelectedMonkeyCursor() {
  //this function updates the value of closeShopHover and upgradeShopHover to be used in changeCursor
  if (monkeyWithUpgradeOpen != null) {
    closeShopHover = monkeyWithUpgradeOpen.hoveredCloseMenuButton;
    sellHover = monkeyWithUpgradeOpen.hoveredSellButton;
    monkeyWithUpgradeOpen.hoverUpgrades(); //this will update the value of upgradeShopHover;
  } else {
    closeShopHover = false;
    sellHover = false;
  }
}
void changeCursor() {
  checkSelectedMonkeyCursor();

  if (mHover || pmHover || sHover || closeShopHover || upgradeShopHover || sellHover) { //if any of the possible hover effects are active, have the cursor be a hand
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void checkGameLost() {
  if (lives <= 0) { 
    lives = 0;
    tickCheck = false;
    lost = true;
  }
}

void uponRoundStart() {
  //contains game logic 
  if (roundStarted) {
    Round upcoming = listOfRounds.get(0);
    upcoming.start();
    upcoming.move();

    for (int i = 0; i < monkies.size(); i++) {
      Monkey m = monkies.get(i);
      m.attack();
      //println(m.mtick);
    }

    if (bindex.size() == 0 && previousBindexLength > 0 && upcoming.bloons.size() == 0) {
      //round is over when bindex == 0 AND the previous bindex was greater than 0;
      roundStarted = false;
      button.unClick();
      listOfRounds.remove(0); //dismount the finished round from the list
      money += 100;
      map.progress();
      if (listOfRounds.size() == 0) { //VICTORY, NO ROUNDS LEFT
        tickCheck = false;
        victory = true;
      }
    }
    previousBindexLength = bindex.size();
  }
}

void uponVictory() {
  if (victory) {

    fill(33, 232, 94); //green victory
    textSize(100);
    text("VICTORY", 200, 200);
  }
  if (lost) {
    fill(250, 3, 60); //red lost
    textSize(100);
    text("YOU LOST", 200, 200);
  }
}
void draw() {


  if (start.started()) { //can only run after start menu is passed

    if (tickCheck)
      tick++;
    changeCursor();
    checkGameLost();

    if (!victory && !lost) { //stops the game if won or lost
      background(255);
      tint(255);
      image(mapImage, 0, 0);

      shopping.display();
      map.display();
      button.display();

      uponRoundStart();
    } else { //VICTORY
      uponVictory();
    }
  }
}

void mouseClicked() {
  //perform all the mouse click events for all the possible buttons
  if (start.started()) {

    if (mouseX > imageWidth) {
      button.onClick();
    }

    shopping.mouseClicked();
    for (int i = 0; i < monkies.size(); i++) {
      Monkey m = monkies.get(i);
      m.onClick();
    }

    System.out.println(mouseX + " " + mouseY);
  } else {
    start.start();
  }
}

void cheat() {
  cheat++;
  
  for (int i = 0; i<paths.size(); i++) {
    paths.get(i).reset();
  }
  
  roundStarted = false;
  button.unClick();
  
  if (listOfRounds.size() != 0)
    listOfRounds.remove(0); //dismount the finished round from the list
  
  if (listOfRounds.size() == 0) { //VICTORY, NO ROUNDS LEFT
    tickCheck = false;
    victory = true;
  }
  
  previousBindexLength = bindex.size();
  money += 100;
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    start.start();
  }

  if (start.started()) {

    if (key == ' ') { //starts the next round
      button.onPress();
    }

    if (key == 'r' || key == 'r') { //skips the round
      cheat();
    }

    if (key == 'd' || key == 'D') { //makes new round unstoppable
      listOfRounds.add(1, new Round(new int[] {5, 100}));
    }
  }
}
