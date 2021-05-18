%% Talk UDF
% Purpose: Recieves current position via serial communication from servos.
% Inputs: interp - integer for instruction.
%         dthetalist - desired position array 1x5
% Outputs: pthetalist 1x5 matrix of current position

% 16 bit interpret 
% 1025 - Asks for position
% 1026 - Asks for XXXXXXXX
% 1027 - Sends desired position
% 1028 - Ends transmission

function [pthetalist] = Talk(interp,dthetalist)  
baudrate = 9600;
%% Open Port
Initialize the serial port on the correct port, with a baud rate
s = serial('/dev/cu.usbmodem14201', 'BaudRate', baudrate);
fopen(s);
%% Send
if inter == 1025 % Asks for position.
% send = uint16([1025 0 0 0 0 0 1028]);
% Maybe can send shorter. Depends on what arduino is expecting
send = uint16([1025 1028]); %probs don't need 1028 on here
fwrite(s,send);
end

if inter == 1026 % Sends desired position. 
send = uint16([1026 dthetalist 1028); % we can lose 1028 if we know how 
% many values to expect in arduino
fwrite(s,send);    
end

%% Read
% currently always reads right after sending 
% fread reads blocks of bytes
out = fread(s,7,'uint16')
%% Maybe the above doesn't work
% % declare a 10 millisecond delay
%  delaySec = 0.01; 
%  % if more than 10 seconds have passed without data, then exit
%  maxIters = 1/delaySec;
%  % use to keep track at which iteration we are at
%  atIter   = 1;
%  % read from the serial port
%  [start,varcount,msg] = fread(s,7,'uint16');
%  % keep reading until the start data is returned
%  while varcount==0 && atIter<=maxIters
%      % increment the iteration count
%      atIter = atIter + 1;
%      % pause
%      pause(delaySec); 
%      % try again
%      [start,varcount,msg] = fread(s,6,'uint16');
%  end
%  if atIter==maxIters
%     % 1 second without data so may as well quit outer while loop
%     'Did not recieve data from arduino'
%     break;
%  end
%% Data interpret
out = transpose(out);
if out(1) == 1025 % 1025 indicates position was sent
   out = out(2:end-1) % loses the indicator and final value
   pthetalist = double(out);
end
if out(1) == 1027 % 1026 indicates XXXXXXX was sent 
end
%% Close Port
%close the port before ending the function
fclose(s);
end