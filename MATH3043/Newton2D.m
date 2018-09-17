function [x,num,error]= Newton2D(xi,F,J,e,maxIter)
num=1;
x=xi;
error=zeros(maxIter,1);
error(num)=x;
while(norm(F(x),Inf)>e  && num <=maxIter)
    v=J(x)\-F(x);
    x=x+v;
    num=num+1;
    error(num)=x;
end

%Gets error each iteration and resizes vector to proper size
for i=1:num
   error(i)=abs(x-error(i));
end
error=error(1:num);
