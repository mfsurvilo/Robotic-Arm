%% RInt UDF
% Purpose: Moves motor to a desired set of thetas
% Inputs:dthetalist an nx5 list of desired thetas, can be a list or one at
% a time.
% Outputs:
function [] = RInt(dthetalist,lasttheta)

threshold = 4; % Acceptable percent positional(degrees) error
pauseduration = .5; %in seconds
%% Move
[r,c] = size(dthetalist);
for i = 1:r
    dposition = dthetalist(i,1:end)
    
    if lasttheta == 0 
         cposition = Talk(1,0); %updates current position
    end
    
     Talk(2,dposition); % Send to desired position
   
    %% Check position
%     
%     diff = 100; %initialize and check atleast once
%     cownt = 1;
%     while any(diff(:) > threshold) % checks to make sure position is XX percent of desired position
%         cownt = cownt+1;
%         pause(pauseduration);
% 
%         diff = abs(dposition-cposition)./dposition
%         if cownt*pauseduration/1000 > 2 %if don't get to position within 2 seconds something is wrong.
%             break
%             'Something is not right. Not able to get into position.'
%             pause
%         end
%     end
end