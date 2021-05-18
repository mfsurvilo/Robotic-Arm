
%% Setup
steps = 10;
%% A
% Path Points
A1 = [0,0];
A2 = [1/3,1];
A3 = [5/3,1];
A4 = A2;
A5 = [1,3];
A6 = [2,0];

A = [A1; A2; A3; A4; A5; A6];
maxx = max(A(:));
A = [A(:,1)/maxx,A(:,2)/maxx]

Ax = [];
Ay = [];

for i = 1:length(A)-1

    dist = fix(  10*sqrt((A(i,1) - A(i+1,1))^2 + (A(i,2) - A(i+1,2))^2) );
    TS = fix(steps*dist);
    
    Axx = linspace(A(i,1),A(i+1,1),TS);
    Ax = [Ax, Axx];
    
    Ayy = linspace(A(i,2),A(i+1,2),TS);
    Ay = [Ay, Ayy];
end

Amaster = ([Ax;Ay]).';
%% B
% % Path Points
B = [0.0089	1.5734
    0.0179	3.0000
    1.0089	3.0082
    1.2232	2.9837
    1.4286	2.9266
    1.5804	2.8043
    1.6786	2.6658
    1.7768	2.5272
    1.8036	2.3641
    1.7679	2.2011
    1.7054	2.0707
    1.6161	1.9402
    1.5089	1.8261
    1.3393	1.6957
    1.1429	1.6630
    0.9375	1.6223
    0.6696	1.5897
    0.4643	1.5734
    0.1429	1.5652
    0.0089	1.5489
    0.0000	0.0000
    0.4018	0.0000
    0.7321	0.0082
    1.0804	0.0000
    1.3929	0.0000
    1.6429	0.0571
    1.8214	0.2283
    1.9375	0.4565
    2.0000	0.7745
    2.0000	1.0761
    1.8482	1.2799
    1.6339	1.3859
    1.4018	1.4837
    1.2232	1.5163
    1.0089	1.5734
    0.7857	1.5815
    0.2411	1.5652
    -0.0089	1.5897] ;

maxx = max(B(:));
B = [B(:,1)/maxx,B(:,2)/maxx]

Bx = [];
By = [];

for i = 1:length(B)-1
    dist = fix(10*sqrt((B(i,1) - B(i+1,1))^2 + (B(i,2) - B(i+1,2))^2) );
    TS = fix(steps*dist);
    
    Bxx = linspace(B(i,1),B(i+1,1),TS);
    Bx = [Bx, Bxx];

    Byy = linspace(B(i,2),B(i+1,2),TS);
    By = [By, Byy];
end

Bmaster = [Bx;By].';
%% C
C = [2	0.723823976
    1.894736842	0.53262519
    1.775743707	0.336874052
    1.633867277	0.186646434
    1.432494279	0.054628225
    1.212814645	0.018209408
    1.025171625	0
    0.787185355	0.031866464
    0.604118993	0.100151745
    0.434782609	0.218512898
    0.247139588	0.373292868
    0.128146453	0.605462822
    0.04576659	0.814871017
    0.004576659	1.037936267
    0	1.224582701
    0	1.456752656
    0.004576659	1.679817906
    0.022883295	1.943854325
    0.086956522	2.216995448
    0.155606407	2.449165402
    0.260869565	2.64491654
    0.416475973	2.82245827
    0.622425629	2.949924127
    0.860411899	3
    1.125858124	2.986342944
    1.372997712	2.895295903
    1.574370709	2.763277693
    1.725400458	2.603945372
    1.85812357	2.380880121
    1.995423341	2.157814871
    ] ;

maxx = max(C(:));
C = [C(:,1)/maxx,C(:,2)/maxx]
Cx = [];
Cy = [];

for i = 1:length(C)-1
    dist = fix(  10*sqrt((C(i,1) - C(i+1,1))^2 + (C(i,2) - C(i+1,2))^2) );
    TS = fix(steps*dist);
    
    Cxx = linspace(C(i,1),C(i+1,1),TS);
    Cx = [Cx, Cxx];

    Cyy = linspace(C(i,2),C(i+1,2),TS);
    Cy = [Cy, Cyy];
end

