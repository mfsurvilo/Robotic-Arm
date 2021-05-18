%% Test Code to recieve numbers from arduino. 

clear;
clc;
baudrate = 115200;

%% Open Port
s = serial('/dev/cu.usbmodem14201', 'BaudRate', baudrate);
fopen(s);
out = fread(s,11,'uint8').'

R = ReAssem(out)
%% Close Port
%close the port before ending the function
fclose(s);
