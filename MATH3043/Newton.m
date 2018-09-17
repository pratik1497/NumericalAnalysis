function [x,num,error]= Newton(f,fprime,e,xi,maxIter,a,b)
%{
Inputs: the function handle, error, intial x,
    max number of iterations, and a interval

Outputs:The final approximation of root, number of iterations it took to
    reach approximation, and the error each iteration.

%}


%Checks if root exist bewteen interval and if not makes x sentinel value
%and does not run loop
if(f(a)*f(b)>0)
    x=-99999;
    error=-99999;
    num=maxIter+1;
else    
num=1;
x=xi;
error=zeros(maxIter,1);
error(num)=x;

while(abs(f(x))>e  && num <=maxIter)
    x=x-f(x)/fprime(x);
    num=num+1;
    error(num)=x;
end

for i=1:num
   error(i)=abs(x-error(i));
end
error=error(1:num);
end