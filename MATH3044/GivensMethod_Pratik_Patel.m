%Just click run or type GivensMethod in command line to run for Question3
a=[4,1,3];
b=[2,-1];
[eigenvalues,y]=Givens(a,b)

%INPUT: a is diagonal values in a list,
%       b is other diagonal values
function [a,b]=Givens(a,b)
%Keep performing QR algorithm until non-diagonal values are less than
%Tolerance
while(norm(b)>0.01)
    % First finds R decompostion
    t=b(1);
    [m,n]=size(a);
    c=zeros(m,n);
    s=zeros(m,n);
    for i=1:n-1
        r= sqrt(a(i)^2+t^2);
        %disp(["R is ",r])
        c(i)=a(i)/r;
        s(i)=t/r;
        a(i)=r;
        t=b(i);
        b(i)=t*c(i)+a(i+1)*s(i);
        a(i+1)=-t*s(i)+a(i+1)*c(i);
        if(i~= n-1)
            t=b(i+1);
            b(i+1)=t*c(i);
        end  
    end
  % Finds next Ai
    for i=1:n-1
        a(i)=a(i)*c(i)+b(i)*s(i);
        b(i)=a(i+1)*s(i);
        a(i+1)=a(i+1)*c(i);
    end
end
end


