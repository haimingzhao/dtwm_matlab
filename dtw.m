% dynamic time warping 

function D=dtw(s,t)
% s: signal 1, size is ns*k, row for time, colume for channel 
% t: signal 2, size is nt*k, row for time, colume for channel 
% w: window parameter
%      if s(i) is matched with t(j) then |i-j|<=w
% d: resulting distance

% if nargin<3
%     w=Inf;
% end

ns=size(s,1);
nt=size(t,1);
if size(s,2)~=size(t,2)
    error('Error in dtw(): the dimensions of the two input signals do not match.');
end
% w=max(w, abs(ns-nt)); % adapt window size

%% initialization
D=zeros(ns,nt); 

D(1,1) = abs(s(1)-t(1));

%% begin dynamic programming
for i=2:ns
    D(i, 1) = abs(s(i)-t(1)) + D(i-1, 1) ;
end        
for i=2:nt
    D(1, i) = abs(s(1)-t(i)) + D(1, i-1) ;
end

for i=2:ns
    for j=2:nt
        D(i,j)= abs(s(i)-t(j)) + min( [D(i,j-1), D(i-1,j), D(i-1,j-1)] ) ;
    end
end
% d=D(ns+1,nt+1);
