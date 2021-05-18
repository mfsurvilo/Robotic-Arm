%% EEPos UDF
% Purpose:
% Inputs:
% Outputs:

function [T,currenteepos,currenttheta] = EEPos(M,Slist)

ctheta = Talk(1,0);

T = FKinSpace(M,Slist,((ctheta/360)*2*pi)');

currenteepos = [T(1,4) T(2,4) T(3,4)];

currenttheta=ctheta;

end