Cmaster = [Cx;Cy].';
%% D
D = [0	0
    0	3
    0.814159292	3
    1.044247788	2.979310345
    1.221238938	2.95862069
    1.345132743	2.875862069
    1.469026549	2.793103448
    1.575221239	2.710344828
    1.681415929	2.627586207
    1.769911504	2.524137931
    1.840707965	2.420689655
    1.876106195	2.275862069
    1.92920354	2.151724138
    1.946902655	2.006896552
    1.96460177	1.862068966
    2	1.737931034
    2	1.613793103
    2	1.489655172
    2	1.386206897
    2	1.24137931
    1.982300885	1.137931034
    1.96460177	1.013793103
    1.946902655	0.910344828
    1.911504425	0.806896552
    1.85840708	0.682758621
    1.805309735	0.6
    1.734513274	0.496551724
    1.663716814	0.413793103
    1.592920354	0.331034483
    1.504424779	0.227586207
    1.433628319	0.206896552
    1.345132743	0.165517241
    1.256637168	0.103448276
    1.150442478	0.082758621
    1.044247788	0.04137931
    0.955752212	0.020689655
    0.867256637	0.020689655
    0.761061947	0.020689655
    0.672566372	0.04137931
    0.548672566	0.020689655
    0.442477876	0.020689655
    0.336283186	0.020689655
    0.230088496	0.020689655
    0.123893805	0.04137931
    0	0.04137931
    ] ;
maxx = max(D(:));
D = [D(:,1)/maxx,D(:,2)/maxx]
Dx = [];
Dy = [];

for i = 1:length(D)-1
    dist = fix(  10*sqrt((D(i,1) - D(i+1,1))^2 + (D(i,2) - D(i+1,2))^2) );
    TS = fix(steps*dist);
    
    Dxx = linspace(D(i,1),D(i+1,1),TS);
    Dx = [Dx, Dxx];

    Dyy = linspace(D(i,2),D(i+1,2),TS);
    Dy = [Dy, Dyy];
end

Dmaster = [Dx;Dy].';
%% E
% Path Points
E1 = [2,0];
E2 = [0,0];
E3 = [0,3/2];
E4 = [4/3,3/2];
E5 = E3;
E6 = [0,3];
E7 = [2,3];

E = [E1; E2; E3; E4; E5; E6; E7];
maxx = max(E(:));
E = [E(:,1)/maxx,E(:,2)/maxx]
Ex = [];
Ey = [];

for i = 1:length(E)-1
    dist = fix(  10*sqrt((E(i,1) - E(i+1,1))^2 + (E(i,2) - E(i+1,2))^2) );
    TS = fix(steps*dist);
    
    Exx = linspace(E(i,1),E(i+1,1),TS);
    Ex = [Ex, Exx];

    Eyy = linspace(E(i,2),E(i+1,2),TS);
    Ey = [Ey, Eyy];
end

Emaster = [Ex;Ey].';
%% F
% Path Points
F1 = [0,0];
F2 = [0,1.5];
F3 = [1.2,1.5];
F4 = [0,1.5];
F5 = [0,3];
F6 = [2,3];

F = [F1; F2; F3; F4; F5; F6];
maxx = max(F(:));
F = [F(:,1)/maxx,F(:,2)/maxx]
Fx = [];
Fy = [];

for i = 1:length(F)-1  
    dist = fix(  10*sqrt((F(i,1) - F(i+1,1))^2 + (F(i,2) - F(i+1,2))^2) );
    TS = fix(steps*dist);
    
    Fxx = linspace(F(i,1),F(i+1,1),steps);
    Fx = [Fx, Fxx];

    Fyy = linspace(F(i,2),F(i+1,2),steps);
    Fy = [Fy, Fyy];
end

Fmaster = [Fx;Fy].';
%% G
Gx = [];
Gy = [];

G = [1.154867257	1.598130841
    1.884955752	1.592523364
    1.902654867	2.730841121
    1.831858407	2.781308411
    1.747787611	2.842990654
    1.637168142	2.882242991
    1.513274336	2.94953271
    1.362831858	2.977570093
    1.185840708	3
    1	2.988785047
    0.792035398	2.938317757
    0.64159292	2.893457944
    0.526548673	2.809345794
    0.384955752	2.719626168
    0.292035398	2.590654206
    0.199115044	2.45046729
    0.119469027	2.276635514
    0.053097345	2.057943925
    0.017699115	1.78317757
    0	1.514018692
    0.013274336	1.222429907
    0.039823009	0.942056075
    0.092920354	0.712149533
    0.190265487	0.53271028
    0.32300885	0.342056075
    0.460176991	0.213084112
    0.60619469	0.106542056
    0.783185841	0.03364486
    0.977876106	0
    1.168141593	0
    1.349557522	0.028037383
    1.5	0.078504673
    1.663716814	0.145794393
    1.787610619	0.190654206
    1.920353982	0.257943925
    2	0.297196262];

