int in = 0;
byte length;
int first = 0;
byte Buff[100];
int re = 100;
void setup() {
pinMode(LED_BUILTIN, OUTPUT);
Serial.begin(115200);

}

void loop() {

  
if (Serial.available() > 0) {
    // read the incoming byte:
    first = Serial.read();
    if (first == 1){
        Serial.readBytesUntil(10000,Buff,3);
    }
    re = Buff[0]*256+Buff[1];  // Replace with reassemble function
}
  
if (re == 300){          /// SEND 300 from matlab to blink fast
  for (int i = 0; i < 6; i++) {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(10);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(10);  
  in = 0;
  }
}

if (first == 1){         /// Send any number from matlab and first value will alwasy be 1 and arduino will start blinking. 
  for (int i = 0; i < 6; i++) {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(100);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(100);  
  in = 0;
  }
}
 delay(1000);
 Serial.println(first);
 Serial.println(Buff[0]);
 Serial.println(Buff[1]);
 Serial.println(Buff[2]); 
 Serial.println(' ');
 Serial.println(re);
 Serial.println(' ');
}
