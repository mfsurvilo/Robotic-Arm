function [ ] = Initialize()
% Adjust the following values to the "home angles" theta1 through theta6

cposition = Talk(1,0);
home = [0 -90 90 0 0];   %% What is the real home position
% pthetalist = [1 23 24 180 23 74];  % used to test below code

%% Discretized Path to get home.
steps = 5; % How many steps?
dthetalist = zeros(steps,length(home));
for i = 1:length(home)
    dthetalist(:,i) = linspace(cposition(i),home(i),steps);
end
%% Move motor
% Move motor through  points in dthetalist
RInt(dthetalist);
end