// ******************************* CREATE SERIAL CONNECTION ***** //

import processing.serial.*;
Serial myPort;  // Create object from Serial class


// *************************************** GLOBAL VARIABLES ***** //

float ballX = 300;                    // ball X at start
float ballY = 100;                    // ball Y at start
float ballDiameter = 20;              // ball Size
float directX = 0.3*random(-3, 3);    // ball speed/direction X
float directY = 0.7*random(1, 3);     // ball speed/direction Y

float brickLevel = 20;    // brick Y
float brickW = 50;
float brickH = 20;

float paddlePos = 300;        //  paddle X at start
float paddleLevel;            //  paddle Y at start ( declared in draw/loop)
float paddleW = 60;
float paddleH = 10;


// ************************************************** SETUP ***** //
void setup() {

  //  **********  Serial Connection
  String portName = Serial.list()[3]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);

  //  **********  Game
  //fullScreen();
  size(600, 400);
  frameRate(50);
  smooth();
  // float paddlePos = width/2;
  //float paddleLevel = height-10;
  //Paddle = new Paddle (width/2, paddleLevel, 30, 10);
}


// *************************************************** LOOP ***** //
void draw() {
  background(0);
  rectMode(CENTER);
  fill(255);
  noStroke();

  // *** local variables *** //
  float paddleLevel = height-10;

  //  brick positions on X
  float brick1Pos = width/10*1;
  float brick2Pos = width/10*2;
  float brick3Pos = width/10*3;
  float brick4Pos = width/10*4;
  float brick5Pos = width/10*5;
  float brick6Pos = width/10*6;
  float brick7Pos = width/10*7;
  float brick8Pos = width/10*8;
  float brick9Pos = width/10*9;

  // *************** create the objects *************** //

  // *** create the paddle *** //
  rect(paddlePos, paddleLevel, paddleW, paddleH);

  // *** create the ball *** //
  //Ball
  ellipse(ballX, ballY, ballDiameter, ballDiameter);         // der Ball
  // make ball move
  ballX=ballX+directX;
  ballY=ballY+directY;

  // *** create the bricks *** //
  rect(brick1Pos, brickLevel, brickW, brickH);          // die Bricks
  rect(brick2Pos, brickLevel, brickW, brickH);          // die Bricks
  rect(brick3Pos, brickLevel, brickW, brickH);          // die Bricks
  rect(brick4Pos, brickLevel, brickW, brickH);          // die Bricks
  rect(brick5Pos, brickLevel, brickW, brickH);          // die Bricks
  rect(brick6Pos, brickLevel, brickW, brickH);          // die Bricks
  rect(brick7Pos, brickLevel, brickW, brickH);          // die Bricks
  rect(brick8Pos, brickLevel, brickW, brickH);          // die Bricks
  rect(brick9Pos, brickLevel, brickW, brickH);          // die Bricks 

  // *************** create the gameplay *************** //

  // *** borders for ball *** //
  //rechts
  if (ballX>width-ballDiameter/2)
  {
    directX=directX*-1;
  }
  //oben
  if (ballY<height-height+ballDiameter/2)
  {
    directY=directY*-1;
  }
  //links
  if (ballX<width-width+ballDiameter/2)
  {
    directX=directX*-1;
  }
  //unten - stop ball
  if (ballY>height-ballDiameter/2)
  {
    directY=0;
    directX=0;
    //directY=directY*-1;
  }

  // *** paddle collision *** //
  //unten
  if (ballY>paddleLevel-paddleH/2-ballDiameter/2 && ballX<paddlePos+paddleW/2 && ballX>paddlePos-paddleW/2)
  {
    directY=directY*-1;
  }

  // *** arduino collision *** //
  //book 1
  if (ballY<1+ballDiameter/2 && ballX<brick1Pos+brickW/2 && ballX>brick1Pos-brickW/2)
  {
    myPort.write(1);         //send the numer of the brick to arduino
    myPort.write(10);        //send a 10 to make the LED flash (just for control)
    println("brick 1 was hit");
  }
  //book 2
  if (ballY<1+ballDiameter/2 && ballX<brick2Pos+brickW/2 && ballX>brick2Pos-brickW/2)
  {
    myPort.write(2);         //send the numer of the brick to arduino
    myPort.write(10);        //send a 10 to make the LED flash (just for control)
    println("brick 2 was hit");
  }
  //book 3
  if (ballY<1+ballDiameter/2 && ballX<brick3Pos+brickW/2 && ballX>brick3Pos-brickW/2)
  {
    myPort.write(3);         //send the numer of the brick to arduino
    myPort.write(10);        //send a 10 to make the LED flash (just for control)
    println("brick 3 was hit");
  }
  //book 4
  if (ballY<1+ballDiameter/2 && ballX<brick4Pos+brickW/2 && ballX>brick4Pos-brickW/2)
  {
    myPort.write(4);         //send the numer of the brick to arduino
    myPort.write(10);        //send a 10 to make the LED flash (just for control)
    println("brick 4 was hit");
  }
  //book 5
  if (ballY<1+ballDiameter/2 && ballX<brick5Pos+brickW/2 && ballX>brick5Pos-brickW/2)
  {
    myPort.write(5);         //send the numer of the brick to arduino
    myPort.write(10);        //send a 10 to make the LED flash (just for control)
    println("brick 5 was hit");
  }
  //book 6
  if (ballY<1+ballDiameter/2 && ballX<brick6Pos+brickW/2 && ballX>brick6Pos-brickW/2)
  {
    myPort.write(6);         //send the numer of the brick to arduino
    myPort.write(10);        //send a 10 to make the LED flash (just for control)
    println("brick 6 was hit");
  }
  //book 7
  if (ballY<1+ballDiameter/2 && ballX<brick7Pos+brickW/2 && ballX>brick7Pos-brickW/2)
  {
    myPort.write(7);         //send the numer of the brick to arduino
    myPort.write(10);        //send a 10 to make the LED flash (just for control)
    println("brick 7 was hit");
  }
  //book 8
  if (ballY<1+ballDiameter/2 && ballX<brick8Pos+brickW/2 && ballX>brick8Pos-brickW/2)
  {
    myPort.write(8);         //send the numer of the brick to arduino
    myPort.write(10);        //send a 10 to make the LED flash (just for control)
    println("brick 8 was hit");
  }
  //book 9
  if (ballY<1+ballDiameter/2 && ballX<brick9Pos+brickW/2 && ballX>brick9Pos-brickW/2)
  {
    myPort.write(9);         //send the numer of the brick to arduino
    myPort.write(10);        //send a 10 to make the LED flash (just for control)
    println("brick 9 was hit");
  }
}


// *************************************************** KEYS ***** // 
void keyPressed() {
  if (keyPressed) {
    // *** move the paddle *** //
    // paddle links
    if (keyCode == LEFT) {
      paddlePos = paddlePos-paddleW/10*9;
    }
    // paddle rechts
    else if (keyCode == RIGHT) {
      paddlePos = paddlePos+paddleW/10*8;
    }
    // *** reset the game *** //
    else if (keyCode == ENTER) {
      ballX = 300;
      ballY = 100;
      directX = 0.3*random(-3, 3);
      directY = 0.7*random(1, 3);
      paddlePos = 300;
      paddleLevel = height-10;
      println("new game");
    }
  }
}