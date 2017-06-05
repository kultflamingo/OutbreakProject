float ballX = 300;
float ballY = 100;
float ballDiameter = 20;
float paddlePos;
float directX = 0.3*random(1, 3);
float directY = 0.7*random(1, 3);
float brickW = 50;
float brickH = 20;
float brickLevel = 10;
float downLevel;
float paddleW = 60;
float paddleH = 10;
float paddleLevel;

void setup() {
  size(600, 400);
  //fullScreen();
  frameRate(50);
  smooth();
  float paddlePos = width/2;
  //float paddleLevel = height-10;
  //Paddle = new Paddle (width/2, paddleLevel, 30, 10);
}

void draw() {
  background(0);
  fill(255);
  rectMode(CENTER);
  noStroke();

  float paddleLevel = height-10;

  // Paddle
  rect(paddlePos, paddleLevel, paddleW, paddleH);

  // Bricks
  rect(width/10*1, brickLevel, brickW, brickH);          // die Bricks
  rect(width/10*2, brickLevel, brickW, brickH);          // die Bricks
  rect(width/10*3, brickLevel, brickW, brickH);          // die Bricks
  rect(width/10*4, brickLevel, brickW, brickH);          // die Bricks
  rect(width/10*5, brickLevel, brickW, brickH);          // die Bricks
  rect(width/10*6, brickLevel, brickW, brickH);          // die Bricks
  rect(width/10*7, brickLevel, brickW, brickH);          // die Bricks
  rect(width/10*8, brickLevel, brickW, brickH);          // die Bricks
  rect(width/10*9, brickLevel, brickW, brickH);          // die Bricks

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
  
  //paddle collision
  //unten
  if (ballY>paddleLevel-paddleH/2-ballDiameter/2 && ballX<paddlePos+paddleW/2 && ballX>paddlePos-paddleW/2)
  {
    directY=directY*-1;
  }

}

void keyPressed() {
  if (keyPressed) {
    if (keyCode == LEFT) {
      paddlePos = paddlePos-paddleW/10*8;
    } else if (keyCode == RIGHT) {
      paddlePos = paddlePos+paddleW/10*8;
    }
  }
}