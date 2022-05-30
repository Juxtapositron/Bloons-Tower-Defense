Shop shopping;
Map map;
public ArrayList<Path> paths = new ArrayList<Path>();
ArrayList<Monkey> monkies = new ArrayList<Monkey>();
PImage or;

int tick;
ArrayList<Integer> bindex = new ArrayList<Integer>();
boolean roundStarted = false;
StartButton button = new StartButton(35, 800);

ArrayList<Round> listOfRounds = new ArrayList<Round>();
int previousBindexLength;
void setup() {
  tick = 0;
  size(1400, 1000);
  shopping = new Shop();
  map = new Map();

  or = loadImage("./src/or.jpg");
  or.resize(1000, 1000);
  
  


  listOfRounds.add(new Round(new int[] {1, 5})); //this is like saying 5 red bloons
  listOfRounds.add(new Round(new int[] {1, 10, 2, 5})); //this is like saying 10 red bloons followed by 5 blue bloons
  
  
  
}

void draw() {
  tick++;
  background(255);

  image(or, 0, 0);
  shopping.display();
  map.display();

  //round is over when bindex == 0 AND the previous bindex was greater than 0;
  if (roundStarted) {
    Round upcoming = listOfRounds.get(0);
    upcoming.start();
    upcoming.move();
    
    if (bindex.size() == 0 && previousBindexLength > 0) {
      roundStarted = false;
      button.unClick();
      listOfRounds.remove(0); //dismount the finished round from the list
    }
    previousBindexLength = bindex.size();
  }
  
  button.display();
  
  
}

void mouseClicked() {
  shopping.mouseClicked();
  button.onClick();
  System.out.println(mouseX + " " + mouseY);
}
