float ballX = 50;
float ballY = 50;
float ballDiameter = 20;
float paddlePos;
float directX = 0.3*random(1, 3);
float directY = 0.7*random(1, 3);
float brickW = 50;
float bickH = 20;
float brickLevel = 10;
float downLevel;

Paddle Paddle;

void setup() {
  size(600, 400);
  //fullScreen();
  frameRate(50);
  smooth();
  float downLevel = height-10;
  Paddle = new Paddle (width/2, downLevel, 30, 10);
}

void draw() {
  background(0, 0, 0);
  fill(255, 255, 255);
  rectMode(CENTER);
  noStroke();

  // Bricks
  rect(width/10*1, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*2, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*3, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*4, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*5, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*6, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*7, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*8, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*9, brickLevel, brickW, bickH);          // die Bricks

  //Ball
  ellipse(ballX, ballY, ballDiameter, ballDiameter);         // der Ball

  // make ball move
  ballX=ballX+directX;
  ballY=ballY+directY;

  // make borders for ball
  //rechts
  if (ballX>width-ballDiameter/2)
  {
    directX=directX*-1;
  }
  //unten
  if (ballY>height-ballDiameter/2)
  {
    directY=directY*-1;
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

  Paddle.display();//displays the paddle
  Paddle.keyPressed(); //ruft die
}