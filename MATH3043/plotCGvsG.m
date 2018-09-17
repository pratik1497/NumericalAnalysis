function[num]=plotCGvsG(A19,b19,A99,b99,x19G,x99G,x19CG,x99CG,maxNUMG,maxNUMCG)
%{
Using the gradient and conjugate method as well as the generated possion
matrix code we attained the approxmation of x and the num of iterations it
took to reach a soultion with error tolerance less than 10^-8. Using the
max and the x approximations now we will plot the error at each iteration.

                    !!!!!!!!!!!!REMARK!!!!!!!!!!!!!!
I tried to plot the two errors of conjugate and gradient in the same
graph however since conjugate gradient method is extremely faster the graph
ended up looking distorted and not clear. Therefore I sepearted the graphs
by the conjugate mehtod vs iterations and gradient vs iterations.
%}
num=1;
clf
xi=zeros(361,1);
[~,~,errorG19]=gradient(A19,-b19,xi,maxNUMG,x19G);
[~,~,errorCG19]=conjugateGradient(A19,-b19,xi,maxNUMCG,x19CG);
xi=zeros(9801,1);
[~,~,errorG99]=gradient(A99,-b99,xi,maxNUMG,x99G);
[~,~,errorCG99]=conjugateGradient(A99,-b99,xi,maxNUMCG,x99CG);

iter=1:maxNUMCG;
iter2=1:maxNUMG;

%Will plot the congjugate error vs iterations using semilogy
grid on
semilogy(iter,errorCG19,'-r')
hold on
semilogy(iter,errorCG99,'--b')
hold on
xticks(0:5:maxNUMCG)
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96]);

title('Conjugate Gradient Method Error vs Number of Iterations');
ylabel('Error');
xlabel('Number of Iterations');
dim=[0.6 0.3 0.4 0.4];
str={'When m is 19 -Solid line','When m is 99 - Dashed Line'};
annotation('textbox',dim,'String',str, 'FitBoxToText','on');

%Creates new figure and graphs the gradient error vs iterations
figure;
grid on;
semilogy(iter2,errorG19,'-g')
hold on
semilogy(iter2,errorG99,'--k')
hold on
xticks(0:1000:maxNUMG)
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96]);


title('Gradient Method Error vs Number of Iterations');
ylabel('Error');
xlabel('Number of Iterations');
dim=[0.5 0.3 0.4 0.4];
str={'When m is 19 -Solid line','When m is 99 - Dashed Line'};
annotation('textbox',dim,'String',str, 'FitBoxToText','on');


