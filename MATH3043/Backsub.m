%Solves the linear system Ax=b for x when given A and b
function values=Backsub(U,b)
n=size(U,1);
values=zeros(n,1);
values(n)=b(n)/U(n,n);
for i=n-1:-1:1
    sum=b(i);
    for j=i+1:n
        sum=sum-U(i,j)*values(j);
    end
    values(i)=sum/U(i,i);
end
end

    