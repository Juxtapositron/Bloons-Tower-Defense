Shop shopping;
Map map;
public ArrayList<Path> paths = new ArrayList<Path>();
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
PImage or;
int RoundNumber;
int tick;
ArrayList<Integer> bindex = new ArrayList<Integer>();
boolean roundStarted = false;
StartButton button = new StartButton(35, 800);

ArrayList<Round> listOfRounds = new ArrayList<Round>();
int previousBindexLength;
boolean victory = false;
boolean lost = false;
void setup() {
  tick = 0;
  RoundNumber = 1;
  size(1400, 1000);
  shopping = new Shop();
  map = new Map();

  or = loadImage("./src/or.jpg"); //loads the map in
  or.resize(1000, 1000);

  listOfRounds.add(new Round(new int[] {5, 100})); //this is like saying 5 red bloons
  listOfRounds.add(new Round(new int[] {1, 10, 2, 5})); //this is like saying 10 red bloons followed by 5 blue bloons
}

void draw() {
  if (lives <= 0) {
    lives = 0;
    lost = true;
  }
  if (!victory && !lost) {
    tick++;
    background(255);

    image(or, 0, 0);
    shopping.display();
    map.display();
    text(RoundNumber, 0, 0);



    if (roundStarted) {
      Round upcoming = listOfRounds.get(RoundNumber - 1);
      upcoming.start();
      upcoming.move();

      
      if (bindex.size() == 0 && previousBindexLength > 0) {
        //round is over when bindex == 0 AND the previous bindex was greater than 0;
        roundStarted = false;
        button.unClick();
        listOfRounds.remove(RoundNumber - 1); //dismount the finished round from the list
        RoundNumber++;
        if (listOfRounds.size() == 0) { //VICTORY, NO ROUNDS LEFT
          victory = true;

          //this code is to remove the pesky bloon that doesn't disappear right away
          bindex = new ArrayList<Integer>();
          background(255);
          image(or, 0, 0);
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
      textSize(300);
      text("YOU LOST", 10, 600);
    }
  }
}

void mouseClicked() {
  shopping.mouseClicked();
  button.onClick();
  System.out.println(mouseX + " " + mouseY);
}
