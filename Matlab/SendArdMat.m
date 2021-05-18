%% Test code to send a disassembled series of 1-byte numberes to the adrduino

clear;
clc;
baudrate = 115200;

%% Open Port
s = serial('/dev/cu.usbmodem14201', 'BaudRate', baudrate);
fopen(s);
send = DisAssem([300]);
fwrite(s,send);


%% Close Port
fclose(s);
