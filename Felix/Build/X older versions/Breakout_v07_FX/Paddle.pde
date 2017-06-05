// Paddle(also in new tab)
//Paddle
class Paddle {
  float xpos;
  float hgt;
  float wdth;
  Paddle(float tempXpos, float tempWdth, float tempHgt) {
    xpos = tempXpos;
    hgt = tempHgt;
    wdth = tempWdth;
  }
  void display() {
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(xpos, 700, 120, 10);
  }
  //mouse moves the paddle horizonally
  void move() {
    constrain(xpos, 0+(hgt/2), 400-(hgt/2));
  }

  
  void keyPressed(){
    
    if (keyPressed){
      if(keyCode== LEFT){
        xpos =  xpos-5;
      }
      else if (keyCode== RIGHT){
        xpos = xpos+5;
      } 
      
    }
  }// func
  }// class 