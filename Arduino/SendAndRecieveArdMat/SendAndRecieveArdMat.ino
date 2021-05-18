
// constants won't change. Used here to set a pin number:
const int ledPin =  LED_BUILTIN;// the number of the LED pin
int  num = 0;
int w = 0;
// Variables will change:
int ledState = LOW;             // ledState used to set the LED
int inByte = 0;  
// Generally, you should use "unsigned long" for variables that hold time
// The value will quickly become too large for an int to store
unsigned long previousMillis = 0;        // will store last time LED was updated

long interval = 1000;           // interval at which to blink (milliseconds)

void setup() {
  // set the digital pin as output:
  pinMode(ledPin, OUTPUT);
  Serial.begin(115200);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
    int joints[] = {0, 1234,10,990,23,788,1025};  
    Serial.write(joints[0]);
    Serial.write(joints[1]/256);
    Serial.write(joints[1]%256);
    Serial.write(joints[2]/256);
    Serial.write(joints[2]%256);
    Serial.write(joints[3]/256);
    Serial.write(joints[3]%256);
    Serial.write(joints[4]/256);
    Serial.write(joints[4]%256);
    Serial.write(joints[5]/256);
    Serial.write(joints[5]%256);
}


void loop() {
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    // read first analog input:
   num = inByte;
   if (num = 1) {
  interval = 100;
}
if (num = 2) {
  interval = 1000;
}
}
int currentMillis = millis();

if (currentMillis - previousMillis >= interval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW) {
      ledState = HIGH;
    } else {
      ledState = LOW;
    }
    digitalWrite(ledPin, ledState);

  }
}
