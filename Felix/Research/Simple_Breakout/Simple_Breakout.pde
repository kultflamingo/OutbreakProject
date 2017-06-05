// We will have 20 blocks. blocks[i]==1 means it still exists
int[] blocks = new int[20];
// Variables to keep track of position and speed of ball
int x = 250 + int(random(-80,80));
int y = 350;
int x_speed = 3;
int y_speed = -3;
// Variables to keep track of paddle
int x_paddle = 250, y_paddle = 370;
int paddle_width_half = 40;
// keep score 
int score = 0;
int level = 1;
int wait = 0;

// Run once at start
void setup() {
  int i;
  // 500 pixels wide, 400 pixel height
  // This call will set system variables (width, height)
  size(500, 400);
  rectMode(CENTER);
  // All blocks exist
  for (i=0; i<5; i++) {
    blocks[i] = 1;
  }
}

// Called every re-draw, defaul 30 times per second
void draw() {
  int i, x_tmp, y_tmp;
  int blocks_gone;

  // Update ball position by adding speed
  x = x + x_speed;
  y = y + y_speed;
  if (x>width || x<0)  
    x_speed = -x_speed;
  if (y<0)
    y_speed = -y_speed;

  // Check if keys are pressed
  if (keyPressed) {
    if (keyCode == RIGHT || key == 'd') {
      // Move paddle right
      x_paddle = x_paddle + 8;
    } else if (keyCode == LEFT || key == 'a') {
      // Move paddle left
      x_paddle = x_paddle - 8;
    } else if (key == ' ') {
      // Restart
      x = 250 + int(random(-80,80));
      y = 350;
      x_speed = 3;
      y_speed = -3;
      x_paddle = 250;
      score = 0;
      level = 1;
      // All blocks exist
      for (i=0; i<20; i++) {
        blocks[i] = 1;
      }
    }
  }

  // Check if ball collides with paddle
  if ((x_paddle-paddle_width_half)<x && (x_paddle+paddle_width_half)>x && 
    (y_paddle-10)<y && (y_paddle)>y) {
    // ball is hitting paddle rectangle, reverse y_speed
    y_speed = -y_speed;
    score = score + 1;
  }

  // Clear screen to black
  background(0);
  // Set fill color to white
  fill(255);
  // Display score
  textSize(16);
  textAlign(RIGHT);
  text("Score", 80, 390);
  textAlign(LEFT);
  text(score, 90, 390);
  // Display level
  textAlign(RIGHT);
  text("Level", 450, 390);
  textAlign(LEFT);
  text(level, 460, 390);

  // Draw a circle at position x,y, 10 pixels large
  ellipse(x, y, 10, 10);
  // draw paddle
  rect(x_paddle, y_paddle, paddle_width_half*2+1, 11);
  if (y>height) {
    textSize(40);
    textAlign(CENTER);
    text("Game over", 250, 250);
  }

  blocks_gone = 1;
  // Loop through all the potential blocks
  for (i=0; i<20; i++) {
    // Calculate the x,y position of upper right corner
    x_tmp = i%5*100+10; // %5 is modulus - will result 0-4 always 
    y_tmp = 40*(i/5)+10; 
    // Check if we we have a block (blocks[x] is 1)
    if (blocks[i]==1) { 
      // Draw the block
      rect(x_tmp+40, y_tmp+10, 80, 20);
      // Since we drew a block, all are not gone
      blocks_gone = 0;
    }
    // Check if ball is over the block, if so, remove it (blocks[i]=0) 
    // first check bounce on top/bottom
    if (x>(x_tmp+4) && x<(x_tmp+76) &&
      y>y_tmp && y<(y_tmp+20) && blocks[i]==1) { 
      blocks[i]=0;
      y_speed = -y_speed;
      score = score + 5;
    }
    // first check bounce on sides
    if (((x>(x_tmp-5) && x<x_tmp) || (x>(x_tmp+80) && x<(x_tmp+85))) &&
      y>y_tmp && y<(y_tmp+20) && blocks[i]==1) { 
      blocks[i]=0;
      x_speed = -x_speed;
      score = score + 5;
    }
    // first check bounce on sides
    if (((x>(x_tmp-1) && x<(x_tmp+5)) || (x>(x_tmp+75) && x<(x_tmp+81))) &&
      y>y_tmp && y<(y_tmp+20) && blocks[i]==1) { 
      blocks[i]=0;
      x_speed = -x_speed;
      y_speed = -y_speed;
      score = score + 5;
    }
  }
  if (blocks_gone==1 && wait<200) {
    textSize(40);
    textAlign(CENTER);
    text("Level cleared...", 250, 210);
    text("Preparing next level", 250, 290);
    x = 250;
    y = 350;
    x_speed = 0;
    y_speed = 0;
    wait++;
    if (wait==200) {
      wait = 0;
      x = 250 + int(random(-80,80));;
      y = 350;
      x_speed = 3+level;
      y_speed = -3-level;
      x_paddle = 250;
      level++;
      // All blocks exist
      for (i=0; i<20; i++) {
        blocks[i] = 1;
      }
    }
  }
}