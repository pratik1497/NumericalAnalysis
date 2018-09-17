%{
Solves the linear system Ax=b for x using LU Decomposition 
Takes in a lower and upper triangular matrix with vector b
%}
function x=LUsolver(L,U,b)
%Forwardsub: solves for Ly=b

n=size(L,1);
y=zeros(n,1);
%Solve first term
y(1)=b(1)/L(1,1);
for i=2:1:n
    sum=b(i);
    for j=i-1:-1:1
        sum=sum-L(i,j)*y(j);
    end
    y(i)=sum/L(i,i);
end

%Backsub solves for Ux=y
x=zeros(n,1);
%Solves for last term in x first
x(n)=y(n)/U(n,n);
for i=n-1:-1:1
    sum=y(i);
    for j=i+1:n
        sum=sum-U(i,j)*x(j);
    end
    x(i)=sum/U(i,i);
end

end

    