function [FPath] = PathMaker(str ,Amaster,Bmaster,Cmaster,Dmaster,...
    Emaster,Fmaster,Gmaster,Hmaster,Imaster,Smaster)
%% Setup
% clear
% clc
% close ALL
% load master.mat;
currentxpos = 0;

%% Scale Factor
%How many inches wide?
Scalex = 10*2.54;
%How many inches tall?
Scaley = 5*2.54;
 %% User Input
% prompt = "What word would you like me to draw...";
% str = input(prompt,'s');
 L1 = str(1);
 L2 = str(2);
 L3 = str(3);
 L4 = str(4);
 L5 = str(5);

Length = 5;

%% Full Path Creation
Lmaster = {L1 L2 L3 L4 L5};
FPath = [ ];
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
    
    i = i+1;
    %figure
    %plot3(FPath(:,1),FPath(:,2),FPath(:,3));
end

FPath = array2table(FPath);
FPath.Properties.VariableNames = {'x' 'y' 'z'};


%% Normalize first two columns of Full Path To Board Size
% Makes it easily scalable
% 
 Maxx = max(FPath.x);
 Maxy = max(FPath.y);
 FPath.x = FPath.x/Maxx*Scalex;
 FPath.y = FPath.y/Maxy*Scaley;

 
clearvars -except FPath Amaster Bmaster Cmaster Dmaster Emaster Fmaster Gmaster ...
    Imaster Smaster
end