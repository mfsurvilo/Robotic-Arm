%% EE2Theta UDF
% Purpose:
% Inputs: EEposlist - end effector xyz position list
%         point - which point are we on?
% Outputs: 1x5 matrix of desired positions

function [dposition] = EE2Theta(neweepos,currenttheta,Slist,M,ew,ev)
ew = .01;
ev = .001;
dposition = [];
currenttheta = currenttheta/360*2*pi;

    x = neweepos(1);
    y = neweepos(2);
    z = neweepos(3);
    
    T = [1 0 0 x;
        0 1 0 y;
        0 0 1 z;
        0 0 0 1];
    
    [dpositiont,success] = IKinSpace(Slist,M,T,currenttheta',ew,ev);
    
    
    dpositiont = dpositiont'; % wraps to an interval of 2pi
    
    for i = 1:5
        if dpositiont(i) < 0
            dpositiont(i) = -wrapTo2Pi(abs(dpositiont(i)));
        else
            dpositiont(i) = wrapTo2Pi(dpositiont(i));
        end
    end
    dpositiont = dpositiont/2/pi*360;

    dposition = [dposition ; dpositiont];
end