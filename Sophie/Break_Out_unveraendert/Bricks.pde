// Bricks(again a new tab):
//Bricks
class Bricks {
  float hgt;
  float wdth;
  float x;
  float y;
  Bricks(float tempx, float tempy, float tempwdth, float temphgt) {
    hgt = temphgt;
    wdth = tempwdth;
    x = tempx;
    y = tempy;
  }
  void display() {
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(x, y, wdth, hgt);
  }
  boolean collide (float xBall, float yBall, int radusBallHalf) {
    // all wrong because of rectMode(CENTER);
    if ((xBall+radusBallHalf > x) &&
      (yBall+radusBallHalf > y) &&
      (xBall-radusBallHalf < x+wdth) &&
      (yBall-radusBallHalf < y+hgt))
    {
      return (true);
    }
    else {
      return (false);
    }
  } // func
} // class