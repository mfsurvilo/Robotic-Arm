%% Talk UDF
% Purpose: Recieves current position via serial communication from servos.
% Inputs: interp - integer for instruction.
%         dposition - desired position array 1x1 --> 1x5
% Outputs: cposition 1x5 matrix of current position

% 16 bit interpret
% 1 - Asks for position
% 2 - Sends desired position
% 3 - Ends transmission              %%       Not used
% 4 - Error in transmission          %%%%%%%%%ADD this back in
% 5 - Gripper control                
% 6 - Gripper current position       %%%% Add in
% 7 - Speed set (0 -1023)
% 9 - Sends thetas and theta dots for each motor


function [cposition] = Talk(interp,data)


%% Open Port
%Initialize the serial port on the correct port, with a baud rate
tic 
instrreset;  % Radically reduced the time to run. 
baudrate = 115200;
s=serial('/dev/cu.usbmodem14101','BaudRate', baudrate);
open_port = instrfind({'Port', 'Status'}, {'/dev/cu.usbmodem14101', 'open'});
if ~isempty(open_port)
    fclose(open_port);
end
fopen(s);
flushinput(s); flushoutput(s);
toc1 = toc;
%% Send
if interp == 1 % Asks for position.
    len = 11; % How long of a vector to anticipate recieving?
    send = uint8([1]);
    fwrite(s,send);
end

if interp == 2 % Sends desired position.
    len = 11;
    ddposition = DisAssem(D2DDConv(data));
    send = uint8([2 ddposition]);
    fwrite(s,send);
end

if interp == 5 % Send gripper position
    len = 3;
    ddposition = DisAssem(data);
    send = uint8([5 ddposition]);
    fwrite(s,send);
end

if interp == 6 % Requests gripper position
    len = 3;
    send = uint8([6]);
    fwrite(s,send);
end


if interp == 7 % Sends speed 
    if data < 70
        speed = DisAssem(data);
        send = uint8([7 speed]);
        fwrite(s,send);
    end
end
if interp == 9 % sends theta and thetadot
       len = 21
        datas = DisAssem(data);
        send = uint8([9 datas]);
        fwrite(s,send);
end

toc2 = toc-toc1;
%% Read
% currently always reads right after sending
% fread reads blocks of bytes

ba = s.BytesAvailable;
if interp == 1 
    send = uint8([1]);
    
    fwrite(s,send);
    
%     while (ba < 11)                     % might not need this
%         ba = s.BytesAvailable  ;              %filling buffer
%     end
    
    out = fread(s,len,'uint8');
end

if interp == 2 || interp == 7 || interp == 5 || interp == 9
    out = data;                               % last position is passed out
end
if interp == 9
    while (ba < 21)
        ba = s.BytesAvailable;    %filling buffer
    end
    out = fread(s,len,'uint8');
end
if  interp == 6
    while (ba < 3)
        ba = s.BytesAvailable;    %filling buffer
    end
    out = fread(s,len,'uint8');
end
toc3 = toc-toc2;
fclose(s);
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

if out(1) == 1  % 1/2 current indicates position was recieved
    cposition = ReAssem(out) ;
    cposition = DD2DConv(cposition);% converts to degrees
    cposition = cposition + [.8352 .4835+.0879 1.7578 2.6367 2.9297];
end
if out(1) == 2
    cposition = 0;
end
if out(1) == 4
    'error has occured in transmission'
end
if out(1) == 9  
    cposition = ReAssem(out) ;
    cposition = cposition(6:end,:);
end
toc4 = toc-toc3 ;
%% Close Port
%close the port before ending the function
fclose(s);
end