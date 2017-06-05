class Paddle {
  float paddlePos;
  float paddleLevel;
  float paddleW;
  float paddleH;
  Paddle(float tempPaddlePos, float tempPaddleLevel, float tempPaddleW, float tempPaddleH) {
    paddlePos = tempPaddlePos;
    paddleLevel = tempPaddleLevel;
    paddleW = tempPaddleW;
    paddleH = tempPaddleH;
  }

  void display() {
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(paddlePos, paddleLevel, paddleW, paddleH);
  }

  void keyPressed() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        paddlePos = paddlePos-5;
      } else if (keyCode == RIGHT) {
        paddlePos = paddlePos+5;
      }
    }
  }
}