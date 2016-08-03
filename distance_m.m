function D = distance_m(C, t)

LA=size(C,1);
LB=size(C,2);

D=zeros(LA,LB);

mark = 200;

imgaussfilt(C, 4)

for i=1:LA
    for j=1:LB
        if C(i,j) < t && D(i,j)==0
            D = markneighbours(D, C, i, j, mark, t);
            mark = mark + 20;
%         else
%             D(i+1,j+1)= 1;
        end
        
    end
end

end

function D = markneighbours(D, C, i, j, mark, t)
    if i <= size(D,1) && j <= size(D,2) 
        if C(i,j) < t && D(i,j)==0
           D(i,j)= mark;
           D = markneighbours(D, C, i+1, j, mark, t);
           D = markneighbours(D, C, i, j+1, mark, t);
        end
    end 
end