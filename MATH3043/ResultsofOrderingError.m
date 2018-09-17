%Uses the OrderingError function to return a 6 by 4 matrix with the errors for
%each summation when done n equals 10^3 to 10^7 


function y=ResultsofOrderingError()
format long
y=zeros(6,4);
for k=1:6
   y(k,:)= OrderingError(10^2*(10^k));
end
