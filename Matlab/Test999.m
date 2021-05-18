currenteepos = [0.2008   38.3200  -33.857]
neweepos =      [0.2008   38.3200  -32.8571]
EEposlist = neweepos; 

ew = .01;
ev = .001;

dposition = [];
guessposition = Talk(1,0);
[m,n] = size(EEposlist);


    x = EEposlist(1);
    y = EEposlist(2);
    z = EEposlist(3);
    
    T = [1 0 0 x;
         0 1 0 y;
         0 0 1 z;
         0 0 0 1]
    
    [dpositiont,success] = IKinSpace(Slist,M,T,guessposition',ew,ev);
    
    
    dpositiont = dpositiont' 
    
    for i = 1:5
        if dpositiont(i) < 0
            dpositiont(i) = -wrapTo2Pi(abs(dpositiont(i)))
        else
            dpositiont(i) = wrapTo2Pi(dpositiont(i))
        end
    end
    dpositiont = dpositiont/2/pi*360


    
    dposition = [dposition ; dpositiont]
  
dposition = dposition

    