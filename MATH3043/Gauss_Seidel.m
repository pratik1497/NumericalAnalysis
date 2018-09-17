function [x,diff]=Gauss_Seidel(A,b,Num,xi)
%{
Will approximate a solution a value for x when solving Ax=b and 
solve the difference bewteen two vectors using equation given
%}

diffequ=@(y) 0.5*(y^2+1); 

n=size(A,1);
M=zeros(n);
%Creates a matrix which is D-E and stores into M
for i=1:n
    for j=1:n
        if(i>=j)
            M(i,j)=A(i,j);
        end
    end
end
%Creates the F matrix and stores into N
N=-(A-M);
M=inv(M);
x=M*N*xi+M*b;

% Iterative part of approximating x for Ax=b 
for i=2:Num
    xi=x;
    x=M*N*xi+M*b;%#ok<*MINV>
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