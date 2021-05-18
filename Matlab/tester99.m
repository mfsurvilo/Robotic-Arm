%% Robot Dims
M = [1 0 0     0;      % End effector position at all thetas = 0
     0 1 0  39.082;
     0 0 1 -34.47;
     0 0 0   1  ];

L1 = 3.756;
L2 = 8.425;
L3 = 5.2;
L4 = 20.32;
L5 = 4.3;
L6 = 10;
L7 = 67.5;
 
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
ctl =  [0     -90    90      0      0 ];
ctl2 = cposition;

FKinSpace (M,Slist,ctl)
T = FKinSpace (M,Slist,ctl2)