/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR torches = 0
VAR sword = 0
VAR health = 5

-> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.



+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
+ [See whats in the next room] -> second_west_cave
+ [Go Back] -> cave_mouth
-> END
== second_west_cave ==
The next room is too dark to see.
* {torches > 0}[Light torch] -> second_west_cave_lit
+[Go back] ->west_tunnel
-> END

==second_west_cave_lit
The room fills with light. It seems to be a dead end. You do take note of the human sized skull on the ground. You shouldnt stay long.
+[Go back] -> west_tunnel_new
-> END

== west_tunnel_new ==
~ health = health - 1
As you back track a giant bat swarm sweeps down and attacks you. It hurts
Current Health: 
{health}
+[Run!] ->cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room. Your eyes rest on the blade of a sparkling sword.
*[Pick the sword up] -> sword_pickup
*[Continue] -> spike_room

== sword_pickup ==
~ sword = sword + 1
You have picked up the sword!
+[Go Back] -> east_tunnel_lit_no_sword

== east_tunnel_lit_no_sword ==
The light of your torch glints off of the thousands of coins in the room.
+[Continue to the next room] -> spike_room
-> END

== spike_room ==
~ health = health - 1
As you enter the next chamber you are struck by a wooden dart. It hurts.
Current Health:
{health}
+[Continue] -> spiders_chamber
+[Go back] -> east_tunnel_lit_no_sword
-> END

== spiders_chamber ==
You grunt as you enter the new room. As you look around you see a pair of 8 eyes.
A spider leaps out!
* {sword > 0} [Swing Sword] -> dead_spider
+ [Try and run] -> spider_death
-> END

== dead_spider ==
You swing your sword upward as the giant spider leaps towards you.
Direct hit!
The spiders guts spill out as your sword slices through it.

* [Continue] -> final_room
-> END
== spider_death ==
The spider strikes you. 

You drop to the cold floor as you take your final breath.

-> END

==final_room ==
As you walk into the next room you see a glint of light on the other side. 
Looks like you survived.

-> END
