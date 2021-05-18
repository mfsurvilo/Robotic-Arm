%% EEPos UDF
% Purpose:
% Inputs:
%
% Outputs:

function [T,currenteepos] = EEPos(M,Slist)
%addpath('mr'); %maybe just include FKINSPACE to speed up this loop
cposition = Talk(1,0);
T = FKinSpace(M,Slist,cposition)
currenteepos = [T(1,4) T(2,4) T(3,4)]
end
