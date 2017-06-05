#include <Servo.h>


// *** COMMUNICATION CODE
char book; // Data received from the serial port
int ledPin = 5; // Set the pin to digital I/O

// *** SERVO CODE
int posZero = 10;    // variable to calibrate the zero position of the servo
Servo servo1;  // create servo1 object to control a servo1
Servo servo2;  // create servo1 object to control a servo1
Servo servo3;  // create servo1 object to control a servo1
// (twelve servo1 objects can be created on most boards)


// ***** SETUP ***** //
void setup() {

  // *** COMMUNICATION CODE
  pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
  Serial.begin(9600); // Start serial communication at 9600 bps

  // ***SERVO CODE
  servo1.attach(0);  // attaches the servo1 on pin 12 to the servo1 object
  servo2.attach(11);  // attaches the servo2 on pin 11 to the servo2 object
  servo3.attach(10);  // attaches the servo3 on pin 10 to the servo3 object

}

// ***** LOOP ***** //
void loop() {

  // *** COMMUNICATION CODE
  if (Serial.available())
  { // If data is available to read,
    book = Serial.read(); // read it and store it in book
    // this is actually the data that came from processing
    
    // delay for communication reasons
    delay(10); // Wait 10 milliseconds for next reading

    // *** SERVO CODE
    if (book == 1)
    { // If a 1 was received from Processing
      servo1.write(180);      // tell the servo to go to 180 degree position
      delay(300);              // wait until return
    } else {
      servo1.write(posZero); // otherwise turn it to startposition
    }

    if (book == 2)
    { // If 2 was received from Processing
      servo2.write(180);      // tell the servo to go to 180 degree position
      delay(300);              // wait until return
    } else {
      servo2.write(posZero); // otherwise turn it to startposition
    }

    if (book == 3)
    { // If 3 was received from Processing
      servo3.write(180);      // tell the servo to go to 180 degree position
      delay(300);              // wait until return
    } else {
      servo3.write(posZero); // otherwise turn it to startposition
    }

    // *** LED Code
    // (as indicator that something was send by processing and received)
    if (book == '1')
    { // If '1' was received
      digitalWrite(ledPin, HIGH); // turn the LED on
      delay(50);
      digitalWrite(ledPin, LOW); // otherwise turn it off
    }
  }
}
