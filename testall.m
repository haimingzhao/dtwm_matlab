function [d1, d3, d4] = testall(a, b)

d1=dtw(a,b);

figure;
subplot(5,5,[1,6,11,16]); plot(a); view(270,90)
subplot(5,5,22:25); plot(b);

subplot(5,5,[2:5, 7:10, 12:15, 17:20 ]);
imagesc(flipud(d1));
colorbar();
set(gca, 'YDir', 'reverse'); 
title('Dynamic time warping');

% ----------------------------
d3=distance(a,b);

figure; 
subplot(5,5,[1,6,11,16]); plot(a); view(270,90);
subplot(5,5,22:25); plot(b);

subplot(5,5,[2:5, 7:10, 12:15, 17:20 ]);
% pcolor(flipud(d3));
imagesc(flipud(d3))
colorbar();
set(gca, 'YDir', 'reverse'); 
title('Distance/Cost');

% ----------------------------
% d2=swa(a,b,0.001,5);
% d2=swa_diff(a,b,0.001,5);
% [d2, L, R] = dtw_m(d3, 0.5);
% [d2, L, R, P, OP]=dtw_m(d3,0.5, 3, 5);
% 
% figure; 
% subplot(5,5,[1,6,11,16]); plot(a); view(270,90)
% subplot(5,5,22:25); plot(b);
% 
% subplot(5,5,[2:5, 7:10, 12:15, 17:20 ]);
% imagesc(flipud(d2));
% colorbar();
% set(gca, 'YDir', 'reverse'); 
% % title('Smith-Waterman Algorithm');
% title('DTW modified');

% ----------------------------
% d2=swa(a,b,0.001,5);
% d4=crossmatch(a,b, 0.001, 5);
d4 = distance_m(d3, 0.25);

figure; 
subplot(5,5,[1,6,11,16]); plot(a); view(270,90);
subplot(5,5,22:25); plot(b);

subplot(5,5,[2:5, 7:10, 12:15, 17:20 ]);
% pcolor(flipud(d4));
imagesc(flipud(d4));
% colorbar();

set(gca, 'YDir', 'reverse'); 
title('distance mark');

end



