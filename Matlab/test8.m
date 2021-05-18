load  master.mat

for i = 1:Length
    L1 = Lmaster{i};
    if L1 == 'A' | L1 == 'a'
        Temp = Amaster;
        Temp(:,1) = Amaster(:,1)+currentxpos;
    elseif L1 == 'B' | L1 == 'b'
        Temp = Bmaster;
        Temp(:,1) = Bmaster(:,1)+currentxpos;
    elseif L1 == 'C' | L1 == 'c'
        Temp = Cmaster;
        Temp(:,1) = Cmaster(:,1)+currentxpos;
    elseif L1 == 'D' | L1 == 'd'
        Temp = Dmaster;
        Temp(:,1) = Dmaster(:,1)+currentxpos;
    elseif L1 == 'E' | L1 == 'e'
        Temp = Emaster;
        Temp(:,1) = Emaster(:,1)+currentxpos;
    elseif L1 == 'F' | L1 == 'f'
        Temp = Fmaster;
        Temp(:,1) = Fmaster(:,1)+currentxpos;
    elseif L1 == 'G' | L1 == 'g'
        Temp = Gmaster;
        Temp(:,1) = Gmaster(:,1)+currentxpos;
    elseif L1 == 'H' | L1 == 'h'
        Temp = Hmaster;
        Temp(:,1) = Hmaster(:,1)+currentxpos;
    elseif L1 == 'I' | L1 == 'i'
        Temp = Imaster;
        Temp(:,1) = Imaster(:,1)+currentxpos;
    end
    
    FPath = [FPath ; Temp];
    
    % Add a space. . .
    if i ~= Length
    currentxpos = max(FPath(:,1));
    Temp = Smaster;
    Temp(:,1) = Smaster(:,1)+currentxpos;
    FPath = [FPath ; Temp];
    currentxpos = max(FPath(:,1));
    end
end