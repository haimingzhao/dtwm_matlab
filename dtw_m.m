%  t: threshold ()
%  o : offset (from diaganal direction)
function [D, L, R, P, OP]=dtw_m(C,t, o, w)

ns=size(C,1);
nt=size(C,2);

%% initialization accum matrix with cost matrix
D=zeros(ns,nt); % accum matrix with dtw
L=zeros(ns,nt); % dtw length matrix
R=cell(ns,nt); % region marking matrix, mark ()
P=zeros(ns,nt,2); % path

for i=1:ns
    for j=1:nt
        D(i, j) = inf;
    end    
end        
 
% D(1, 1) = 0 ; % make sure the first cell start with 0 distance at D(2,2)

%% begin dynamic programming

for i=1:ns
    for j=1:nt

        if(i>1 && j>1)  
            minpre = min( [D(i-1,j-1), D(i-1,j), D(i,j-1)] ) ;

            if minpre == D(i-1,j-1)
                mini = i-1;
                minj = j-1;
            elseif minpre == D(i-1,j)     
                mini = i-1;
                minj = j;
            else
                mini = i;
                minj = j-1;
            end 
    
            if D(mini, minj)==inf
                minpre = 0;
            end
        else
            minpre = 0;
            mini = i;
            minj = j;
            
        end           
        
        dtwm = (minpre + C(i,j)) / (L(mini, minj) + 1) ;

        % avg dtw per cell if smaller than threshold, mark as match region
        if dtwm < t  &&  L(mini, minj) == 0 
            D(i,j) = minpre + C(i,j); % update current cell dtw distance
            L(i,j) = 1; % update current cell dtw length

            R{i, j} = [i, j, i, j]; % if previous cell not a region, then start new region
  
        elseif dtwm < t
            si = R{mini, minj}(1);
            sj = R{mini, minj}(2);
                
            % if current not diverge too much from offset
            if abs((i-si)-(j-sj)) < o
                D(i,j) = minpre + C(i,j); % update current cell dtw distance
                L(i,j) = L(mini,minj) + 1; % update current cell dtw length

                R{i, j} = [si,sj, 0,0]; % else same as previous region
                
                P(i, j, 1) = mini; 
                P(i, j, 2) = minj;  % mark path
                % update end cell if furthest away
                li = R{ si, sj }(3);
                lj = R{ si, sj }(4);
                if i > li && j > lj
                    R{ si, sj }(3) = i;
                    R{ si, sj }(4) = j;
                end
            end      
        end      
    end
end

% find optimal path
OP = find_Optimal_Paths(R,P, L, ns, nt, w);

end

function OP = find_Optimal_Paths(R, P, L, ns, nt, w)

OP=zeros(ns,nt); % mark all cell as zeros
visited =zeros(ns,nt);
mark = 100;

for i=1:ns
    for j=1:nt
        if ~ isempty(R{i,j})
            si = R{i,j}(1);
            sj = R{i,j}(2);
            li = R{si,sj}(3); 
            lj = R{si,sj}(4);
            
            if visited(li, lj)== 0
               
                
                if  L(li,lj) > w  % for dtw length smaller
%                 if  pdist2([li,lj],[si,sj]) > w  % for diagnol length
                    OP(li, lj) = mark;
                    OP = markpath(OP, P, si, sj, li, lj, mark);
                end    
            end
            visited(si, sj) = 1;
        end        
    end
end

end

% subfunction to find path start from si,sj to li,lj
function OP = markpath(OP, P, si, sj, li, lj, mark)
    while li > si && lj > sj && li>0 && lj >0 
        
        OP(li, lj) = mark;
        li = P(li, lj, 1);
        lj = P(li, lj, 2);
        
%         mi = P(li, lj, 1);
%         mj = P(li, lj, 2);
%         OP(mi, mj) = mark;
%         li = mi ; lj = mj ;
        
    end    
end

