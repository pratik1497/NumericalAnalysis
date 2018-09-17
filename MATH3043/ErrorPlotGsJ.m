function [xG,xJ]=ErrorPlotGsJ(A,b,e,xi)
%clear current graph
clf
title("Iterative Error vs Number of Iterations")
ylabel("Error")
xlabel("Number of Iterations")
dim=[0.6 0.3 0.4 0.4];
str={'Jacobi Error is O','Gauss-Seidel Error is X'};
annotation('textbox',dim,'String',str, 'FitBoxToText','on');

%FIRST PLOTTING ERROR FOR JACOBI
n=size(A,1);
%Creates diagonal matrix taken from the diagonal of A
D=zeros(n);
for i=1:n
    D(i,i)=A(i,i);
end
M=-(A-D);
D=inv(D);
xiJ=xi;
xJ=D*M*xi+D*b;
j=1;
error=norm((xJ-xiJ),Inf);
grid on
plot(j,error,'O');
hold on
while (error>e)
    xiJ=xJ;
    xJ=D*M*xiJ+D*b; %#ok<*MINV>
    error=norm((xJ-xiJ),Inf);
    j=j+1;
    hold on
    plot(j,error,'O');
end


%NOW PLOTTING ERROR FOR GAUSS SEIDEL
P=zeros(n);
%Creates a matrix which is D-E and stores into M
for i=1:n
    for j=1:n
        if(i>=j)
            P(i,j)=A(i,j);
        end
    end
end
%Creates the F matrix and stores into N
N=-(A-P);
P=inv(P);
xiG=xi;
xG=P*N*xi+P*b;
j=1;
error=norm((xG-xiG),Inf);
hold on
plot(j,error,'X');

while (error>e)
    xiG=xG;
    xG=P*N*xiG+P*b; %#ok<*MINV>
    error=norm((xG-xiG),Inf);
    j=j+1;
    hold on
    plot(j,error,'X');
end
    