maxx = max(G(:));
G = [G(:,1)/maxx,G(:,2)/maxx]

for i = 1:length(G)-1
    dist = fix( 10*sqrt((G(i,1) - G(i+1,1))^2 + (G(i,2) - G(i+1,2))^2) );
    TS = fix(steps*dist);    
    
    Gxx = linspace(G(i,1),G(i+1,1),TS);
    Gx = [Gx, Gxx];

    Gyy = linspace(G(i,2),G(i+1,2),TS);
    Gy = [Gy, Gyy];
    Gmaster = [Gx;Gy].'
    figure
    scatter(Gmaster(:,1),Gmaster(:,2));
end


%% H
% Path Points
H1 = [0,0];
H2 = [0,3];
H3 = [0,1.5];
H4 = [2,1.5];
H5 = [2,3];
H6 = [2,0];

H = [H1; H2; H3; H4; H5; H6];
maxx = max(H(:));
H = [H(:,1)/maxx,H(:,2)/maxx]
Hx = [];
Hy = [];

for i = 1:length(H)-1
    dist = fix(  10*sqrt((H(i,1) - H(i+1,1))^2 + (H(i,2) - H(i+1,2))^2) );
    TS = fix(steps*dist);
    
    Hxx = linspace(H(i,1),H(i+1,1),TS);
    Hx = [Hx, Hxx];

    Hyy = linspace(H(i,2),H(i+1,2),TS);
    Hy = [Hy, Hyy];
end

Hmaster = [Hx;Hy].';
%% I

% Path Points
I1 = [0,0];
I2 = [2,0];
I3 = [1,0];
I4 = [1,3];
I5 = [0,3];
I6 = [2,3];

I = [I1; I2; I3; I4; I5; I6];
maxx = max(I(:));
I = [I(:,1)/maxx,I(:,2)/maxx];

Ix = [];
Iy = [];

for i = 1:length(I)-1
    dist = fix(10*sqrt((I(i,1) - I(i+1,1))^2 + (I(i,2) - I(i+1,2))^2) );
    TS = fix(steps*dist);
    
    Ixx = linspace(I(i,1),I(i+1,1),steps);
    Ix = [Ix, Ixx];

    Iyy = linspace(I(i,2),I(i+1,2),steps);
    Iy = [Iy, Iyy];
end

Imaster = [Ix;Iy].';
%% Space
Smaster = [0,0;1,0];
%% Add pen engage variable
Amaster = [Amaster ones(length(Amaster),1)];
Bmaster = [Bmaster ones(length(Bmaster),1)];
Cmaster = [Cmaster ones(length(Cmaster),1)];
Dmaster = [Dmaster ones(length(Dmaster),1)];
Emaster = [Emaster ones(length(Emaster),1)];
Fmaster = [Fmaster ones(length(Fmaster),1)];
Gmaster = [Gmaster ones(length(Gmaster),1)];
Hmaster = [Hmaster ones(length(Hmaster),1)];
Imaster = [Imaster ones(length(Imaster),1)];
Smaster = [Smaster zeros(length(Smaster),1)];
close All

figure
scatter(Amaster(:,1),Amaster(:,2));figure
scatter(Bmaster(:,1),Bmaster(:,2));figure
scatter(Cmaster(:,1),Cmaster(:,2));figure
scatter(Dmaster(:,1),Dmaster(:,2));figure
scatter(Emaster(:,1),Emaster(:,2));figure
scatter(Fmaster(:,1),Fmaster(:,2));figure
scatter(Gmaster(:,1),Gmaster(:,2));figure
scatter(Hmaster(:,1),Hmaster(:,2));figure
scatter(Imaster(:,1),Imaster(:,2))
%% Clear Vars
% clearvars -except Amaster Bmaster Cmaster Dmaster Emaster Fmaster Gmaster ...
%     Imaster Smaster FPath
% save master.mat