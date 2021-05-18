%% Master Script   3/20/20
%% Setup

clear
addpath ('mr');
clc
close ALL
% All units are in centimeters
delay = 0; 
nudge = .75; % Centimeters
key = 0;
%speed = 20 %Not to exceed 70

cutspace = .5;
ew =.01;
ev = .001;
%% Robot Dims
M = [1 0 0     0;      % End effector position at all thetas = 0
    0 1 0  39.082;    %Could be 38.2
    0 0 1 -34.47;
    0 0 0   1  ];

L1 = 3.756;
L2 = 8.425;
L3 = 5.2;
L4 = 20.32;
L5 = 4.3;
L6 = 10;
L7 = 6.75;

w0 = [0 1 0];
w1 = [-1 0 0];
w2 = [-1 0 0];
w3 = [-1 0 0];
w4 = [0 -1 0];

q0 = [0 L2             L1];
q1 = [0 L2+L3         L1];
q2 = [0 L2+L3+L4      L1];
q3 = [0 L2+L3+L4+L5   -(L6-L1)];
q4 = [0 L2+L3+L4+L5   -(L6+L7-L1)];


Slist =  transpose([[w0 cross(q0,w0)];...
    [w1 cross(q1,w1)];...
    [w2 cross(q2,w2)];...
    [w3 cross(q3,w3)];...
    [w4 cross(q4,w4)]]);
