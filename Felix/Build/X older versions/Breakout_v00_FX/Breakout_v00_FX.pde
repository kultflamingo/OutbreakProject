// GLOBAL --------------------------------------------------------------------------//

//  *****  Serial Connection
import processing.serial.*;
Serial myPort;  // Create object from Serial class

//  *****  Breakout
Ball bll;
Paddle Paddle;
ArrayList brickslist;


// SETUP --------------------------------------------------------------------------//
void setup() {

  //  *****  Serial Connection
  String portName = Serial.list()[3]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);

  //  *****  Breakout
  size(1024, 768);
  background(0);
  noCursor();
  smooth();
  //creates a ball that will bounce around the screen
  bll = new Ball (175, 420, 1, 2, color(255, 255, 255));
  rectMode(CENTER);
  //creates the paddle that will hit the ball into the bricks 
  Paddle = new Paddle (height, 120, 30);
  //create an empty array list for the Bricks
  brickslist = new ArrayList();
  // fill the array list
  for (int x = 1; x<=9; x++) {
    for (int y = 1; y<=1; y++) {
      brickslist.add(new Bricks (x*100+15, y*40+20, 90, 30));
    } // for
  } // for
} // func


// DRAW --------------------------------------------------------------------------//

void draw() {
  background(0);
  //
  //lets the ball move
  bll.move();
  // check collisions with Bricks
  for (int i = brickslist.size()-1; i>=0; i--) {
    // get the brick #i
    Bricks oneSingleBrick = (Bricks) brickslist.get(i);
    // check it
    if (oneSingleBrick.collide( bll.xposition, bll.yposition, bll.radiusBall ) ) {
      // this needs more attention: when he hits from below, yspeed needs to
      // be changed; when from the sides, xspeed
      bll.yspeed = bll.yspeed * -1;

      // CODE for ARDUINO ********************************************************//
      myPort.write(i);         //send a 1
      //myPort.write('i');
      println(i);
      myPort.write('0');          //send a 0
      println("0");

      brickslist.remove(i);


      //
      //
    } // if
  } // for  
  bll.bounce();//allows ball to bounce off the edges
  bll.display();//displays the ball
  // display Bricks
  for (int i = brickslist.size()-1; i>=0; i--) {
    Bricks oneSingleBrick = (Bricks) brickslist.get(i);
    oneSingleBrick.display();
  } // for
  // now Paddle stuff
  Paddle.move();//paddle is allowed to move
  Paddle.display();//displays the paddle
} // func