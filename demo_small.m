clear;clc;close all;

% mex dtw_c.c;

% a=rand(100,1);
% b=rand(120,1);
a = [ 
1
2
3
2
4
5
7
8
6
5
];

b = [
4
5
7
8
6
5
1
2
3
2
];

% cd('/Users/mira/Dropbox/Project-TimeSeries/dynamic_time_warping_v2.1')

% [d1, d3, d4] = testall(a,b);
[d1, d2, L, R, P, OP] = test_dtwm(a, b, 1, 2, 2);
