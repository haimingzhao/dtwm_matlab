function D = distance(A, B)

LA=length(A);
LB=length(B);

D=zeros(LA,LB);

r = range(A)+range(B);

for i=1:LA
    for j=1:LB
%         if abs(A(i)-B(j))*2/(A(i)+B(j)) < t
%             D(i+1,j+1)= abs(A(i)-B(j))*2/(A(i)+B(j));
%         else
%             D(i+1,j+1)= 1;
%         end
%         D(i+1, j+1) = abs(A(i)-B(j))*2/abs((A(i)+B(j)));
%         D(i, j) = abs(A(i)-B(j))*2/r;
        D(i, j) = abs(A(i)-B(j));
%           D(i, j) = sqrt((A(i)-B(j)).^2);
    end
end


end