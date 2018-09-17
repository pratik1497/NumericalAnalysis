function [eigenvalue,eigenvector]=Hw3_InversePower_Patel_Pratik(A,xi,Tol,q)
%Calculates the B matrix 
[m,~]=size(A);
B=A-q*eye(m);

%Calculates first values so I can run while loop atleast once
oldEV=xi;
y=linsolve(B,oldEV);
ystar=norm(y,Inf);
hold=find(abs(y)==ystar);
ystar=y(hold(1));
eigenvalue=1/ystar +q;
eigenvector=y/ystar;

%{
As long as the norm of difference bewteen current eigenvecotor 
and old eigenvector is greater than Tolerance value keep running loop
%}
while(norm(eigenvector-oldEV,Inf)>Tol)
    %Keeps track of old eignevector in order to calucalte norm for TOL
    oldEV=eigenvector;
    %Finds the second y
    y=linsolve(B,oldEV);
    %Finds the norm of y to get ystar
    ystar=norm(y,Inf);
    %{
    Since the norm will always be postive and we want first value in y
    which the absolute value is equal to norm, so find will find indexs of
    where absolute value of  y is equal to norm.
    %}
    hold=find(abs(y)==ystar);
    %{
    Since in case of more than 1 index of ystar we will take first index
    returned
    %}
    ystar=y(hold(1));
    %Calculate eigenvalue using q for better approx
    eigenvalue=1/ystar +q;
    %Calculate eigenvector
    eigenvector=y/ystar;
end
end
