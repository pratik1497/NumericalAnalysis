function [x,num]= SOR(A,b,xi,e,w)
n=size(A,1);
%Creates diagonal matrix taken from the diagonal of A
D=zeros(n);
for i=1:n
    D(i,i)=A(i,i);
end
E=zeros(n);
%Creates a matrix which is E 
for i=1:n
    for j=1:n
        if(i>j)
            E(i,j)=-A(i,j);
        end
    end
end
F=-A+D-E;

hold=inv((1/w)*D*E);
x=hold*((((1-w)/w)*D+F)* xi +b);
xi=x;
num=1;
while(norm(x,Inf)>e)
    x=hold*((((1-w)/w)*D+F)* xi +b);
    xi=x;
    num=num+1;
end
