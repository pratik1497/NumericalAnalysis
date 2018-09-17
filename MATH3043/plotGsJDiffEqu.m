function [diffG,diffJ]=plotGsJDiffEqu(num)
%{ 
Solves for the error in solving the linear systems equation using 
Jacobi and Gauss-Seidel compared to BVP solution and plots the error
for every iteration

AFTER USING FUNCTION
It was determined that Gauss-Seidel was faster at approximating the
solution to Ax=b. In the beginning both were close to each other but as the
number of iterations increased Gauss-Seidel began to become way faster
where at the the hughest gap it was roughly producing 1/2 the error Jacobi 
had so I would say Gauss-Seidel is twice as fast than Jacobi for large
number of iterations.
%}

%Clear current graph
clf
set(gca, 'xtick',[1:500:num]);


%BVP Equation
diffequ=@(y) 0.5*(y^2+1); 

%Creates the solution from BVP and stores in u vector
z=(-1:.01:1);
u=zeros(201,1);
z= transpose(z);
for i=1:201
    u(i)=diffequ(z(i));
end

%Matrix A
A=diag(-2*ones(199,1),0);
A=A+diag(ones(198,1),1);
A=A+diag(ones(198,1),-1);

%Vecotor b 
b=.0001*ones(197,1);
b=[-.9999;b;-.9999];

%JACOBI METHOD

%Sets xi to be zero vector
xi=zeros(199,1);
%Creates diagonal matrix taken from the diagonal of A
D=zeros(199);
for i=1:199
    D(i,i)=A(i,i);
end
M=-(A-D);
D=inv(D);


%Finds x1 first and stores difference from BVP in diffvector
xJ=D*M*xi+D*b;
y=[1;xJ;1];
diffvec=zeros(num,1);
diffvec(1)=norm((u-y),Inf);

%Finds ith x solution and finds ith norm error with BVP and stores into vector 
for i=2:num
    xi=xJ;
    xJ=D*M*xi+D*b; %#ok<*MINV>
    y=[1;xJ;1];
    diffvec(i)=norm((u-y),Inf);
end
diffJ=diffvec(num);

%Creates a vector for num of iterations
iter=(1:num);
iter=transpose(iter);

%Plots Jacobi vs Num of Iterations
grid on
plot(iter,diffvec);
hold on

%GAUSS-SEIDEL
M=zeros(199);
%Sets xi to be zero vector
xi=zeros(199,1);
%Creates a matrix which is D-E and stores into M
for i=1:199
    for j=1:199
        if(i>=j)
            M(i,j)=A(i,j);
        end
    end
end
%Creates the F matrix and stores into N
N=-(A-M);
M=inv(M);


%Finds x1 first and stores diff from BVP in a vector
xG=M*N*xi+M*b;
y=[1;xG;1];
diffvec=zeros(num,1);
diffvec(1)=norm((u-y),Inf);

%Finds ith x solution and finds ith norm error and stores into vector 
for i=2:num
    xi=xG;
    xG=M*N*xi+M*b; %#ok<*MINV>
    y=[1;xG;1];
    diffvec(i)=norm((u-y),Inf);
end

%Plots Gauss-Seidel vs Num of Iterations
diffG=diffvec(num);
hold on
plot(iter,diffvec,'--');

title('Iterative Error vs Number of Iterations');
ylabel('Error');
xlabel('Number of Iterations');
dim=[0.5 0.3 0.4 0.4];
str={'Jacobi Error is Solid line','Gauss-Seidel Error is Dashed Line'};
annotation('textbox',dim,'String',str, 'FitBoxToText','on');


