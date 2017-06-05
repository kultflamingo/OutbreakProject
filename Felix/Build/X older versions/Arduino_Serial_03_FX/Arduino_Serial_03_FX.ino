#include <Servo.h>

// *** COMMUNICATION CODE
char book; // Data received from the serial port
int ledPin = 13; // Set the pin to digital I/O 13

// *** SERVO CODE
Servo servo;  // create servo object to control a servo
// twelve servo objects can be created on most boards
int posZero = 10;    // variable to store the servo position


// ***** SETUP ***** //
void setup() {

  // *** COMMUNICATION CODE
  pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
  Serial.begin(9600); // Start serial communication at 9600 bps

  // ***SERVO CODE
  servo.attach(12);  // attaches the servo on pin X to the servo object

}

// ***** LOOP ***** //
void loop() {

  // *** COMMUNICATION CODE
  if (Serial.available())
  { // If data is available to read,
    book = Serial.read(); // read it and store it in book

    // *** LED Code (for testing)
    if (book == 1)
    { // If 1 was received
      digitalWrite(ledPin, HIGH); // turn the Servo on
    } else {
      digitalWrite(ledPin, LOW); // otherwise turn it off
    }
    // delay for communication reasons
    delay(10); // Wait 10 milliseconds for next reading
  }

  // *** SERVO CODE
  if (book == 1)
  { // If 1 was received
    servo.write(180);      // tell servo to go to 180 degree position
    delay(300);              // wait until return
  } else {
    servo.write(posZero); // otherwise turn it to startposition
  }
}
