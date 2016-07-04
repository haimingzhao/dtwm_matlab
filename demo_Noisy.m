


clear;
clc;
close all;

% mex dtw_c.c;

load('Bigdata.mat')
a=Ncontent(1:1600);
b=Ncontent(2001:3600);

% cd('/Users/mira/Dropbox/Project-TimeSeries/dynamic_time_warping_v2.1')

figure()
subplot(4,1,1)
plot(a)
subplot(4,1,2)
plot(b)

a= dwt(a,'haar');
a= dwt(a,'haar');
a= dwt(a,'haar');

b= dwt(b,'haar');
b= dwt(b,'haar');
b= dwt(b,'haar');

subplot(4,1,3)
plot(a, 'blue')
subplot(4,1,4)
plot(b, 'blue')

% [d1, d2, d3,d4] = testall(a,b);
[D, L, R, P, OP] = test_dtwm(a, b, 0.2, 50/8, 100/8);
