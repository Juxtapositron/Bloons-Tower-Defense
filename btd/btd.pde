Shop shopping;
Map map;
int money;
PImage or;
StartButton button = new StartButton(35, 800);

int tick;
boolean roundStarted = false;
ArrayList<Round> listOfRounds = new ArrayList<Round>();
boolean victory = false;
boolean lost = false;
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
public ArrayList<Path> paths = new ArrayList<Path>();
void setup() {
  tick = 0;
  size(1400, 1000);
  shopping = new Shop();
  map = new Map();

  mapImage = loadImage("./src/or.jpg"); //loads the map in
  mapImage.resize(1000, 1000);

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
}

void draw() {
  //println(paths.size());
  if (lives <= 0) {
    lives = 0;
    lost = true;
  }
  if (!victory && !lost) {
    tick++;
    background(255);

    image(mapImage, 0, 0);
    shopping.display();
    map.display();



    if (roundStarted) {
      Round upcoming = listOfRounds.get(0);
      upcoming.start();
      upcoming.move();

      for (int i = 0; i < monkies.size(); i++) {
        Monkey m = monkies.get(i);
        if (tick % m.attackSpeed == 0) {
          m.attack();
        }
      }

      if (bindex.size() == 0 && previousBindexLength > 0 && upcoming.bloons.size() == 0) {
        //round is over when bindex == 0 AND the previous bindex was greater than 0;
        roundStarted = false;
        button.unClick();
        listOfRounds.remove(0); //dismount the finished round from the list
        money += 100;
        map.progress();
        if (listOfRounds.size() == 0) { //VICTORY, NO ROUNDS LEFT
          victory = true;

          //this code is to remove the pesky bloon that doesn't disappear right away
          bindex = new ArrayList<Integer>();
          background(255);
          image(mapImage, 0, 0);
          shopping.display();
          map.display();
        }
      }
      previousBindexLength = bindex.size();
    }

    button.display();
  } else { //VICTORY
    if (victory) {

      fill(33, 232, 94); //green victory
      textSize(320);
      text("VICTORY", 10, 600);
    }
    if (lost) {
      fill(250, 3, 60); //red lost
      textSize(280);
      text("YOU LOST", 10, 600);
    }
  }
}

void mouseClicked() {
  shopping.mouseClicked();
  button.onClick();
  //System.out.println(mouseX + " " + mouseY);
}
