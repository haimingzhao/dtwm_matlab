function D = crossmatch( A, B, t, ep )

LA=length(A);
M=LA+1;

LB=length(B);
N=LB+1;

% Initialization
D=zeros(M,N);

for i=1:LA
    for j=1:LB
        cost = abs(A(i)-B(j));
        if abs(A(i)-B(j))*2/(A(i)+B(j)) < t
            
        
        D(i+1,j+1) = max([ 0, ...
                D(i+1,j) + ep - cost, ...
                D(i,j+1) + ep - cost, ...
                D(i,j)] + ep - cost);     
    end
end

end

