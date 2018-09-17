function [x,num,error]=gradient(A,b,xi,max,xapprox)
%{
The code was changed to now accept max number of iterations it should
compute as well as a xapprox so it can output the error at each iteration

%}
r=b-A*xi;
lam=transpose(r)*r/(transpose(r)*A*r);
x=xi+lam*r;
num=1;
error=zeros(max,1);
error(num)=norm(x-xapprox,Inf);
 r=b-A*x;
while(num< max)
    xi=x;
    lam=transpose(r)*r/(transpose(r)*A*r);
    x=xi+lam*r;
    num=num+1;
    error(num)=norm(x-xapprox,Inf);
     r=b-A*x;
end
