function[x]=plotRootError(f,fprime,e,xi,maxIter,a,b)
%{
After running the functions for the different functions what I noticed was
that for the first given function, Newton Method was the fastest to
converge while in the second function the fastest was Bisection. This is
probally due to the fact that Newton's Method is locally convergent and
therefore converges quickly if initial x is close to actual root.

%}

[~,numB,errorB]=bisection(f,e,xi,maxIter,a,b);
[~,numRF,errorRF]=regulaFalsi(f,e,xi,maxIter,a,b);
[xN,numN,errorN]=Newton(f,fprime,e,xi,maxIter,a,b);

x=xN;

clf;
%plots method error vs iterations in semilog
grid on
semilogy(1:numB,errorB,'-r')
hold on
semilogy(1:numRF,errorRF,'--b')
hold on
semilogy(1:numN,errorN,':ok')
hold on

title('Root Error vs Number of Iterations');
ylabel('Error');
xlabel('Number of Iterations');
dim=[0.6 0.3 0.4 0.4];
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96]);
str={'Bisection-Red Solid line','RegularFalsi- Blue Dashed Line','Newton- Black Dotted Line'};
annotation('textbox',dim,'String',str, 'FitBoxToText','on');

%Creates new figure and graphs the method error vs iterations in loglog
figure;
clf;
grid on
loglog(1:numB,errorB,'-r')
hold on
loglog(1:numRF,errorRF,'--b')
hold on
loglog(1:numN,errorN,':ok')
hold on
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96]);

title('Root Error vs Number of Iterations');
ylabel('Error');
xlabel('Number of Iterations');
dim=[0.6 0.3 0.4 0.4];
str={'Bisection-Red Solid line','RegularFalsi- Blue Dashed Line','Newton- Black Dotted Line'};
annotation('textbox',dim,'String',str, 'FitBoxToText','on');
