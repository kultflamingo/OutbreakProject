// ******************************************* CREATE SERIAL / UDP CONNECTION ***** //

import hypermedia.net.*;
import processing.serial.*;
Serial myPort;  // Create object from Serial class
UDP udp; // Create the UDP object from hypermedia class


// ********************************************************* GLOBAL VARIABLES ***** //

// *** UDP VARIABLES
String ip = "10.0.1.2"; // the remote IP address
int port = 6001; // the destination port

long previousMillis = 0;
int light = 0;
long interval = 500;
int flicker = 0;
int held = 0;

// *** GAME VARIABLES
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
float paddleW = 70;
float paddleH = 10;


// ******************************************************************** SETUP ***** //
void setup() {

  //  **********  UDP Connection
  udp = new UDP( this, 6000 ); // create a new datagram connection on port 8888
  //udp.log( true ); // <– printout the connection activity
  udp.listen( true ); // and wait for incoming message

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


// ********************************************************************* LOOP ***** //
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

  // ****************************************** create the objects *************** //

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

  // ****************************************** create the gameplay *************** //

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
    println("game over");
  }

  // *** paddle collision *** //

  //standart
  if (ballY>paddleLevel-paddleH/2-ballDiameter/2 && ballX<paddlePos+paddleW/2 && ballX>paddlePos-paddleW/2)
  {
    directY=directY*-1*1.1;  // *1.1 ist nur für erhögung der Geschwindigkeit
  }

  /*
  // rechts
   if (ballY>paddleLevel-paddleH/2-ballDiameter/2 && ballX<paddlePos+paddleW/2 && ballX>paddlePos)
   {
   directY=directY*-1;
   directX=directX*-1.5;
   println("paddle right was hit");
   }
   // links
   if (ballY>paddleLevel-paddleH/2-ballDiameter/2 && ballX<paddlePos && ballX>paddlePos-paddleW/2)
   {
   directY=directY*-1;
   directX=directX*-1.5;
   println("paddle left was hit");
   }
   */


  // *** arduino collision *** //
  //book 1
  if (ballY<0.1+ballDiameter/2 && ballX<brick1Pos+brickW/2 && ballX>brick1Pos-brickW/2)
  {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 1;
    udp.send(message, ip, port);
    println("brick 1 was hit");
  }
  //book 2
  if (ballY<0.1+ballDiameter/2 && ballX<brick2Pos+brickW/2 && ballX>brick2Pos-brickW/2)
  {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 2;
    udp.send(message, ip, port);
    println("brick 2 was hit");
  }
  //book 3
  if (ballY<0.1+ballDiameter/2 && ballX<brick3Pos+brickW/2 && ballX>brick3Pos-brickW/2)
  {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 3;
    udp.send(message, ip, port);
    println("brick 3 was hit");
  }
  //book 4
  if (ballY<0.1+ballDiameter/2 && ballX<brick4Pos+brickW/2 && ballX>brick4Pos-brickW/2)
  {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 4;
    udp.send(message, ip, port);
    println("brick 4 was hit");
  }
  //book 5
  if (ballY<0.1+ballDiameter/2 && ballX<brick5Pos+brickW/2 && ballX>brick5Pos-brickW/2)
  {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 5;
    udp.send(message, ip, port);
    println("brick 5 was hit");
  }
  //book 6
  if (ballY<0.1+ballDiameter/2 && ballX<brick6Pos+brickW/2 && ballX>brick6Pos-brickW/2)
  {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 6;
    udp.send(message, ip, port);
    println("brick 6 was hit");
  }
  //book 7
  if (ballY<0.1+ballDiameter/2 && ballX<brick7Pos+brickW/2 && ballX>brick7Pos-brickW/2)
  {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 7;
    udp.send(message, ip, port);
    println("brick 7 was hit");
  }
  //book 8
  if (ballY<0.1+ballDiameter/2 && ballX<brick8Pos+brickW/2 && ballX>brick8Pos-brickW/2)
  {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 8;
    udp.send(message, ip, port);
    println("brick 8 was hit");
  }
  //book 9
  if (ballY<0.1+ballDiameter/2 && ballX<brick9Pos+brickW/2 && ballX>brick9Pos-brickW/2)
  {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 9;
    udp.send(message, ip, port);
    println("brick 9 was hit");
  }
}


// ********************************************************************* KEYS ***** // 
void keyPressed() {
  if (keyPressed) {
    // *** move the paddle *** //
    // paddle links
    if (key == 'a') {
      paddlePos = paddlePos-paddleW/10*3;
    }
    // paddle rechts
    else if (key == 'd') {
      paddlePos = paddlePos+paddleW/10*3;
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
    // *** send a 01 to proof connection by hitting "0" 
    else if (key == '0') {
      byte[] message = new byte[2];
      message[0] = 0;
      message[1] = 1;
      udp.send(message, ip, port);
    }
  }
}

// KEY functions for testing the connection - PRESS "0"
void keyReleased() {
  if (key == '0') {
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 0;
    udp.send(message, ip, port);
  }
}

/*void keyReleased() {
 byte[] message = new byte[2];
 message[0] = 0;
 message[1] = 0;
 udp.send(message, ip, port);
 }*/

void receive( byte[] data ) { // <– default handler
  //void receive( byte[] data, String ip, int port ) { // <– extended handler

  for (int i=0; i < data.length; i++)
    print(char(data[i]));
  println();
}