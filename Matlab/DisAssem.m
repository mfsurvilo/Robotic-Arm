%% DisAssem UDF
% Purpose: Adds indicator value and dissasembles string into a vector of 
% 8-bit numbers

% Inputs: whole 1 x n
% Outputs:pieces 1 x (n*2+1) matrix of disassembled numbers. 

function [pieces] = DisAssem(whole)
l = length(whole);
w = whole;

i = 1;
a = 1;
p=[];
while length(p) < 2*l
    p(a)   = fix(w(i)/256);
    p(a+1) = round(rem(w(i),256));
    i = i+1;
    a = a+2;
end
pieces = p;
