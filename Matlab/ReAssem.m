%% ReAssem UDF
% Purpose: Removes the first entry of the the vector. Reassembles 8bit
% numbers into 16bit numbers.
% Inputs: pieces - 1xn matrix  
% Outputs:reassembled 1 x (n-1/2) matrix of reassembled numbers. 

function [reassembled] = ReAssem(pieces)
l = length(pieces);
p = pieces;
r = [];
i = 1;
a = 2;
while length(r) < (l-1)/2
    r(i) = p(a)*256 + p(a+1);
    a = a+2;
    i = i+1;
    
end
reassembled = r;
