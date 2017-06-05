/*

 reads values of analog inputs (0-5) of arduino board
 and vizualizes them as a graph

 */

// libraries
import processing.serial.*;
// serial connection
Serial port;
String message = null;
String elements[] = null;
// arduino
int[] sensorValues = new int[6];
// graphs
int distanceX = 110;
int distanceBottom = 40;
int graphWidth = 40;
color graphColor = color(255,255,255);
PFont fontGraph;

void setup() {

  // size
  size(800, 600);
  // no strokes
  noStroke();
  // Set the font and its size (in units of pixels)
  fontGraph = loadFont("Verdana.vlw");
  textFont(fontGraph, 12);
  // print all available serial ports
  println(Serial.list());
  // init connection to arduino
  port = new Serial(this, Serial.list()[0], 57600);

}

void draw() {

  // clear background
  background(0);

  // draw bars with values of analog inputs
  for(int i=0; i<6; i++){
    // color
    fill(graphColor);
    // draw bar
    rect(i*distanceX+distanceX,height-distanceBottom,graphWidth,-sensorValues[i]/2);
    // draw text
    text(sensorValues[i], i*distanceX+distanceX, height-distanceBottom+20);
  }
}

// serial event
void serialEvent(Serial p){

  // get message till line break (ASCII > 13)
  message = port.readStringUntil(13);
  // just if there is data
  if (message != null) {
    // try catch function because of possible garbage in received data
    try {
      elements = splitTokens(message);
      // loop through sensor values
      for (int i =0; i < elements.length && i < 6; i++ ) {
        sensorValues[i] = int(elements[i]);
      }
    }
    catch (Exception e){
    }
  }

}