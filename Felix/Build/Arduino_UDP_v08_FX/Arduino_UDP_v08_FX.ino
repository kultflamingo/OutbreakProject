// Code to trigger Servos by incoming UDP signal from Processing

#include <ESP8266WiFi.h>
#include <WiFiUDP.h>
#include <Servo.h>

// *** COMMUNICATION CODE
// wifi connection variables
const char* ssid = "ILAB";
const char* password = "schnitzelmitpommes";
boolean wifiConnected = false;

// UDP variables
unsigned int localPort = 6001;
WiFiUDP UDP;
boolean udpConnected = false;
char packetBuffer[UDP_TX_PACKET_MAX_SIZE]; //buffer to hold incoming packet,
char ReplyBuffer[] = "acknowledged by arduino"; // a string to send back

// initialise LED
//int ledPin = 5; // Set the pin to digital I/O


// *** SERVO CODE
int posZero = 10;    // variable to calibrate the zero position of the servo
Servo servo1;  // create servo1 object to control a servo
Servo servo2;  // create servo2 object to control a servo
Servo servo3;  // create servo3 object to control a servo
Servo servo4;  // create servo4 object to control a servo
Servo servo5;  // create servo5 object to control a servo
Servo servo6;  // create servo6 object to control a servo
Servo servo7;  // create servo7 object to control a servo
Servo servo8;  // create servo8 object to control a servo
Servo servo9;  // create servo9 object to control a servo
// (twelve servo objects can be created on most boards)


// ********************************************************************** SETUP ***** //
void setup() {

  // Initialise wifi connection
  wifiConnected = connectWifi();

  // only proceed if wifi connection successful
  if (wifiConnected) {
    udpConnected = connectUDP();
    if (udpConnected) {
      // initialise pins
      pinMode(5, OUTPUT);
    }
  }

  // ***SERVO CODE
  servo1.attach(0);  // attaches the servo1 on pin 12 to the servo1 object
  servo2.attach(2);  // attaches the servo2 on pin 11 to the servo2 object
  servo3.attach(4);  // attaches the servo3 on pin 10 to the servo3 object
  servo4.attach(5);  // attaches the servo3 on pin 10 to the servo3 object
  servo5.attach(12);  // attaches the servo3 on pin 10 to the servo3 object
  servo6.attach(13);  // attaches the servo3 on pin 10 to the servo3 object
  servo7.attach(14);  // attaches the servo3 on pin 10 to the servo3 object
  servo8.attach(15);  // attaches the servo3 on pin 10 to the servo3 object
  servo9.attach(16);  // attaches the servo3 on pin 10 to the servo3 object

}

