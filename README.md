Group members: Kevin Wang, Shadman Shaharia

Link to doc: https://docs.google.com/document/d/1eNJ6Y2D-n9RyRyniD1p_3FZlo2GQRzi0q2Nwswn9_zA/edit?usp=sharing

Shadman (5/17): I filled out our form, made our repository, and wrote our MVP's goals and future goals. Worked on outline, decided on the creation of the Bloon, Monkey, Map, and Shop classes and their methods/constructors/properties .

Kevin (5/17): I created the Google doc and initalized the group name, member name, and brief project description. I brainstormed with Shadman the MVP, arguing about certain features that would constitute a minimum. Populated methods and properties for the Shop and Monkey classes in the outline and improved the formatting.

Shadman (5/19): I started and finished our first UML. Consulted with Kevin as to how I can contribute to code, worked out that I can keep managing our project vision and create the map class.

Kevin (5/19): I cleaned up the UML to align with UML standards. Wrote out most of the parts of the prototype and formatted it.

Shadman (5/23): I started coding! While Kevin covered the Map, Monkey, PurchaseMonkey, and Shop classes, I managed the Balloon class and the Path classes. So far, only initial constructors and accessor/mutator methods have been created!

Kevin (5/23): I updated OOP standards for Monkey class. I'm waiting on Shadman to finish with his code to progress with my phase.


Kevin (5/24): I started looking into what the map design should look like. We decided on the map Ocean Road. Also updated UML diagram to account for the methods we've shifted around.

Shadman (5/24): I put an extra Bloon parameter in the Path constructor, so each Path can contain a Bloon. Decided on the moving mechanics of the Bloons!

Kevin (5/25) : I hardcoded pivots for the path of a specific map. Then I created an algorithm to turn 21 paths into 4k+ paths that trace along the path of the map.

Shadman (5/25) : Received word that Path should really contain a Bloon array. Remove direction parameter, making preparations to change Path into the class that move Bloons.

Kevin (5/26) : I updated the code I created earlier to follow OOP standards better. I also did the colison functionality so that a monkey cannot be placed on top of a path

Shadman (5/26) : Started the creation of Round 1. Made a working move method, and should be done coding both paths and bloons.


Shadman (5/29) : Round 1 is finished. Need to find a better solution to move, very bad O(n^2).

Kevin (5/29) : Fixed code to have bloons moving in a stable path. I added lives counter and support for losing lives, and a roundstart button.

Kevin (5/30) : I implemented a cleaner solution to adding bloons to each round, and made the rounds compatible with the roundstart button. I also added support for winning and losing screens when the rounds hit zero or the lives hit zero respectively.

Shadman (5/30): Working on Monkey class. Had to finish in one day to get to MVP, so rushed an incomplete version. Should be at MVP, due to help from Kevin. Also created all ten rounds, and added round number global variable.

Kevin (5/31) : I added the attacking implementation, including selecting the bloon to be shot at, the rotation for "aiming" at the bloon and the actual depleting of the bloon. This was in preparation for the demo.

Shadman (5/31): Relaxed a lot since demos were due today, only really added onPath() to prevented placement on Monkeys on the Path.

Kevin (6/1) : I fixed a bug with the rotation of the monkey to look at the bloon by adding 270 degrees to the arctan between the bloon and the monkey.

Shadman (6/1): Starting planning Super Monkey additions. Most work was done afk, using math to determine good stats for Super Monkey.

Kevin (6/2) : I added a hover effect for Monkey and a rudimentary implementation for upgrading monkeys. I also did some minor bug fixes.

Shadman (6/2): I only merged my work on the laptop. Most time spent preparing presentation ideas for Kevin and I (We presented today).

Kevin (6/3) : I changed the shop background to a wooden background, added spacebar support for starting the round, and made a opaque radius show up when the monkey is clicked/selected by the user.

Shadman (6/3): Spent time helping make attackRadius show on click with Kevin, and finally implemented Super Monkey in all its glory (very initial). Had to add type parameter to long list of parameters for monkey, makes implementing more monkeys in the future easier.

Kevin (6/4) : Break day.

Shadman (6/4): Super Monkey done! Works fabulously with Kevin's changes!

Kevin (6/5) : Break day.

Shadman (6/5): Break day.

Kevin (6/6) : Stared at my code for an hour trying to figure out why the cursor was oscillating from the hand to the arrow cursor.

Shadman (6/6): Start menu's beginnings. Very beginning-level thumbnail, borrowing from BTD5 promotion flyers.

Kevin (6/7) : Fixed cursor bug from yesterday. Cursor works fine for button, monkey, and purchaseMonkey. I also manually resized the paths and map to better fit a 720p display. 

Shadman (6/7): Pretty basic, starting screen lets you start once you press 's'. Also, tickCheck boolean severely cleans up code in other aspects of code.

Kevin (6/8) : Started implementation on monkey upgrades and decided that the upgrade menu should be overlayed on top of the shop.

Shadman (6/8): Turning my eyes to fake loading screen. Found nice images, researched ideas on how to make it look real.

Shadman (6/9): (pushed on June 10th) Loading screen looked finished, but takes way too long. Will need to look further into it, for moment being Mr. K said I need to get cheating done.

Shadman (6/10 - 6/11) Break day. Added Kernel to try to make loading screen nicer (blur effect).

Kevin (6/10 - 6/11) : Break days.

Shadman (6/12): Cheating works seamlessly! Also, loading screen and menu screen in the works, hopefully done by tomorrow morning commit.

Kevin (6/12) : Fully implemented and debugged upgrade menu. I changed and moved around some design choices and I also added polishing touches.

^^^ Commit Log ^^^

Below is a set of instructions.

To get past the start screen, press "s". To skip a round, press "r". DO NOT press "r" before pressing "s"! When you are on the
stage before starting a round, press "d" to make the next round unstoppable. By which I mean, if you are on round 2 and then you press "d", round 3 is "unstoppable" - it is meant to kill you. We could have shown you an insta-kill, but we want you to see how you might die in the course of the game, not just how the loss screen looks.

Click once on the dart monkey under the text "Monkey Shop". This should drag a Dart Monkey, which you can then place anywhere on the map as long as there is no Dart Monkey that has been placed nearby. This action costs $200, and can be done any time during gameplay (even between rounds).

To start each round, click the "Start Round" button (or press the space bar). When it appears again, the round has ended, and you need to start the next round. Repeat until loss/victory. Game currently contains 10 rounds of easy difficulty.
