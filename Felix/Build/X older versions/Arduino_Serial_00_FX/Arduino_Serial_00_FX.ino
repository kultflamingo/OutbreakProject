#include <Servo.h>

// COMMUNICATION CODE
char val; // Data received from the serial port
int servoTestPin = 12; // Set the pin to digital I/O 13

// SERVO CODE
Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards
int pos1 = 0;    // variable to store the servo position


// ***** SETUP ***** //
void setup() {

  // COMMUNICATION CODE
  pinMode(servoTestPin, OUTPUT); // Set pin as OUTPUT
  Serial.begin(9600); // Start serial communication at 9600 bps

  // SERVO CODE
  myservo.attach(13);  // attaches the servo on pin 9 to the servo object

}

// ***** LOOP ***** //
void loop() {

  // COMMUNICATION CODE
  if (Serial.available())
  { // If data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  if (val == '1')
  { // If 1 was received
    digitalWrite(servoTestPin, HIGH); // turn the Servo on
  } else {
    digitalWrite(servoTestPin, LOW); // otherwise turn it off
  }
  delay(10); // Wait 10 milliseconds for next reading

  // SERVO CODE
  for (pos1 = 0; pos1 <= 180; pos1 += 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
    myservo.write(pos1);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
  for (pos1 = 180; pos1 >= 0; pos1 -= 1) { // goes from 180 degrees to 0 degrees
    myservo.write(pos1);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
}
