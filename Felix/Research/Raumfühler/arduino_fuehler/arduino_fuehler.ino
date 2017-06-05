// libraries
#include <Metro.h>

// instantiate Metro object to slow down serial connection
Metro serialMetro = Metro(50);

void setup() {
  // init serial connection
  Serial.begin(57600);
}

void loop() {

  // check serial metro
  if(serialMetro.check()){
    // build message with values of analog inputs (0-5)
    for(int i=0; i< 6; i++){
      // value analog input
      Serial.print( analogRead(i) );
      // space
      Serial.print(" ");
    }
    // end of message
    Serial.println();
  }
}
