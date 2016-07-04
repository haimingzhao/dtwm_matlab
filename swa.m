function D = swa( A, B, t, w )

LA=length(A);
M=LA+1;

LB=length(B);
N=LB+1;

% Initialization
D=zeros(M,N);

for i=1:LA
    for j=1:LB
        max_d = max( [D(i,j+1), D(i+1,j), D(i,j)] );
        if abs(A(i)-B(j))*2/(A(i)+B(j)) < t
            D(i+1,j+1)= max_d + w;
        else
            D(i+1,j+1)= max_d - abs(A(i)-B(j))*2/(A(i)+B(j));
            if D(i+1,j+1) < 0
                D(i+1,j+1) = 0 ;
            end
        end
    end
end

end

