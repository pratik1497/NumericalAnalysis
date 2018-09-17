%To Run my code just type Hw1_Patel_Pratik in command

function CorrelationCoefficients=Hw1_Patel_Pratik() 

clf

%The data given to us and it being plotted as black asterik marks
age=[3,6,5,5,3,4,9,8,9,7,6,5,8,6];
height=[55,68,64,66,62,65,74,75,73,69,73,68,73,71];
hold on
plot(age,height,'*k')

%%%Linear Regression%%%

[a1,b1]=linear_reg(age,height);
x=linspace(3,9,7);
linearEquation=a1*(x)+b1;
hold on
%Plots the linear regression line and will be a red solid line
plot(x,linearEquation,'-r');
%Sets the correlation coefficeint fot linear regression into first spot 
CorrelationCoefficients(1)=correlationCoe(height,a1*age+b1);


%%%Exponential Regression%%%%

%Use linear regession method but change the data to work for exp.
[a2, b2] = linear_reg(age, log(height));  
exponential =  exp(b2) * exp(a2*x);          
hold on
%Plots the exponential regression line as a green dashed line
plot(x,exponential,'--g')
%Sets the correlation coefficeint fot exponential regression into second spot 
CorrelationCoefficients(2)=correlationCoe(height,exp(b2) * exp(a2*age));

 
%%%Logarithmic regression%%%
 
 %Use linear regression method but change the data for logar.
 [a3, b3] = linear_reg(log(age), height); 
 logarithmic =a3*log(x) + b3;  
 hold on
 %Plots the linear regression line as a blue dotted line
 p1=plot(x,logarithmic,':b');
 p1.LineWidth=2;
 %Sets the correlation coefficeint fot logarithmic regression into third spot 
 CorrelationCoefficients(3)=correlationCoe(height,a3*log(age) + b3);


%The folowing is just configuring the plot to add legend, axes titles, and etc.
hold off
grid on
legend("Points", "Lin Reg", "Exp Reg", "Log Reg", "Location", "southeast")
title('Age vs Height of Babies');
ylabel('Height(centimeters)');
xlabel('Age(months)');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96]);
yticks([54 56 58 60 62 64 66 68 70 72 74 76 78]);
end

%{
Since for all three fits we will be using the linear regression method but
just changing the data entered, I created a function that gives an a and b
using linear regression for a set of data to make it easier.
%}
function [a,b]= linear_reg(age,height) 
xsum=0;
ysum=0;
xsquared=0;
productsum=0;
[~,n]=size(age);
%finds the different sums needed to find a and b 
for i=1:n
    xsum=xsum+age(i);
    ysum=ysum+height(i);
    xsquared=xsquared+ age(i)^2;
    productsum= productsum+ age(i)*height(i);
end

a=(n*productsum-(xsum*ysum))/(n*xsquared-xsum^2);
b=(xsum*productsum-xsquared*ysum)/(xsum^2-n*xsquared);
end

%{
This function will find the correlational coeficcient given the orginial y
values and the function values.
%}
function coeffcient= correlationCoe(height,funcY)
ysum=sum(height);
[~,n]=size(height);
ysum=ysum/n;
sum1=0;
sum2=0;
for i=1:n
    sum1=sum1+ (height(i)-ysum)^2;
    sum2=sum2 + (funcY(i)-height(i))^2;
end

coeffcient=(sum1-sum2)/sum1;
end