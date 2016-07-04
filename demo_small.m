% Copyright (C) 2013 Quan Wang <wangq10@rpi.edu>,
% Signal Analysis and Machine Perception Laboratory,
% Department of Electrical, Computer, and Systems Engineering,
% Rensselaer Polytechnic Institute, Troy, NY 12180, USA

% this is a demo showing the use of our dynamic time warping package 
% we provide both Matlab version and C/MEX version
% the C/MEX version is much faster and highly recommended


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

% [d1, d2, d3, d4] = testall(a,b);
[D, L, R, P, OP] = test_dtwm(a, b, 0.2, 2, 2);
