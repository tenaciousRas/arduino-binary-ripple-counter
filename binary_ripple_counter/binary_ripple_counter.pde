/*
 * LED Bar Graph controlled with an external potentiometer.
 *
 * A 4017 counter is used to save pins on the arduino.
 * The technique of "Persistence of vision" is used to turn on
 * many LEDs at the same time.
 *
 * Developed by Leonel Machava
 * http://codentronix.com
 *
 * This code is release under the "MIT License" available at
 * http://www.opensource.org/licenses/mit-license.php
 */
 
/* Digital pin connected to the counter's clock pin */
int clockPin = 8;
 
/* Digital pin connected to the counter's reset pin */
int resetPin = 3;
 
/* Analog pin connected to the potentiometer wiper */
int potPin = 2;
 
void setup() {
  pinMode(clockPin,OUTPUT);
  pinMode(resetPin,OUTPUT);
  reset();
}
 
void loop() {
  /* Read the analog value from the potentiometer. */
  int potValue = analogRead(potPin);
  int n = potValue * 4;

  /* Count up to n on the counter.  A counter
   * connected to LEDs will show them lighting
   * up in levels based on the value of the pot,
   * and vision persistence will give the apperance
   * that some LEDs are constantly on. */
  for( int i = 0; i < n; i++ ) {
    clock();
  }
 
  reset();
}
 
/*
 * Sends a clock pulse to the counter making it advance.
 */
void clock() {
  digitalWrite(clockPin,HIGH);
  delay(1);
  digitalWrite(clockPin,LOW);
}
 
/*
 * Resets the counter making it start counting from zero.
 */
void reset() {
  digitalWrite(resetPin,HIGH);
  delay(1);
  digitalWrite(resetPin,LOW);
}
