

clear;
clc;
baudrate = 115200;

%% Open Port
s = serial('/dev/tty.usbmodem14201', 'BaudRate', baudrate);
fopen(s);

send = uint8(1);
%fwrite(s,send);
out = fread(s,11,'uint8').'



% for i = 1:(length(out)-1)/2
% oute(i) = out(a)*256+out(a+1);
% a=a+1;
% i=i+1;
% end
%% Close Port
%close the port before ending the function
fclose(s);
