%% DD2DConv UDF
% Purpose: Converts values between 0 and 1024 to degrees.
% Inputs: digpositionNxN matrix in in 16bit form 0-1024
% Outputs:position NxN matrix in degrees
function [position] = DD2DConv(digposition)  

if length(digposition) == 5 
    for i = [1,2]
        position(i) = (digposition(i) - 4115/2) / 91/2*16;
    end
    for i = [3,4,5]
        position(i) = (digposition(i) - 522) / 128/2*75;
    end
end

end