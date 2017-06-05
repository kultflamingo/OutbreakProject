// Ball Code (in new tab):
class Ball {
  float xposition;
  float yposition;
  float xspeed;
  float yspeed;
  color c;
  // two times the radius:
  int diameterBall=32; // wrong name
  // the single radius
  int radiusBall=diameterBall / 2;  // wrong name
  //
  //all the code for the class goes here
  Ball(float xpos, float ypos, float xsp, float ysp, color c1) {
    xposition = xpos;
    yposition = ypos;
    xspeed = xsp;
    yspeed = ysp;
    c = c1;
    ysp = 2;
    xsp = 2;
  }
  // move ball
  void move() {
    xposition = xposition + xspeed;// Change the x location by speed
    yposition = yposition + yspeed;
  }
  //A function to void bounce the ball
  void bounce() {
    // If we've reached an edge, reverse speed: X
    if ((xposition > width-radiusBall) || (xposition < radiusBall)) {
      xspeed = xspeed *  -1;
    }
    // ... and y
    if ((yposition > height-radiusBall) || (yposition < radiusBall)) {
      yspeed = yspeed * -1;
    }
    // paddle
    if ((yposition >  670) && (xposition < mouseX+50)) {
      yspeed = yspeed * -1;
    }
  }
  //A function to display the ball
  void display() {
    stroke(0);
    fill(c);
    ellipse(xposition, yposition, diameterBall, diameterBall);
  } // func
} // class