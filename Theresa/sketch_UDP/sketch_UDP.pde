import hypermedia.net.*;

UDP udp;

void setup(){
  
  udp = new UDP ( this, 6000 );
  upd.listen( true );
  
}

void draw()
{
}

void keyPressed(){
String ip    = "192.169.1.101";
int port     = 8888;

upd.send("My Data", ip, port );
}

void receive( byte[] data ) {
  for(int i=0; i < data.length; i++)
  print(char(data[i]));
  println();
}