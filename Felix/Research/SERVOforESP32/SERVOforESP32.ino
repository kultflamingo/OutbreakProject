#include "esp32-hal-ledc.h"

int angle ( int value) {
  int result = map(value, 0, 180, 3300, 6500);
  return result;

}

void setup() {
  ledcSetup(1, 50, 16); // channel 1, 50 Hz, 16-bit depth
  ledcAttachPin(22, 1);   // GPIO 22 on channel 1

  ledcSetup(2, 50, 16); // channel 1, 50 Hz, 16-bit depth
  ledcAttachPin(19, 2);   // GPIO 22 on channel 1

}

void loop() {
  // for (int i=3300 ; i < 6500 ; i=i+100){


  ledcWrite(1, angle(0));       // sweep the servo
  delay(1000);
  ledcWrite(1, angle(180));       // sweep the servo
  delay(1000);

  ledcWrite(2, angle(0));       // sweep the servo
  delay(1000);
  ledcWrite(2, angle(180));       // sweep the servo
  delay(1000);

}
