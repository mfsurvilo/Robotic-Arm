function [FPath,exit] = ZCorrect(FPath)
% ListenChar(); FlushEvents();   Put this in the matlab script somewhere up ahead to start
% the query of keyboard inputs into the buffer. 
 ch = 0;
    nudge = .4; % in centimeters
    [avail, numChars] = CharAvail;
    if avail == 1
    [ch, when] = GetChar(0, 1);
    ch;
    end
    
    if ch == 105 % Move In (-Z) (I Key)
        FPath = FPath + [0 0 -nudge];
        'Moved in'
    end
    
    if ch ==  111% Move Out (-Z) (O Key)
       FPath = FPath + [0 0 +nudge];
       'Moved Out'
    end
    if ch == 27   % Esc Button
     'STOPPED Program'
     exit = 1;
    else
    exit = 0;    
    end
%%     I put this outside of this function and it will break out of the
%     current loop
%     if exit == 1
%         'STOPPED Program'
%         break
%     end
end
    
