void setup() {
Serial.begin(115200);

}

void loop() {
  // put your main code here, to run repeatedly:

  uint16_t HighThreshold = 1030;  /// number to break up into bytes
  byte LoByte = (HighThreshold & 0x00FF);
  byte HiByte = ((HighThreshold & 0xFF00) >>8);

  Serial.println( HiByte, DEC );   // <-- prints 
  Serial.println( LoByte, DEC );   // <-- prints 
  }
}
