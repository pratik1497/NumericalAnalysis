function x=plotNewton2D(F,J,e,maxIter)
%{
When I ran this method I determined that Newtons Method converges for both
whe xo is (1,1,1) and (0,0,0) with it converging slighly faster when xo is
(0,0,0).
%}
xi=[1;1;1];
[x1,num1,error1]= Newton2D(xi,F,J,e,maxIter);
xi=[0;0;0];
[~,num2,error2]= Newton2D(xi,F,J,e,maxIter);

x=x1;

clf;
%plots method error vs iterations in semilog
grid on
semilogy(1:num1,error1,'-r')
hold on
semilogy(1:num2,error2,'--b')
hold on


title('Root Error vs Number of Iterations');
ylabel('Error');
xlabel('Number of Iterations');
dim=[0.6 0.3 0.4 0.4];
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96]);
str={'(1,1,1)-Red Solid line','(0,0,0)- Blue Dashed Line',};
annotation('textbox',dim,'String',str, 'FitBoxToText','on');