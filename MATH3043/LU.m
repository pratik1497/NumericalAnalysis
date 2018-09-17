%Pratik Patel
function [L,U]=LU(M)
%{ 
function takes in a n x n matrix(which will not have zero as a pivot ever)
and return a lower triangular matrix and upper triangular matrix
%}
[m,n] = size(M);
k=1;
j=1;
% I will hold the lower triangular matrix in the end
I=eye(m);
while (j <= m) && (k <= n)
    hold=eye(m);
    for i = j+1:m
        %hold places the multipler at the i,k spot in a identity matrix
        hold(i,k)=(M(i,k)/M(j,k));
        M(i,:) = M(i,:) - (M(i,k)/M(j,k))*M(j,:); % perform type III operations 
 
    end
    %Hold now contains the multiplers needed to reduce the values 
    %under the pivot to zero
    I=I*hold;
    j=j+1;
    k=k+1;
end

U=M;
L=I;

