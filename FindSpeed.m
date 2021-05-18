%% FindSpeed UDF
% Purpose: Converts angles to values between 0 and 1024
% Inputs:position- NxN matrix in degrees
% Outputs:digposition NxN matrix in 16bit form 0-1024
function [speed] = FindSpeed(step,Path,maxEEspeed)
% Desired Values
if step ~= 1
x1 = Path(step-1,1);
y1 = Path(step-1,2);
z1 = Path(step-1,3);

x2 = Path(step+1,1);
y2 = Path(step+1,2);
z2 = Path(step+1,3);
%Distance between current and last step
dist = sqrt( (x1-x2)^2  +  (y1-y2)^2  +  (z1-z2)^2 );

angular = [0 0 0 ];
linear = maxEEspeed * [x2-x1 y2-y1 z2-z1]  . / distance; %normalize and multiply by max speed



EEtwist = [angular , linear]; 
else 
  %put this somewhere else  
% [T,currenteepos,currenttheta] = EEPos(M,Slist)
end