%% FistPump Data
FistPump = [-0.791173626373626,-87.0329956043956,0.878893750000000,87.5976375000000,-1.75780000000000;-0.791173626373626,-86.5934351648352,0.878893750000000,88.1835750000000,-1.75780000000000;-0.791173626373626,-86.5934351648352,0.878893750000000,88.1835750000000,-2.05076875000000;    -0.879085714285714,-85.7143142857143,0.878893750000000,87.3046687500000,-2.05076875000000;-0.879085714285714,-82.9890395604396,0.878893750000000,87.0117000000000,-2.05076875000000;-0.879085714285714,-80.7033252747253,0.878893750000000,85.8398250000000,-2.05076875000000;-0.879085714285714,-77.5384901098901,0.878893750000000,84.6679500000000,-2.05076875000000;-0.791173626373626,-75.1648637362637,0.878893750000000,82.9101375000000,-2.05076875000000;-0.703261538461539,-72.4395890109890,0.878893750000000,81.7382625000000,-2.05076875000000;-0.439525274725275,-69.8901384615385,0.878893750000000,79.9804500000000,-2.05076875000000;-0.175789010989011,-67.4286000000000,0.878893750000000,78.2226375000000,-2.05076875000000;-0.175789010989011,-65.4066219780220,0.878893750000000,76.4648250000000,-2.05076875000000;-0.175789010989011,-64.7033252747253,2.05076875000000,74.9999812500000,-2.05076875000000;-0.175789010989011,-63.0329956043956,2.34373750000000,73.2421687500000,-2.05076875000000;-0.175789010989011,-60.2198087912088,2.34373750000000,71.4843562500000,-2.34373750000000;-0.175789010989011,-56.7033252747253,2.34373750000000,69.4335750000000,-2.34373750000000;-0.175789010989011,-54.0659626373626,2.34373750000000,67.6757625000000,-2.63670625000000;-0.0878769230769231,-51.6044241758242,2.34373750000000,65.3320125000000,-2.63670625000000;0.175859340659341,-49.4945340659341,2.34373750000000,63.5742000000000,-2.63670625000000;0.175859340659341,-47.6483802197802,2.63670625000000,62.1093562500000,-2.63670625000000;0.175859340659341,-45.9780505494506,3.22264375000000,60.9374812500000,-2.63670625000000;0.175859340659341,-42.6373912087912,3.22264375000000,59.4726375000000,-2.63670625000000;0.175859340659341,-39.8242043956044,3.22264375000000,57.7148250000000,-2.63670625000000;0.175859340659341,-37.5384901098901,3.51561250000000,56.2499812500000,-2.63670625000000;0.175859340659341,-35.3406879120879,4.10155000000000,54.7851375000000,-2.92967500000000;0.175859340659341,-33.9340945054945,5.27342500000000,53.6132625000000,-3.51561250000000;0.175859340659341,-32.8791494505495,6.73826875000000,52.7343562500000,-3.51561250000000;0.527507692307692,-32.0000285714286,8.20311250000000,51.2695125000000,-3.80858125000000;0.615419780219780,-30.5055230769231,9.37498750000000,48.9257625000000,-3.80858125000000;0.615419780219780,-28.6593692307692,11.4257687500000,47.7538875000000,-4.10155000000000;0.615419780219780,-27.2527758241758,13.1835812500000,45.7031062500000,-4.10155000000000;0.615419780219780,-25.8461824175824,15.2343625000000,43.3593562500000,-4.10155000000000;0.615419780219780,-24.5275010989011,17.5781125000000,40.1367000000000,-4.10155000000000;0.615419780219780,-22.9450835164835,19.9218625000000,36.9140437500000,-4.10155000000000;0.615419780219780,-20.7472813186813,21.6796750000000,32.8124812500000,-4.10155000000000;0.615419780219780,-18.9890395604396,24.3163937500000,29.0038875000000,-4.10155000000000;0.615419780219780,-16.9670615384615,26.9531125000000,25.7812312500000,-4.10155000000000;0.615419780219780,-13.8901384615385,27.5390500000000,21.9726375000000,-4.10155000000000;0.615419780219780,-10.2857428571429,28.1249875000000,18.4570125000000,-4.39451875000000;0.615419780219780,-7.29673186813187,28.4179562500000,14.9413875000000,-4.39451875000000;0.615419780219780,-5.01101758241758,29.5898312500000,11.7187312500000,-4.39451875000000;0.615419780219780,-2.63739120879121,29.8828000000000,8.20310625000000,-5.27342500000000;0.703331868131868,-0.0879406593406593,30.4687375000000,4.68748125000000,-5.56639375000000;1.67036483516484,2.10986153846154,30.4687375000000,1.17185625000000,-6.15233125000000;2.37366153846154,4.21975164835165,30.4687375000000,-2.05080000000000,-6.15233125000000;2.81322197802198,6.41755384615385,30.4687375000000,-5.27345625000000,-6.15233125000000;3.25278241758242,9.40656483516484,30.4687375000000,-10.5468937500000,-6.15233125000000;3.25278241758242,11.6922791208791,30.4687375000000,-15.8203312500000,-6.15233125000000;3.16487032967033,13.7142571428571,30.4687375000000,-19.9218937500000,-6.15233125000000;3.25278241758242,15.7362351648352,30.4687375000000,-23.4375187500000,-6.15233125000000;3.69234285714286,17.8461252747253,30.1757687500000,-27.8320500000000,-6.15233125000000;3.78025494505495,19.8681032967033,28.7109250000000,-31.3476750000000,-6.15233125000000;3.78025494505495,21.6263450549451,28.1249875000000,-34.8633000000000,-6.15233125000000;3.86816703296703,23.2966747252747,27.8320187500000,-39.2578312500000,-6.15233125000000;3.86816703296703,24.3516197802198,27.8320187500000,-43.6523625000000,-6.15233125000000;3.86816703296703,25.6703010989011,27.5390500000000,-47.7539250000000,-6.15233125000000;3.86816703296703,27.5164549450549,27.5390500000000,-52.4414250000000,-6.15233125000000;4.04399120879121,29.4505208791209,26.9531125000000,-56.2500187500000,-6.15233125000000;4.13190329670330,31.3845868131868,25.1953000000000,-60.6445500000000,-6.15233125000000;4.21981538461538,33.1428285714286,23.7304562500000,-64.1601750000000,-6.15233125000000;4.21981538461538,35.0768945054945,21.3867062500000,-67.6758000000000,-6.15233125000000;4.21981538461538,37.1867846153846,18.7499875000000,-70.8984562500000,-6.15233125000000;4.13190329670330,38.6812901098901,15.2343625000000,-72.9492375000000,-6.15233125000000;3.95607912087912,40.0878835164835,11.7187375000000,-75.0000187500000,-6.15233125000000;3.86816703296703,41.8461252747253,8.20311250000000,-75.5859562500000,-6.15233125000000;3.86816703296703,44.2197516483517,4.39451875000000,-77.9297062500000,-6.15233125000000;3.78025494505495,45.8021692307692,0.878893750000000,-79.9804875000000,-6.15233125000000;3.60443076923077,46.6812901098901,-1.46485625000000,-82.0312687500000,-6.15233125000000;3.51651868131868,47.2966747252747,-4.39454375000000,-83.4961125000000,-6.15233125000000;3.34069450549451,47.8241472527473,-7.03126250000000,-84.6679875000000,-5.85936250000000;3.16487032967033,47.8241472527473,-10.2539187500000,-85.2539250000000,-5.56639375000000;2.72530989010989,47.8241472527473,-13.4765750000000,-85.5468937500000,-5.56639375000000;2.37366153846154,47.8241472527473,-16.9922000000000,-85.5468937500000,-5.56639375000000;2.37366153846154,48.0878835164835,-20.5078250000000,-85.5468937500000,-5.56639375000000;2.28574945054945,48.9670043956044,-24.9023562500000,-86.4258000000000,-5.56639375000000;2.28574945054945,49.7582131868132,-28.4179812500000,-86.7187687500000,-5.56639375000000;2.19783736263736,49.9340373626374,-31.3476687500000,-86.7187687500000,-5.56639375000000;2.10992527472527,49.7582131868132,-34.5703250000000,-86.7187687500000,-5.56639375000000;1.75827692307692,48.8790923076923,-36.9140750000000,-86.7187687500000,-5.56639375000000;1.49454065934066,47.4724989010989,-39.2578250000000,-85.8398625000000,-5.56639375000000;1.49454065934066,46.3296417582418,-41.0156375000000,-84.3750187500000,-5.56639375000000;1.49454065934066,44.8351362637363,-42.7734500000000,-81.1523625000000,-4.68748750000000;1.49454065934066,43.2527186813187,-43.6523562500000,-75.8789250000000,-4.39451875000000;1.49454065934066,41.7582131868132,-44.8242312500000,-71.1914250000000,-3.80858125000000;1.75827692307692,39.6483230769231,-44.8242312500000,-66.5039250000000,-3.22264375000000;1.93410109890110,37.7142571428571,-44.8242312500000,-61.8164250000000,-2.63670625000000;1.93410109890110,35.6043670329670,-44.8242312500000,-56.5429875000000,-1.75780000000000;2.19783736263736,34.1098615384615,-44.8242312500000,-51.8554875000000,-1.46483125000000;2.28574945054945,32.5274439560440,-44.8242312500000,-46.5820500000000,-1.46483125000000;2.28574945054945,30.9450263736264,-44.8242312500000,-41.8945500000000,-1.46483125000000;2.28574945054945,29.3626087912088,-44.8242312500000,-37.2070500000000,-1.46483125000000;2.46157362637363,27.7801912087912,-44.8242312500000,-31.9336125000000,-1.46483125000000;2.90113406593407,26.4615098901099,-44.8242312500000,-26.9531437500000,-1.46483125000000;3.51651868131868,24.9670043956044,-43.9453250000000,-21.6797062500000,-1.46483125000000;3.78025494505495,23.9120593406593,-43.9453250000000,-16.9922062500000,-1.46483125000000;4.48355164835165,22.5054659340659,-42.7734500000000,-12.3047062500000,-1.46483125000000;4.92311208791209,21.7142571428571,-41.0156375000000,-9.08205000000000,-1.46483125000000;4.92311208791209,21.4505208791209,-38.6718875000000,-7.91017500000000,-1.46483125000000;4.92311208791209,20.8351362637363,-35.1562625000000,-7.32423750000000,-1.46483125000000;4.83520000000000,19.8681032967033,-31.0547000000000,-7.03126875000000,-1.46483125000000;4.83520000000000,18.2856857142857,-26.6601687500000,-7.03126875000000,-1.46483125000000;4.83520000000000,16.7032681318681,-21.9726687500000,-6.44533125000000,-1.46483125000000;4.92311208791209,15.9120593406593,-19.0429812500000,-3.22267500000000,-1.46483125000000;4.83520000000000,14.9450263736264,-17.8711062500000,2.05076250000000,-1.46483125000000;4.83520000000000,13.8900813186813,-15.2343875000000,5.56638750000000,-1.46483125000000;4.92311208791209,13.7142571428571,-12.0117312500000,7.03123125000000,-1.46483125000000;5.27476043956044,13.5384329670330,-8.78907500000000,9.37498125000000,-1.46483125000000;5.27476043956044,13.3626087912088,-6.15235625000000,12.0117000000000,-1.46483125000000;5.27476043956044,13.3626087912088,-4.10157500000000,15.8202937500000,-1.46483125000000;5.01102417582418,13.3626087912088,-1.46485625000000,19.0429500000000,-1.46483125000000;5.18684835164835,13.3626087912088,2.05076875000000,19.9218562500000,-1.17186250000000;5.18684835164835,13.5384329670330,6.73826875000000,19.3359187500000,-1.17186250000000;5.09893626373626,13.3626087912088,10.5468625000000,18.1640437500000,-1.17186250000000;5.09893626373626,13.3626087912088,13.7695187500000,15.5273250000000,-1.17186250000000;5.01102417582418,13.2746967032967,18.1640500000000,10.8398250000000,-1.17186250000000;4.92311208791209,13.1867846153846,22.2656125000000,4.68748125000000,-1.17186250000000;4.92311208791209,13.1867846153846,26.0742062500000,-1.46486250000000,-1.17186250000000;4.92311208791209,13.3626087912088,27.5390500000000,-8.49611250000000,-1.75780000000000;4.92311208791209,13.8021692307692,29.2968625000000,-15.5273625000000,-1.46483125000000;5.01102417582418,14.5933780219780,30.4687375000000,-22.5586125000000,-1.46483125000000;5.18684835164835,16.4395318681319,30.7617062500000,-30.4687687500000,-1.46483125000000;5.36267252747253,17.5823890109890,30.4687375000000,-38.3789250000000,-1.46483125000000;5.36267252747253,19.8681032967033,28.7109250000000,-43.9453312500000,-1.46483125000000;5.36267252747253,21.3626087912088,26.9531125000000,-49.2187687500000,-1.17186250000000;5.36267252747253,21.9779934065934,24.9023312500000,-52.1484562500000,-1.17186250000000;5.80223296703297,24.2637076923077,21.6796750000000,-53.9062687500000,-1.17186250000000;6.32970549450550,27.5164549450549,15.8203000000000,-55.9570500000000,-0.585925000000000;6.41761758241758,29.0109604395604,9.96092500000000,-57.1289250000000,0.585950000000000;6.50552967032967,29.3626087912088,5.56639375000000,-57.1289250000000,1.75782500000000;6.85717802197802,29.7142571428571,0.878893750000000,-57.1289250000000,2.63673125000000;7.03300219780220,31.2087626373626,-4.39454375000000,-57.1289250000000,4.10157500000000;7.38465054945055,32.8790923076923,-9.08204375000000,-57.1289250000000,4.68751250000000;7.47256263736264,34.0219494505495,-13.7695437500000,-57.1289250000000,4.98048125000000;7.47256263736264,34.9010703296703,-17.8711062500000,-57.1289250000000,5.27345000000000;7.47256263736264,35.1648065934066,-21.6797000000000,-57.1289250000000,5.27345000000000;7.47256263736264,35.0768945054945,-25.4882937500000,-56.8359562500000,5.85938750000000;7.38465054945055,34.2856857142857,-28.4179812500000,-56.5429875000000,6.44532500000000;7.38465054945055,32.5274439560440,-29.2968875000000,-56.5429875000000,6.73829375000000;7.47256263736264,30.5933780219780,-29.2968875000000,-56.5429875000000,6.73829375000000;7.47256263736264,29.0988725274725,-29.2968875000000,-56.5429875000000,6.73829375000000;7.12091428571429,26.2856857142857,-28.4179812500000,-56.8359562500000,7.32423125000000;7.12091428571429,24.1757956043956,-26.6601687500000,-57.1289250000000,8.20313750000000;7.12091428571429,21.2746967032967,-24.0234500000000,-57.7148625000000,8.78907500000000;7.03300219780220,17.6703010989011,-20.2148562500000,-58.0078312500000,9.37501250000000;7.12091428571429,15.4724989010989,-16.1132937500000,-59.4726750000000,9.66798125000000;7.38465054945055,12.3955758241758,-11.1328250000000,-60.9375187500000,10.5468875000000;7.38465054945055,9.05491648351648,-6.15235625000000,-61.8164250000000,11.1328250000000;7.38465054945055,6.15381758241758,-1.17188750000000,-62.1093937500000,11.4257937500000;7.47256263736264,2.81315824175824,3.22264375000000,-62.4023625000000,11.4257937500000;7.38465054945055,-0.175852747252747,8.20311250000000,-62.9883000000000,11.4257937500000;7.47256263736264,-2.81321538461538,12.3046750000000,-63.5742375000000,11.4257937500000;7.47256263736264,-5.36266593406594,16.4062375000000,-63.5742375000000,11.4257937500000;7.47256263736264,-8.43958901098901,21.3867062500000,-63.5742375000000,11.4257937500000;7.47256263736264,-12.3956329670330,26.3671750000000,-63.5742375000000,11.4257937500000;7.56047472527473,-14.7692593406593,28.4179562500000,-64.1601750000000,11.4257937500000;7.47256263736264,-16.7033252747253,30.4687375000000,-65.0390812500000,11.4257937500000;7.47256263736264,-19.0769516483517,33.1054562500000,-65.3320500000000,11.4257937500000;7.56047472527473,-21.4505780219780,34.5703000000000,-65.9179875000000,11.4257937500000;7.47256263736264,-23.5604681318681,36.3281125000000,-67.3828312500000,11.4257937500000;7.47256263736264,-25.3187098901099,38.3788937500000,-68.5547062500000,11.4257937500000;7.47256263736264,-27.6923362637363,40.4296750000000,-70.0195500000000,11.4257937500000;7.47256263736264,-29.5384901098901,42.1874875000000,-72.3633000000000,11.4257937500000;7.47256263736264,-30.0659626373626,43.9453000000000,-75.5859562500000,11.4257937500000;7.47256263736264,-30.1538747252747,44.5312375000000,-78.8086125000000,11.4257937500000;7.47256263736264,-30.6813472527473,45.7031125000000,-81.7383000000000,11.4257937500000;7.47256263736264,-31.8242043956044,47.7538937500000,-84.0820500000000,11.4257937500000;7.47256263736264,-33.4945340659341,50.0976437500000,-86.4258000000000,11.4257937500000;7.56047472527473,-34.5494791208791,51.8554562500000,-89.0625187500000,11.4257937500000;7.56047472527473,-34.9890395604396,53.3203000000000,-91.4062687500000,11.4257937500000;7.56047472527473,-34.8132153846154,53.9062375000000,-92.8711125000000,11.4257937500000;7.56047472527473,-34.9011274725275,54.1992062500000,-93.7500187500000,11.4257937500000;7.56047472527473,-34.9890395604396,55.0781125000000,-95.2148625000000,11.1328250000000;7.56047472527473,-34.9890395604396,55.6640500000000,-96.3867375000000,11.1328250000000;7.56047472527473,-34.9890395604396,56.5429562500000,-98.1445500000000,11.1328250000000;7.56047472527473,-35.0769516483517,57.7148312500000,-100.781268750000,11.1328250000000;7.56047472527473,-35.4286000000000,59.4726437500000,-102.832050000000,11.1328250000000;7.47256263736264,-38.8571714285714,63.2812375000000,-102.832050000000,11.1328250000000;7.56047472527473,-40.9670615384615,67.0898312500000,-102.832050000000,11.4257937500000;7.47256263736264,-42.3736549450549,68.5546750000000,-102.832050000000,11.4257937500000;8.00003516483517,-42.9011274725275,68.5546750000000,-102.832050000000,11.4257937500000;8.00003516483517,-43.9560725274725,68.5546750000000,-102.832050000000,11.4257937500000;8.00003516483517,-45.0110175824176,68.8476437500000,-102.832050000000,11.4257937500000;8.00003516483517,-46.0659626373626,68.8476437500000,-102.832050000000,11.4257937500000;8.00003516483517,-45.6264021978022,68.2617062500000,-102.832050000000,11.1328250000000;8.00003516483517,-44.6593692307692,66.2109250000000,-102.832050000000,11.1328250000000;8.00003516483517,-41.8461824175824,62.9882687500000,-102.832050000000,9.96095000000000;8.00003516483517,-39.5604681318681,58.8867062500000,-102.246112500000,8.78907500000000;8.00003516483517,-38.2417868131868,55.0781125000000,-101.953143750000,7.61720000000000;8.00003516483517,-35.5165120879121,51.2695187500000,-101.953143750000,6.73829375000000;8.00003516483517,-32.7033252747253,45.9960812500000,-101.953143750000,6.15235625000000;8.00003516483517,-31.4725560439560,42.4804562500000,-98.4375187500000,5.56641875000000;8.00003516483517,-29.9780505494506,38.3788937500000,-95.2148625000000,5.27345000000000;8.00003516483517,-27.5165120879121,32.8124875000000,-92.5781437500000,4.39454375000000;8.00003516483517,-25.3187098901099,27.8320187500000,-89.3554875000000,4.39454375000000;8.00003516483517,-23.9121164835165,23.7304562500000,-86.7187687500000,3.80860625000000;8.00003516483517,-22.3296989010989,18.7499875000000,-83.7890812500000,3.51563750000000;8.00003516483517,-20.4835450549451,13.4765500000000,-80.2734562500000,3.51563750000000;8.00003516483517,-18.8132153846154,9.08201875000000,-77.6367375000000,3.51563750000000;8.00003516483517,-15.9121164835165,3.22264375000000,-75.0000187500000,3.51563750000000;8.00003516483517, -12.9231054945055,-2.05079375000000,-72.9492375000000,3.51563750000000;8.00003516483517,-11.2527758241758,-7.03126250000000,-70.0195500000000,3.51563750000000;8.00003516483517,-9.75827032967033,-12.0117312500000,-66.7968937500000,3.51563750000000;8.00003516483517,-8.08794065934066,-16.6992312500000,-63.5742375000000,3.51563750000000;8.00003516483517,-6.76925934065934,-20.8007937500000,-60.9375187500000,3.51563750000000;8.00003516483517,-5.36266593406594,-24.9023562500000,-58.5937687500000,3.51563750000000;7.91212307692308,-4.39563296703297,-28.7109500000000,-55.3711125000000,3.51563750000000;7.73629890109890,-3.16486373626374,-32.8125125000000,-52.1484562500000,3.51563750000000;7.64838681318681,-2.37365494505495,-36.6211062500000,-48.9258000000000,3.51563750000000;7.64838681318681,-1.40662197802198,-40.4297000000000,-46.5820500000000,3.80860625000000;7.64838681318681,-1.05497362637363,-43.3593875000000,-43.6523625000000,3.80860625000000;7.64838681318681,-0.527501098901099,-46.8750125000000,-41.3086125000000,3.80860625000000;7.82421098901099,-0.791237362637363,-49.5117312500000,-38.3789250000000,3.80860625000000;8.00003516483517,-1.67035824175824,-48.9257937500000,-37.5000187500000,3.51563750000000;8.00003516483517,-2.46156703296703,-46.2890750000000,-38.0859562500000,3.51563750000000;7.73629890109890,-3.51651208791209,-44.2382937500000,-38.9648625000000,2.92970000000000;8.00003516483517,-5.80222637362637,-41.0156375000000,-39.5508000000000,3.51563750000000;8.00003516483517,-7.56046813186813,-37.2070437500000,-41.6015812500000,3.51563750000000;8.00003516483517,-8.79123736263736,-33.3984500000000,-44.5312687500000,2.92970000000000;8.00003516483517,-10.9890395604396,-28.7109500000000,-46.8750187500000,3.51563750000000;8.00003516483517,-12.9231054945055,-24.0234500000000,-50.0976750000000,2.92970000000000;8.00003516483517,-14.2417868131868,-19.9218875000000,-53.3203312500000,2.92970000000000;8.00003516483517,-15.9121164835165,-15.2343875000000,-55.6640812500000,2.92970000000000;8.00003516483517,-18.0220065934066,-10.2539187500000,-58.5937687500000,2.92970000000000;8.00003516483517,-19.9560725274725,-4.68751250000000,-61.5234562500000,2.92970000000000;8.00003516483517,-21.9780505494506,0.878893750000000,-65.0390812500000,3.51563750000000;8.00003516483517,-24.0000285714286,6.44530000000000,-67.9687687500000,3.51563750000000;7.64838681318681,-26.7253032967033,13.4765500000000,-70.8984562500000,2.92970000000000;7.64838681318681,-28.8351934065934,20.2148312500000,-74.7070500000000,2.92970000000000;7.73629890109890,-31.2088197802198,26.3671750000000,-78.8086125000000,2.92970000000000;7.91212307692308,-32.6154131868132,31.3476437500000,-82.3242375000000,2.92970000000000;8.00003516483517,-33.9340945054945,36.3281125000000,-86.4258000000000,3.51563750000000;8.00003516483517,-35.6923362637363,42.1874875000000,-90.2343937500000,2.92970000000000;8.00003516483517,-37.0110175824176,47.4609250000000,-93.4570500000000,3.51563750000000;7.64838681318681,-37.8901384615385,52.1484250000000,-97.2656437500000,2.92970000000000;8.00003516483517,-39.2088197802198,57.1288937500000,-100.488300000000,2.92970000000000;8.00003516483517,-40.7912373626374,60.3515500000000,-102.539081250000,2.92970000000000;8.00003516483517,-43.8681604395604,63.2812375000000,-102.539081250000,2.92970000000000;8.00003516483517,-47.5604681318681,66.2109250000000,-102.539081250000,3.51563750000000;8.00003516483517,-49.4066219780220,68.2617062500000,-102.539081250000,2.92970000000000;8.00003516483517,-50.9011274725275,70.3124875000000,-102.539081250000,2.92970000000000;8.00003516483517,-53.2747538461539,72.9492062500000,-102.539081250000,2.92970000000000;8.00003516483517,-55.2088197802198,75.5859250000000,-102.832050000000,2.05079375000000;8.43959560439560,-54.3296989010989,74.7070187500000,-102.539081250000,2.05079375000000;8.52750769230769,-52.8351934065934,73.2421750000000,-102.539081250000,2.05079375000000;8.52750769230769,-49.1428857142857,69.1406125000000,-102.539081250000,2.34376250000000;9.75827692307692,-46.5934351648352,65.3320187500000,-102.246112500000,3.51563750000000;9.93410109890110,-43.8681604395604,61.5234250000000,-101.953143750000,5.56641875000000;9.93410109890110,-41.0549736263736,57.4218625000000,-101.953143750000,7.03126250000000;9.93410109890110,-38.4176109890110,53.9062375000000,-101.953143750000,8.20313750000000;9.84618901098901,-35.2527758241758,50.3906125000000,-101.367206250000,9.37501250000000;9.75827692307692,-31.9121164835165,45.9960812500000,-100.488300000000,11.1328250000000;9.93410109890110,-29.3626659340659,42.1874875000000,-98.1445500000000,12.5976687500000;9.58245274725275,-26.9011274725275,37.2070187500000,-95.2148625000000,14.0625125000000;9.67036483516484,-25.1428857142857,32.5195187500000,-90.8203312500000,15.8203250000000;9.84618901098901,-23.9121164835165,28.4179562500000,-86.1328312500000,17.8711062500000;9.67036483516484,-23.5604681318681,26.3671750000000,-81.4453312500000,18.7500125000000;9.67036483516484,-23.2967318681319,23.7304562500000,-76.4648625000000,19.6289187500000;9.58245274725275,-22.6813472527473,20.8007687500000,-71.1914250000000,20.2148562500000;9.58245274725275,-21.5384901098901,18.1640500000000,-67.6758000000000,21.0937625000000;9.49454065934066,-20.4835450549451,16.4062375000000,-62.9883000000000,22.5586062500000;9.58245274725275,-20.5714571428571,16.1132687500000,-58.5937687500000,24.3164187500000;9.49454065934066,-20.4835450549451,15.5273312500000,-54.7851750000000,24.9023562500000;9.49454065934066,-20.4835450549451,15.2343625000000,-50.9765812500000,25.4882937500000;9.58245274725275,-20.4835450549451,14.3554562500000,-47.7539250000000,26.0742312500000;9.67036483516484,-20.4835450549451,13.4765500000000,-43.6523625000000,27.5390750000000;9.84618901098901,-19.8681604395604,12.5976437500000,-40.1367375000000,29.0039187500000;9.67036483516484,-18.9011274725275,11.4257687500000,-36.3281437500000,30.7617312500000;9.84618901098901,-17.8461824175824,9.96092500000000,-33.3984562500000,32.2265750000000;9.84618901098901,-17.3187098901099,9.37498750000000,-30.4687687500000,33.9843875000000;9.58245274725275,-17.0549736263736,9.37498750000000,-27.8320500000000,35.7422000000000;9.84618901098901,-14.7692593406593,8.20311250000000,-25.4883000000000,37.7929812500000;9.84618901098901,-13.2747538461538,7.32420625000000,-23.1445500000000,39.5507937500000;9.84618901098901,-12.2198087912088,7.03123750000000,-21.0937687500000,40.4297000000000;9.58245274725275,-11.5165120879121,6.73826875000000,-19.0429875000000,41.8945437500000;9.58245274725275,-11.3406879120879,6.73826875000000,-17.2851750000000,43.0664187500000;9.40662857142857,-11.1648637362637,6.73826875000000,-15.2343937500000,44.8242312500000;9.40662857142857,-10.4615670329670,6.44530000000000,-13.7695500000000,46.8750125000000;8.35168351648352,-10.2857428571429,6.44530000000000,-12.3047062500000,50.3906375000000;8.08794725274725,-10.1099186813187,6.44530000000000,-11.1328312500000,52.7343875000000;8.08794725274725,-9.05497362637363,6.44530000000000,-10.2539250000000,55.0781375000000;8.08794725274725,-8.61541318681319,6.44530000000000,-8.78908125000000,57.7148562500000;8.08794725274725,-8.17585274725275,6.44530000000000,-8.20314375000000,59.7656375000000;7.20882637362637,-7.64838021978022,6.44530000000000,-7.61720625000000,61.8164187500000;5.97805714285714,-6.50552307692308,6.44530000000000,-7.61720625000000,63.8672000000000;4.13190329670330,-6.32969890109890,6.15233125000000,-7.61720625000000,65.0390750000000;1.84618901098901,-5.53849010989011,6.15233125000000,-7.61720625000000,66.5039187500000;-1.93403076923077,-5.53849010989011,6.15233125000000,-7.61720625000000,66.5039187500000;-3.42853626373626,-5.62640219780220,6.15233125000000,-7.61720625000000,66.5039187500000;-4.83512967032967,-5.71431428571429,6.15233125000000,-7.61720625000000,66.5039187500000;-8.79117362637363,-6.06596263736264,6.15233125000000,-7.32423750000000,66.5039187500000;-11.3406241758242,-6.24178681318681,6.15233125000000,-5.56642500000000,66.5039187500000;-13.4505142857143,-6.68134725274725,6.15233125000000,-4.98048750000000,66.5039187500000;-15.1208439560440,-6.76925934065934,5.85936250000000,-3.80861250000000,66.7968875000000;-17.2307340659341,-6.41761098901099,5.85936250000000,-2.92970625000000,67.0898562500000;-17.3186461538462,-6.32969890109890,5.85936250000000,-1.46486250000000,68.5547000000000;-17.4065582417582,-6.68134725274725,5.85936250000000,-0.878925000000000,71.1914187500000;-17.0549098901099,-6.32969890109890,5.85936250000000,-0.292987500000000,75.5859500000000;-17.2307340659341,-6.32969890109890,5.85936250000000,-0.585956250000000,80.5664187500000;-17.3186461538462,-6.32969890109890,5.85936250000000,-0.585956250000000,85.5468875000000;-17.3186461538462,-6.32969890109890,5.85936250000000,-0.585956250000000,89.9414187500000;-17.3186461538462,-6.32969890109890,5.85936250000000,-0.585956250000000,94.3359500000000;-17.3186461538462,-6.32969890109890,5.85936250000000,-0.585956250000000,98.1445437500000;-17.1428219780220,-6.32969890109890,6.15233125000000,-0.878925000000000,102.246106250000;-17.3186461538462,-6.41761098901099,6.15233125000000,-1.17189375000000,104.003918750000;-18.1098549450549,-6.50552307692308,6.15233125000000,-1.17189375000000,104.003918750000;-18.1098549450549,-6.68134725274725,6.73826875000000,-1.87500000001783e-05,102.246106250000;-18.2856791208791,-6.50552307692308,6.15233125000000,-1.87500000001783e-05,97.5586062500000;-18.7252395604396,-6.32969890109890,5.85936250000000,0.292950000000000,90.2343875000000;-18.8131516483517,-6.24178681318681,5.85936250000000,0.292950000000000,82.9101687500000;-19.5164483516484,-6.24178681318681,5.85936250000000,0.292950000000000,76.7578250000000;-19.9560087912088,-6.24178681318681,5.85936250000000,0.292950000000000,69.7265750000000;-20.2197450549451,-6.24178681318681,5.85936250000000,0.292950000000000,64.1601687500000;-20.3076571428571,-6.24178681318681,5.85936250000000,0.292950000000000,58.5937625000000;-20.9230417582418,-6.15387472527473,5.85936250000000,0.292950000000000,52.7343875000000;-21.8021626373626,-6.24178681318681,5.85936250000000,0.292950000000000,47.1679812500000;-22.4175472527473,-6.24178681318681,5.85936250000000,0.292950000000000,41.8945437500000;-22.4175472527473,-6.06596263736264,5.85936250000000,0.292950000000000,36.9140750000000;-22.5054593406593,-5.53849010989011,5.85936250000000,0.292950000000000,32.2265750000000;-22.5054593406593,-5.09892967032967,5.85936250000000,-1.87500000001783e-05,26.6601687500000;-22.4175472527473,-5.01101758241758,5.85936250000000,-0.292987500000000,21.3867312500000;-21.9779868131868,-4.92310549450550,5.85936250000000,-0.292987500000000,17.5781375000000;-18.3735912087912,-4.92310549450550,5.85936250000000,-0.292987500000000,18.4570437500000;-18.1098549450549,-4.83519340659341,5.85936250000000,-0.292987500000000,23.4375125000000;-17.2307340659341,-4.65936923076923,5.56639375000000,-0.292987500000000,29.2968875000000;-17.0549098901099,-4.92310549450550,5.56639375000000,-0.585956250000000,35.7422000000000;-17.0549098901099,-5.36266593406594,5.56639375000000,-0.292987500000000,42.4804812500000;-17.0549098901099,-5.36266593406594,5.56639375000000,-0.292987500000000,49.5117312500000;-17.1428219780220,-5.36266593406594,5.56639375000000,-0.292987500000000,55.3711062500000;-17.0549098901099,-5.36266593406594,5.56639375000000,-0.292987500000000,61.8164187500000;-17.3186461538462,-5.27475384615385,5.85936250000000,-0.585956250000000,68.2617312500000;-17.3186461538462,-5.09892967032967,5.85936250000000,-0.292987500000000,75.2929812500000;-17.3186461538462,-5.18684175824176,5.56639375000000,-0.292987500000000,83.4961062500000;-17.3186461538462,-5.09892967032967,5.56639375000000,-0.585956250000000,90.2343875000000;-17.6702945054945,-5.09892967032967,5.27342500000000,-0.585956250000000,97.2656375000000;-17.6702945054945,-5.53849010989011,6.44530000000000,-0.585956250000000,103.417981250000;-17.6702945054945,-6.15387472527473,6.73826875000000,-0.585956250000000,103.417981250000;-17.4065582417582,-6.85717142857143,7.91014375000000,-0.292987500000000,102.539075000000;-17.0549098901099,-7.03299560439560,8.20311250000000,-1.87500000001783e-05,99.6093875000000;-17.4065582417582,-7.12090769230769,7.91014375000000,-1.87500000001783e-05,95.8007937500000;-18.1977670329670,-7.03299560439560,7.32420625000000,-0.292987500000000,91.6992312500000;-18.7252395604396,-7.03299560439560,7.03123750000000,-1.87500000001783e-05,86.4257937500000;-18.7252395604396,-6.94508351648352,6.73826875000000,-1.87500000001783e-05,80.5664187500000;-18.7252395604396,-6.85717142857143,6.73826875000000,-1.87500000001783e-05,73.5351687500000;-18.8131516483517,-7.03299560439560,6.44530000000000,0.292950000000000,67.0898562500000;-18.8131516483517,-7.03299560439560,6.15233125000000,0.292950000000000,59.7656375000000;-18.9010637362637,-7.03299560439560,5.85936250000000,0.292950000000000,51.2695437500000;-18.9010637362637,-6.85717142857143,5.85936250000000,0.585918750000000,43.9453250000000;-18.8131516483517,-7.03299560439560,5.85936250000000,1.17185625000000,36.3281375000000;-18.9010637362637,-7.29673186813187,5.85936250000000,1.75779375000000,28.4179812500000;-18.9010637362637,-7.82420439560440,5.85936250000000,2.34373125000000,22.5586062500000;-18.9889758241758,-8.08794065934066,5.85936250000000,3.51560625000000,17.8711062500000;-18.7252395604396,-9.05497362637363,5.85936250000000,5.27341875000000,13.7695437500000;-18.6373274725275,-9.58244615384615,5.85936250000000,6.73826250000000,9.66798125000000;-18.6373274725275,-9.75827032967033,5.85936250000000,6.73826250000000,5.85938750000000;-17.6702945054945,-9.75827032967033,5.85936250000000,7.03123125000000,2.34376250000000;-12.4834813186813,-10.5494791208791,5.56639375000000,8.20310625000000,1.17188750000000;-9.93403076923077,-12.2198087912088,5.27342500000000,9.66795000000000,0.292981250000000;-7.03293186813187,-14.5055230769231,5.27342500000000,11.1327937500000,1.24999999999709e-05;-6.50545934065934,-17.3187098901099,5.27342500000000,11.4257625000000,1.24999999999709e-05;-6.50545934065934,-20.7472813186813,5.27342500000000,12.5976375000000,-1.17186250000000;-6.41754725274725,-24.5275010989011,6.15233125000000,14.3554500000000,-2.63670625000000;-6.41754725274725,-27.5165120879121,7.32420625000000,16.9921687500000,-3.22264375000000;-3.07688791208791,-30.6813472527473,7.32420625000000,21.3867000000000,-2.92967500000000;-1.75820659340659,-34.5494791208791,8.49608125000000,26.9531062500000,-2.63670625000000;-1.31864615384615,-38.1538747252747,9.37498750000000,32.2265437500000,-2.63670625000000;-1.05490989010989,-42.6373912087912,9.96092500000000,35.7421687500000,-2.63670625000000;-0.703261538461539,-48.1758527472528,11.7187375000000,39.2577937500000,-2.05076875000000;-0.351613186813187,-52.6593692307692,12.0117062500000,43.0663875000000,-1.75780000000000;-0.351613186813187,-56.0000285714286,12.0117062500000,46.2890437500000,-1.75780000000000;-0.615349450549450,-59.2527758241758,11.7187375000000,49.5117000000000,-1.46483125000000;-0.527437362637363,-61.9780505494506,10.8398312500000,51.8554500000000,-0.878893750000000;-0.615349450549450,-63.4725560439561,9.66795625000000,55.3710750000000,-0.585925000000000;-0.527437362637363,-66.0220065934066,9.66795625000000,58.3007625000000,-0.585925000000000;-0.263701098901099,-69.3626659340659,9.66795625000000,61.5234187500000,-0.585925000000000;-0.351613186813187,-72.1758527472528,9.66795625000000,63.8671687500000,-0.585925000000000;-0.263701098901099,-74.5494791208791,9.66795625000000,65.9179500000000,-0.878893750000000;-0.439525274725275,-76.3956329670330,9.37498750000000,67.9687312500000,-0.878893750000000;-0.615349450549450,-77.3626659340659,9.08201875000000,69.4335750000000,-0.878893750000000;-0.175789010989011,-77.9780505494506,8.20311250000000,71.4843562500000,-0.878893750000000;-0.175789010989011,-79.4725560439561,7.03123750000000,74.1210750000000,-0.585925000000000;-0.351613186813187,-81.4945340659341,6.44530000000000,75.8788875000000,-0.878893750000000];
%% Get Home
%Talk(7,speed);
ready = [0 0 0 0 0 ];
prone = [0 -90 0 90 0];
closetoboard = [25.7583   73.0549   -1.1719  -71.1914   28.1250];

