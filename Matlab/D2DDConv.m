%% D2DDConv UDF
% Purpose: Converts angles to values between 0 and 1024
% Inputs:position- NxN matrix in degrees
% Outputs:digposition NxN matrix in 16bit form 0-1024
function [digposition] = D2DDConv(position)

if length(position) == 1
    digposition = [];
end
if length(position) == 5
    digposition = [0 0 0 0 0 ];
    for i = [1,2]
        digposition(i) = (position(i)*91/16*2)+4115/2;
    end
    
    for i = [3,4,5]
        digposition(i) = position(i)*128*2/75+522;
    end
end
end