float ballX;
float ballY;
float ballSize = 10;
float paddlePos;
float paddleY;
float directX = random(1, 2);
float directY = random(1, 2);
float paddleLevel;
float paddleW = 50;
float paddleH = 10;
float brickW = 50;
float bickH = 20;
float brickLevel = 10;

void setup() {
  size(600, 400);
  //fullScreen();
  frameRate(50);
  smooth();

  float paddlePos = width/2;
}

void draw() {
  background(0, 0, 0);
  fill(255, 255, 255);
  rectMode(CENTER);
  noStroke();

  float paddleLevel = height-20;    // variable to set the level of the paddle
  float ballX = width/2;
  float ballY = paddleLevel-paddleH;

  rect(width/10*1, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*2, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*3, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*4, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*5, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*6, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*7, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*8, brickLevel, brickW, bickH);          // die Bricks
  rect(width/10*9, brickLevel, brickW, bickH);          // die Bricks

  rect(paddlePos, paddleLevel, paddleW, paddleH);    // das Paddle

  ellipse(ballX, ballY, ballSize, ballSize);         // der Ball
}

void keyPressed() {
  if (keyPressed) {
    if (keyCode == LEFT) {
      paddlePos = paddlePos-50;
    } else if (keyCode == RIGHT) {
      paddlePos = paddlePos+50;
    }
  }
}