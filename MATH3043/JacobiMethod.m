function [x,diff]=JacobiMethod(A,b,Num,xi)

diffequ=@(y) 0.5*(y^2+1); 

n=size(A,1);
%Creates diagonal matrix taken from the diagonal of A
D=zeros(n);
for i=1:n
    D(i,i)=A(i,i);
end
M=-(A-D);

D=inv(D);
x=D*M*xi+D*b;

for i=2:Num
    xi=x;
    x=D*M*xi+D*b; %#ok<*MINV>
end

%Stores values into y so can still have orginial approximation in x
y=[1;x;1];

%Finds u(z) values
z=(-1:.01:1);
u=zeros(201,1);
z= transpose(z);
for i=1:201
    u(i)=diffequ(z(i));
end

%The norm of the differences of ||u(z)-x`|| in two norm 
diff=norm((u-y),2);
    
