function [d2, L, R, P, OP] = test_dtwm(a, b, t, o, w)

d1=distance(a,b);

figure; 
subplot(5,5,[1,6,11,16]); plot(a); view(270,90)
subplot(5,5,22:25); plot(b);

subplot(5,5,[2:5, 7:10, 12:15, 17:20 ]);
% pcolor(flipud(d3));
imagesc(flipud(d1(2:end,2:end)));
colorbar();
set(gca, 'YDir', 'reverse'); 
title('Distance/Cost');

% ----------------------------
% d2=swa(a,b,0.001,5);
% d2=swa_diff(a,b,0.001,5);
[d2, L, R, P, OP] = dtw_m(d1, t, o, w);

figure; 
subplot(5,5,[1,6,11,16]); plot(a); view(270,90)
subplot(5,5,22:25); plot(b);

subplot(5,5,[2:5, 7:10, 12:15, 17:20 ]);
imagesc(flipud(d2(2:end,2:end)));
colorbar();
set(gca, 'YDir', 'reverse'); 
% title('Smith-Waterman Algorithm');
title('DTW modified');

figure; 
subplot(5,5,[1,6,11,16]); plot(a); view(270,90)
subplot(5,5,22:25); plot(b);

subplot(5,5,[2:5, 7:10, 12:15, 17:20 ]);
OP = OP(2:end,2:end);
imagesc(flipud(OP));
set(gca, 'YDir', 'reverse'); 
% title('Smith-Waterman Algorithm');
title('DTW modified Path');

end
