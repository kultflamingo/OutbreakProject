// This Sketch is made for ESP32

#include <WiFi.h>
#include <WiFiUdp.h>
#include <Servo.h>

// *** COMMUNICATION CODE
// WiFi network name and password:
const char * networkName = "ILAB";
const char * networkPswd = "schnitzelmitpommes";

//IP address to send udp data to:
// either use the ip address of the server or
// a network broadcast address
const char * udpAddress = "192.168.1.255";
const int udpPort = 3333;

//Are we currently connected?
boolean connected = false;

//The udp library class
WiFiUDP udp;
const int localPort = 8888;
char packetBuffer[255];

int ledPin = 5; // Set the pin to digital I/O


// *** SERVO CODE
int posZero = 10;    // variable to calibrate the zero position of the servo
Servo servo1;  // create servo1 object to control a servo1
Servo servo2;  // create servo1 object to control a servo1
Servo servo3;  // create servo1 object to control a servo1
// (twelve servo1 objects can be created on most boards)


// ********************************************************* SETUP ***** //
void setup() {

  // *** COMMUNICATION CODE
  // Initilize hardware serial:
  Serial.begin(115200);

  //Connect to the WiFi network
  connectToWiFi(networkName, networkPswd);

  delay(10000);
  // listen to
  udp.begin(localPort);

  // ***SERVO CODE
  servo1.attach(0);  // attaches the servo1 on pin 12 to the servo1 object
  servo2.attach(11);  // attaches the servo2 on pin 11 to the servo2 object
  servo3.attach(10);  // attaches the servo3 on pin 10 to the servo3 object

  pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
}

// ***** LOOP ***** //
void loop() {

  // *** COMMUNICATION CODE
  //only send data when connected
  if (connected) {

    int packetSize = udp.parsePacket();
    if (packetSize) {
      Serial.print("Received packet of size ");
      Serial.println(packetSize);
      Serial.print("From ");
      IPAddress remoteIp = udp.remoteIP();
      Serial.print(remoteIp);
      Serial.print(", port ");
      Serial.println(udp.remotePort());

      // read the packet into packetBufffer
      int len = udp.read(packetBuffer, 255);
      if (len > 0) {
        packetBuffer[len] = 0;
      }
      Serial.println("Contents:");
      Serial.println(packetBuffer);

      if (strcmp(packetBuffer, "21") == 0) {
        Serial.println("yeah");
      }

      //Send a packet
      /*udp.beginPacket(udpAddress, udpPort);
        udp.printf("Seconds since boot: %u", millis() / 1000);
        udp.endPacket();*/


      // *** SERVO CODE
      if (strcmp(packetBuffer, "1") == 1)
      { // If a 1 was received from Processing
        servo1.write(180);      // tell the servo to go to 180 degree position
        delay(300);              // wait until return
      } else {
        servo1.write(posZero); // otherwise turn it to startposition
      }

      if (strcmp(packetBuffer, "2") == 2)
      { // If 2 was received from Processing
        servo2.write(180);      // tell the servo to go to 180 degree position
        delay(300);              // wait until return
      } else {
        servo2.write(posZero); // otherwise turn it to startposition
      }

      if (strcmp(packetBuffer, "3") == 3)
      { // If 3 was received from Processing
        servo3.write(180);      // tell the servo to go to 180 degree position
        delay(300);              // wait until return
      } else {
        servo3.write(posZero); // otherwise turn it to startposition
      }


      // *** LED Code
      // (as indicator that something was send by processing and received)
      if (strcmp(packetBuffer, "10") == '1')
      { // If '1' was received
        digitalWrite(ledPin, HIGH); // turn the LED on
        delay(50);
        digitalWrite(ledPin, LOW); // otherwise turn it off
      }

    }

  }
}

void connectToWiFi(const char * ssid, const char * pwd) {
  Serial.println("Connecting to WiFi network: " + String(ssid));

  // delete old config
  WiFi.disconnect(true);
  //register event handler
  WiFi.onEvent(WiFiEvent);

  //Initiate connection
  WiFi.begin(ssid, pwd);

  Serial.println("Waiting for WIFI connection...");
}

//wifi event handler
void WiFiEvent(WiFiEvent_t event) {
  switch (event) {
    case SYSTEM_EVENT_STA_GOT_IP:
      //When connected set
      Serial.print("WiFi connected! IP address: ");
      Serial.println(WiFi.localIP());
      //initializes the udp state
      //This initializes the transfer buffer
      udp.begin(WiFi.localIP(), udpPort);
      connected = true;
      break;
    case SYSTEM_EVENT_STA_DISCONNECTED:
      Serial.println("WiFi lost connection");
      connected = false;
      break;
  }
}