Talk(2,ready);
%% Insert Pen 
Talk(5,512);
'Press Enter when pen is inserted'
while key ~= 13
    key = getkey;    
end

Talk(5,770);
clc
'Nudge Into Bottom Left Position Then Press Enter'
%% Manual Control to Find (0,0,0)
key = 0;
f = 0;

while key ~= 13  % Enter`
    key = getkey; %initilize
    [T,currenteepos,currentthetalist] =  EEPos(M,Slist);
    if f == 0
       desiredeepos = currenteepos;
       f=1;
    end
    if key == 27   % Esc Button
        return;
        
    end
    if key == 13
        break;
    end
    if key == 30 % Move In (-Z) (Up Arrow)
        desiredeepos = desiredeepos + [0 0 -nudge];
    end
    
    if key == 31 % Move Out (-Z) (Down Arrow)
        desiredeepos = desiredeepos + [0 0 +nudge];
    end
    if key == 28 % Move L (-X)  (Left Arrow)
        desiredeepos = desiredeepos + [-nudge 0 0];
    end
    if key == 29 % Move R (+X)  (Right Arrow)
        desiredeepos = desiredeepos + [nudge 0 0];
    end
    if key == 101 % Move Up (+Y) (E Key)
        desiredeepos = desiredeepos + [0 nudge 0];
    end
    if key == 100 % Move Down (-Y) (D Key)
        desiredeepos = desiredeepos + [0 -nudge 0];
    end
    %%  Move
    if key ~= 13
        dthetalist = EE2Theta(desiredeepos,currentthetalist,Slist,M,ew,ev);
        Talk(2,dthetalist);
    end
end
[T,eeorgin] = EEPos(M,Slist);
%% User Input
%clc
prompt = "What word would you like me to draw...";
str = input(prompt,'s');
%str = 'ABFFF';
% L1 = str(1);
% L2 = str(2);
% L3 = str(3);
% L4 = str(4);
% L5 = str(5);
% Length = length(str);
%% Get combined path
DiscretizedLetters();
load master.mat
FPath = PathMaker(str,Amaster,Bmaster,Cmaster,Dmaster,...
    Emaster,Fmaster,Gmaster,Hmaster,Imaster,Smaster);

FPath = table2array(FPath);

FPath = Cut(FPath,.25);  % Cut up into pieces


FPath(:,1) = FPath(:,1) + eeorgin(1); % Adds orgin points to put path on board
FPath(:,2) = FPath(:,2) + eeorgin(2);
FPath(:,3) = FPath(:,3) + eeorgin(3);
%% Follow FPath
[r,c] = size(FPath);
diff = .5; %initializing
threshold = .05;

figure('units','normalized','outerposition',[0 0 1 1])
p2 = scatter3(FPath(:,1),FPath(:,2),FPath(:,3),'MarkerFaceColor','b')
hold on

pause
currentthetag = Talk(1,0);
ListenChar();
FlushEvents();
for point = 1:length(FPath)  % Follow each point
    x = FPath(point,1);
    y = FPath(point,2);
    z = FPath(point,3);
    scatter3(x,y,z,'MarkerFaceColor','r','LineWidth',2)
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
        break
    end
end

Talk(2,prone);
%% FistPump
[r,c] = size(FistPump)
for i= 1:r
    go = FistPump(i,:);
    %pause(10/1000)
    Talk(2,go);
end

pause(1);
Talk(2,[0 0 0 90 0]);
pause(3)
Talk(5,512);