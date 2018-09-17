function [x,num,error]=conjugateGradient(A,b,xi,max,xapprox)
%{
The code was changed to now accept max number of iterations it should
compute as well as a xapprox so it can output the error at each iteration

%}

r=b-A*xi;
d=b-A*xi;
num=0;

error=zeros(max,1);
while(num<max)
    hold=A*d;
    lam=norm(r,2)^2/(transpose(d)*hold);
    x=xi+lam*d;
    xi=x;
    ri=r;
    r=ri-lam*hold;
    B=norm(r,2)^2/norm(ri,2)^2;
    d=r+B*d;
    num=num+1;
    error(num)=norm(x-xapprox,Inf);
end



