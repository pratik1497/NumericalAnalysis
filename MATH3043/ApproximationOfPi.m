%Will Approximate the value of pi using the inverse sine and tangent taylor
%series expansion with n being the number of summation terms.

%After running the program it is clear that the arcsin summation better 
%limits the propagation of error

function [tanDiff,sinDiff]=ApproximationOfPi(n)
sum_arctan=0;
sum_arcsin=0;
%To clear current graph
clf
%Using the taylor series expansion of inverse of sin and tan
title("Approximation of Pi")
ylabel("Difference of Approximation from Pi")
xlabel("Number of Terms in Sum")
dim = [0.7 0 0.3 0.3];
str = {'ArcTan is O','ArcSin is X'};
annotation('textbox',dim,'String',str,'FitBoxToText','on');

for k=0:n
    %Since arctan(1)=pi/4 multiply by 4 in the summation to get value of pi
    sum_arctan=sum_arctan+ 4*(-1)^k/(2*k+1);
    diff1=pi-sum_arctan;
    hold on
    plot(k,diff1,'o')
    grid on
    
    %Since arcsin(1/2)=pi/6 multiply by 6 in the summation to get value of pi
    b=nchoosek(2*k,k);
    sum_arcsin=sum_arcsin+ 6*(b*(0.5)^(2*k+1)/(2^(2*k)*(2*k+1)));
    diff2=pi-sum_arcsin;
    hold on
    plot(k,diff2,'x')
    pause(1)
end


fprintf("\nThe Approximation value using ArcTan is %f",sum_arctan);
fprintf("\nThe Approximation value using ArcSin is %f",sum_arcsin);
tanDiff=pi-sum_arctan;
sinDiff=pi-sum_arcsin;