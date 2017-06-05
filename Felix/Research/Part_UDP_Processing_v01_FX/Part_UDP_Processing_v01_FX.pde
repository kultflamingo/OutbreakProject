// Processing UDP example to send and receive binary data
// press f to toggel between LED flickering twice per second or not
// the LED will illuminate when any other key is held down and
// turn back off when the key is released.

import hypermedia.net.*;

UDP udp; // define the UDP object

String ip = "192.168.1.106"; // the remote IP address
int port = 6001; // the destination port

long previousMillis = 0;
int light = 0;
long interval = 500;
int flicker = 0;
int held = 0;

void setup() {
  udp = new UDP( this, 6000 ); // create a new datagram connection on port 8888
  //udp.log( true ); // <– printout the connection activity
  udp.listen( true ); // and wait for incoming message
}

void draw()
{
}

void keyPressed() {

  if (key == '1') {   
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 1;
    udp.send(message, ip, port);
  } 
  if (key == '2') {   
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 2;
    udp.send(message, ip, port);
  }
  if (key == '3') {   
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 3;
    udp.send(message, ip, port);
  }
  if (key == '4') {   
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 4;
    udp.send(message, ip, port);
  }
  if (key == '5') {   
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 5;
    udp.send(message, ip, port);
  }
  if (key == '6') {   
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 6;
    udp.send(message, ip, port);
  }
  if (key == '7') {   
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 7;
    udp.send(message, ip, port);
  }
  if (key == '8') {   
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 8;
    udp.send(message, ip, port);
  }
  if (key == '9') {   
    byte[] message = new byte[2];
    message[0] = 0;
    message[1] = 9;
    udp.send(message, ip, port);
  }
  
  
  
  
  
  
}


void keyReleased() {

  byte[] message = new byte[2];
  message[0] = 0;
  message[1] = 0;
  udp.send(message, ip, port);
}


void receive( byte[] data ) { // <– default handler
  //void receive( byte[] data, String ip, int port ) { // <– extended handler

  for (int i=0; i < data.length; i++)
    print(char(data[i]));
  println();
}