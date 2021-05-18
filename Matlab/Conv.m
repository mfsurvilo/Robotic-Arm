%% Conv UDF
% Purpose: Converts angles to values between 0 and 512
% Inputs:
% Outputs:
function [ddposition] = Conv(dposition)  
ddposition = dposition*(64/45)+512;
end