// ********************************************************************** LOOP ***** //
void loop() {
  // SERVO RESET CODE
  servo1.write(posZero); // otherwise turn it to startposition
  servo2.write(posZero); // otherwise turn it to startposition
  servo3.write(posZero); // otherwise turn it to startposition
  servo4.write(posZero); // otherwise turn it to startposition
  servo5.write(posZero); // otherwise turn it to startposition
  servo6.write(posZero); // otherwise turn it to startposition
  servo7.write(posZero); // otherwise turn it to startposition
  servo8.write(posZero); // otherwise turn it to startposition
  servo9.write(posZero); // otherwise turn it to startposition

  // *** COMMUNICATION CODE
  // check if the WiFi and UDP connections were successful
  if (wifiConnected) {
    if (udpConnected) {

      // if there’s data available, read a packet
      int packetSize = UDP.parsePacket();
      if (packetSize)
      {
        Serial.println("");
        Serial.print("Received packet of size ");
        Serial.println(packetSize);
        Serial.print("From ");
        IPAddress remote = UDP.remoteIP();
        for (int i = 0; i < 4; i++)
        {
          Serial.print(remote[i], DEC);
          if (i < 3)
          {
            Serial.print(".");
          }
        }
        Serial.print(", port ");
        Serial.println(UDP.remotePort());

        // read the packet into packetBufffer
        UDP.read(packetBuffer, UDP_TX_PACKET_MAX_SIZE);
        Serial.println("Contents: ");
        int value = packetBuffer[0] * 256 + packetBuffer[1];
        Serial.println(value);

        // send a reply, to the IP address and port that sent us the packet we received
        UDP.beginPacket(UDP.remoteIP(), UDP.remotePort());
        UDP.write(ReplyBuffer);
        UDP.endPacket();

        /*// *** LED Code
          // turn LED on or off depending on value recieved
          digitalWrite(5, value);*/

        // *** SERVO CODE
        if (value == 1)
        { // If a 1 was received from Processing
          servo1.write(180);      // tell the servo to go to 180 degree position
          delay(500);              // wait until return
        } else {
          servo1.write(posZero); // otherwise turn it to startposition
        }

        if (value == 2)
        { // If 2 was received from Processing
          servo2.write(180);      // tell the servo to go to 180 degree position
          delay(300);              // wait until return
        } else {
          servo2.write(posZero); // otherwise turn it to startposition
        }

        if (value == 3)
        { // If 2 was received from Processing
          servo3.write(180);      // tell the servo to go to 180 degree position
          delay(300);              // wait until return
        } else {
          servo3.write(posZero); // otherwise turn it to startposition
        }

        if (value == 4)
        { // If 2 was received from Processing
          servo4.write(180);      // tell the servo to go to 180 degree position
          delay(300);              // wait until return
        } else {
          servo4.write(posZero); // otherwise turn it to startposition
        }

        if (value == 5)
        { // If 2 was received from Processing
          servo5.write(180);      // tell the servo to go to 180 degree position
          delay(300);              // wait until return
        } else {
          servo5.write(posZero); // otherwise turn it to startposition
        }

        if (value == 6)
        { // If 2 was received from Processing
          servo6.write(180);      // tell the servo to go to 180 degree position
          delay(300);              // wait until return
        } else {
          servo6.write(posZero); // otherwise turn it to startposition
        }

        if (value == 7)
        { // If 2 was received from Processing
          servo7.write(180);      // tell the servo to go to 180 degree position
          delay(300);              // wait until return
        } else {
          servo7.write(posZero); // otherwise turn it to startposition
        }

        if (value == 8)
        { // If 2 was received from Processing
          servo8.write(180);      // tell the servo to go to 180 degree position
          delay(300);              // wait until return
        } else {
          servo8.write(posZero); // otherwise turn it to startposition
        }

        if (value == 9)
        { // If 2 was received from Processing
          servo9.write(180);      // tell the servo to go to 180 degree position
          delay(300);              // wait until return
        } else {
          servo9.write(posZero); // otherwise turn it to startposition
        }

      }
      delay(10);

    }

  }

}

// ***************************************************************** FUNCTIONS ***** //

// connect to UDP – returns true if successful or false if not
boolean connectUDP() {
  boolean state = false;

  Serial.println("");
  Serial.println("Connecting to UDP");

  if (UDP.begin(localPort) == 1) {
    Serial.println("Connection successful");
    state = true;
  }
  else {
    Serial.println("Connection failed");
  }

  return state;
}
// connect to wifi – returns true if successful or false if not
boolean connectWifi() {
  boolean state = true;
  int i = 0;

  WiFi.begin(ssid, password);
  Serial.println("");
  Serial.println("Connecting to WiFi");

  // Wait for connection
  Serial.print("Connecting");
  while (WiFi.status() != WL_CONNECTED) {
    delay(300);
    Serial.print(".");
    if (i > 10) {
      state = false;
      break;
    }
    i++;
  }
  if (state) {
    Serial.println("");
    Serial.print("Connected to ");
    Serial.println(ssid);
    Serial.print("IP address: ");
    Serial.println(WiFi.localIP());
  }
  else {
    Serial.println("");
    Serial.println("Connection failed.");
  }
  return state;
}
