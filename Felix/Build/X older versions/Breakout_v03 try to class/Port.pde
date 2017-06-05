class Port {
}

void send() {
  myPort.write('1');         //send a 1
  println("1");
  myPort.write('0');          //send a 0
  println("0");
}