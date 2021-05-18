// Works as of Friday 2/28 at 130pm
//If we turn this into a function it would be very useful. 
int a = 0;
// the following is a set of angles in Digital degrees 10-1034.
int joints[] = {1034 , 10 , 522 ,  522+(1034-522)/2  ,   788};  
void setup() {
  Serial.begin(115200);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
}
void loop() {

    Serial.write(1);              // To indicate that position is being sent. 
    Serial.write(joints[0]/256);
    Serial.write(joints[0]%256);
    Serial.write(joints[1]/256);
    Serial.write(joints[1]%256);
    Serial.write(joints[2]/256);
    Serial.write(joints[2]%256);
    Serial.write(joints[3]/256);
    Serial.write(joints[3]%256);
    Serial.write(joints[4]/256);
    Serial.write(joints[4]%256);
    delay(1500);

}

/* Associated matlab code to read incoming file. (Not include reassembly of 8bit-16bit numbers)
clear;
clc;
baudrate = 115200;

%% Open Port
s = serial('/dev/cu.usbmodem14201', 'BaudRate', baudrate);
fopen(s);

out = fread(s,11,'uint8').' % 11 is the maximum length depending 

%Close the port before ending the function
fclose(s);

 */
