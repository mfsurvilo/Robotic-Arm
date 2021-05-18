function [] = Nudge(M,Slist,nudge)
key = 0;
f = 0;

while key ~= 13  % Enter`
    key = getkey; %initilize
    [T,currenteepos,currentthetalist] =  EEPos(M,Slist);
    if f == 0
        desiredeepos = currenteepos;
        f =1;
    end
    if key == 13
        break;
    end
    if key == 30 % Move In (-Z) (Up Arrow)
        desiredeepos = desiredeepos + [0 0 -nudge]
    end
    
    if key == 31 % Move Out (-Z) (Down Arrow)
        desiredeepos = desiredeepos + [0 0 +nudge]
    end
    if key == 28 % Move L (-X)  (Left Arrow)
        desiredeepos = desiredeepos + [-nudge 0 0]
    end
    if key == 29 % Move R (+X)  (Right Arrow)
        desiredeepos = desiredeepos + [nudge 0 0]
    end
    if key == 101 % Move Up (+Y) (E Key)
        desiredeepos = desiredeepos + [0 nudge 0]
    end
    if key == 100 % Move Down (-Y) (D Key)
        desiredeepos = desiredeepos + [0 -nudge 0]
    end
    %%  Move
    if key ~= 13
        dthetalist = EE2Theta(desiredeepos,currentthetalist,Slist,M,ew,ev);
        Talk(2,dthetalist);
    end
end
end