%% Master Script
%% Setup 
clear
clc
close ALL
% All units are in centimeters
nudge = .5; % Centimeters
ew = .01;
ev = .001;

%% Robot Dims
M = [1 0 0     0;      % End effector position at all thetas = 0
     0 1 0  39.082;
     0 0 1 -34.47;
     0 0 0   1  ];

L1 = 3.756;
L2 = 8.425;
L3 = 5.2;
L4 = 20.32
L5 = 4.3
L6 = 10
L7 = 67.5
 
w0 = [0 1 0];
w1 = [-1 0 0];
w2 = [-1 0 0];
w3 = [-1 0 0];
w4 = [0 0 -1];

q0 = [0 0 L1];
q1 = [0 L2+L3 L1]; 
q2 = [0 L2+L3+L4 L1]; 
q3 = [0 L2+L3+L4+L5 -(L6-L1)]; 
q4 = [0 L2+L3+L4+L5 -(L6+L7-L1)]; 

 
Slist =  transpose([[w0 cross(q0,w0)];...
         [w1 cross(q1,w1)];...
         [w2 cross(q2,w2)];...
         [w3 cross(q3,w3)];...
         [w4 cross(q4,w4)]]);
     
%% Manual Control to Find (0,0,0)
key = getkey; %initilize
while key ~= 13  % Enter
    [T,currenteepos] =  EEPos(M,Slist);
    if key == 30 % Move In (-Z) (Up Arrow)
        desiredeepos = [T(1,4) T(2,4) T(3,4)-nudge] 
    end
    if key == 31 % Move Out (-Z) (Down Arrow)
        desiredeepos = [T(1,4) T(2,4) T(3,4)+nudge]         
    end
    if key == 28 % Move L (-X)  (Left Arrow)
        desiredeepos = [T(1,4)-nudge T(2,4) T(3,4)]  
    end
    if key == 29 % Move R (+X)  (Right Arrow)
        desiredeepos = [T(1,4)+nudge T(2,4) T(3,4)]
    end
    if key == 101 % Move Up (+Y) (E Key)
        desiredeepos = [T(1,4) T(2,4)+nudge T(3,4)]  
    end
    if key == 100 % Move Down (-Y) (D Key)
        desiredeepos = [T(1,4) T(2,4)-nudge T(3,4)]
    end     
end
     