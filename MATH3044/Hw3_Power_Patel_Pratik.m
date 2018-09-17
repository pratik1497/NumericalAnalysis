function [eigenvalue,eigenvector]=Hw3_Power_Patel_Pratik(A,xi,Tol)

%Calculates first values so I can run while loop atleast once
oldEV=xi;
y=A*oldEV;
ystar=norm(y,Inf);
hold=find(abs(y)==ystar);
eigenvalue=y(hold(1));
eigenvector=y/eigenvalue;

%{
As long as the norm of difference bewteen current eigenvecotor 
and old eigenvector is greater than Tolerance value keep running loop
%}
while(norm(eigenvector-oldEV,Inf)>Tol)
    %Keeps track of old eignevector in order to calucalte norm for TOL
    oldEV=eigenvector;
    %Finds the second y
    y=A*oldEV;
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
    eigenvalue=y(hold(1));
    %Calculate eigenvector
    eigenvector=y/eigenvalue;
end
end

    
