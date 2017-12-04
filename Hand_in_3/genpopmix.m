function [L] = genpopmix(dim1,dim2,N,A)

L = zeros(dim1,dim2);

while sum(sum(L))<(N*A)
    L(randi(dim1,1),randi(dim2,1)) = A;
end
end