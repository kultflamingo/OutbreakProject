#include <Servo.h>

// COMMUNICATION CODE
char val; // Data received from the serial port
int ledPin = 16; // Set the pin to digital I/O 13

// SERVO CODE
Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards
int posZero = 10;    // variable to store the servo position


// ***** SETUP ***** //
void setup() {

  // COMMUNICATION CODE
  pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
  Serial.begin(9600); // Start serial communication at 9600 bps

  // SERVO CODE
  myservo.attach(12);  // attaches the servo on pin X to the servo object

}

// ***** LOOP ***** //
void loop() {

  // COMMUNICATION CODE
  if (Serial.available())
  { // If data is available to read,
    val = Serial.read(); // read it and store it in val

  // LED Code (for testing) 
  digitalWrite(ledPin, LOW); // set zo zero
  
  if (val == 1)
  { // If 1 was received
    digitalWrite(ledPin, HIGH); // turn the LED on
  } else {
    digitalWrite(ledPin, LOW); // otherwise turn it off
  }
 

  // SERVO CODE
  }
  if (val == 1)
  { // If 1 was received
    myservo.write(180);              // tell servo to go to position in variable 'pos'
    delay(300); // Wait for next reading
  } else {
    myservo.write(posZero); // otherwise turn it off
  }

  // delay for communication reasons
  delay(10); // Wait 10 milliseconds for next reading
}
