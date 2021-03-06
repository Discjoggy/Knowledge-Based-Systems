clear;
clc;

D0 = dlmread('wbsa0206_100.dat',';');
D0 = dlmread('wbsa0206_20.dat',';');

D1 = [
1,1,1,0; 
1,0,0,1; 
1,0,1,1; 
0,1,0,1; 
1,1,1,0; 
1,1,1,0; 
1,0,0,1; 
1,1,1,0; 
0,1,0,0; 
1,1,1,0; 
1,1,0,1; 
];

D2 = [
1,1,0,1,1,0,0,0,0,0,0; 
0,1,1,0,0,0,1,1,0,0,1;
0,1,1,0,1,1,0,0,1,0,0;
0,1,1,1,0,0,1,0,1,0,1;
1,0,0,0,1,1,0,0,1,0,0;
0,1,1,1,0,0,0,0,1,1,1;
1,0,0,1,1,0,0,0,1,0,0;
0,1,1,0,0,0,1,0,1,1,1;
1,1,1,1,0,0,0,0,0,0,0;
0,1,0,1,0,0,0,0,0,0,1; 
];

minSupp = 0.4;
minConf = 0.7;

[R, L, S, C] = Rules(D0, minSupp, minConf);
size(R,1)
