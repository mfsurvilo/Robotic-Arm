ListenChar();
for point = 1:length(FPath)  % Follow each point
 
    y = FPath(point,2);
    scatter(x,y,'MarkerFaceColor','r')
    last = FPath(1,1:end);
    
    if any(diff(:) > threshold) % points aren't too close
        dposition = EE2Theta (FPath(point,1:end),currentthetag, Slist,M,ew,ev);
        Talk(2,dposition);
        lastpoint = FPath(point,1:end);
    end
    
    diff = abs( FPath(point,1:end) - last ); % Is the
    %distance from the last EE pos actually big enough to change thetas
    currentthetag = dposition;  % makes current theta guess the last desired position
    pause(delay);
    
    [FPath,exit] = ZCorrect(FPath);   %Has a key been pressed if so move in
    if exit == 1
        'STOPPED Program'
        break
    end
end
