Ax = [];
Ay = [];
Az = [];

%A = [    A(:,1)    A(:,2)   A];

for i = 1:length(A)-1
    if A(i,3) ~= 10
        dist = sqrt((abs(A(i,1) - A(i+1,1)))^2 + (abs(A(i,2) - A(i+1,2)))^2);
        num = dist/normstep;
        
        Axx = linspace(A(i,1),A(i+1,1),num);
        Ax = [Ax, Axx]
        
        Ayy = linspace(A(i,2),A(i+1,2),num);
        Ay = [Ay, Ayy]
        
         Azz = linspace(A(i,3),A(i+1,3),num);
        Az = [Az, Azz]
        Master = ([Ax;Ay;Az]).'
    else
        
    end
end
Master = ([Ax;Ay;Az]).';