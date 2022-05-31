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