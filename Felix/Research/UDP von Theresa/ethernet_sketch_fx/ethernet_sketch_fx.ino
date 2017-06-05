#include <Dhcp.h>
#include <Dns.h>
#include <Ethernet.h>
#include <EthernetClient.h>
#include <EthernetServer.h>
#include <EthernetUdp.h>
#include <SPI.h>

byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
IPAddress ip(192, 168, 1, 101);

 unsigned int localPort = 8888;

 char packetBuffer[UDP_TX_PACKET_MAX_SIZE];
 char ReplyBuffer[] = "angekommen";

 EthernetUDP Udp;
 

void setup() {

Ethernet.begin(mac,ip);
Udp.begin(localPort);

Serial.begin(9600);

}

void loop() {
  int packetSize = Udp.parsePacket();
  if(packetSize)
  {
    Udp.read(packetBuffer,UDP_TX_PACKET_MAX_SIZE);

    Serial.println(packetBuffer);

    Udp.beginPacket(Udp.remoteIP(), Udp.remotePort());
    Udp.write(ReplyBuffer);
    Udp.endPacket();
    
  }
delay(10);
}
