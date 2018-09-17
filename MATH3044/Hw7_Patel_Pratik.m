function Hw7_Patel_Pratik()
%function handle for given equation
f= @(t,y) 2*pi*y*cos(2*pi*t);


%%%Explict Euler%%%%
%creates a function handle for the scheme
EE= @(t,y,h) y+h*f(t,y);
convergence(EE,"Explict Euler");

%%%Implict Euler%%%%
%creates a function handle for the scheme
IE= @(t,y,h) y/(1-2*pi*h*cos(2*pi*(t+h)));
convergence(IE,"Implict Euler");

%%%Crank Nicholson I%%%%%%
%creates a function handle for the scheme
CN1= @(t,y,h) (y*(1+h*pi*cos(2*pi*(t+h/2))))/(1-h*pi*cos(2*pi*(t+h/2)));
convergence(CN1,"Crank Nicholson I");


%%%Crank Nicholson II%%%%%%
%creates a function handle for the scheme
CN2=  @(t,y,h) (y*(1+h*pi*cos(2*pi*t)))/(1-h*pi*cos(2*pi*(t+h)));
convergence(CN2,"Crank Nicholson II");


%%%Taylor Method Order 2%%%%%
%creates a function handle for the scheme
TM2 = @(t,y,h) y*(1+2*pi*h*(cos(2*pi*t)+h*pi*((cos(2*pi*t))^2-sin(2*pi*t))));
convergence(TM2,"Taylor Method of Order 2");

%%%Range-Kutta Order 2%%%%%%
%creates a function handles for the scheme
r2k2= @(t,y,h) f(t+(2/3)*h,y+((2/3)*h*f(t,y)));
RK2= @(t,y,h) y+(h/4)*f(t,y)+ (3/4)*h*r2k2(t,y,h);
convergence(RK2,"Runge-Kutta of Order 2");



%%%Range-Kutta Order 4%%%%%%
%creates a function handles for the scheme
r4k2= @(t,y,h) f(t+h/2,y+(h/2*f(t,y)));
r4k3= @(t,y,h) f(t+h/2,y+(h/2*r4k2(t,y,h)));
r4k4= @(t,y,h) f(t+h,y+(h*r4k3(t,y,h)));
RK4= @(t,y,h) y+(h/6)*f(t,y)+ (h/3)*r4k2(t,y,h)+(h/3)*r4k3(t,y,h)+(h/6)*r4k4(t,y,h);
convergence(RK4,"Runge-Kutta of Order 4");

end

function convergence(func,name)
%{
This is a function that given a function handle (our scheme) and 
name will print/calculate the order of convergence using both norms.
%}

format long

%Creates function handle for actual solution
real=@(t) exp(sin(2*pi*t));
%Values of h
h=[10^-4,10^-5];
%Creates a vector to hold the errors for each norm
errorNorm2=zeros(1,2);
errorNormInf=zeros(1,2);

%loop through the values of h
for q=1:2
    hValue=h(q);
    value= 1;
    j=2;
    % Compute N since our range is 0-1 so 1/h gives N
    N=1/hValue;
    N=floor(N);
    %Creates memory space for two vectors to hold approximation and real
    vecotorAprox=zeros(1,N);
    vecotorAprox(1)=1;
    realV=zeros(1,N);
    
    %Go through all Number of partitions 
    for i=0:N-1
        %Set value of t
        t=i*hValue;
        % Place the approximation in Approx Vector
        vecotorAprox(j)=func(t,value,hValue);
        %Place the real aproximation in realV(one spot before to line up)
        realV(j-1)=real(t);
        %Store value of approx so it can be used for next iteration
        value=vecotorAprox(j);
        %Increment spot holder in vectors
        j=j+1;
    end
    %Fix size as the for loop calucalte one more value which dont need last
    vecotorAprox=vecotorAprox(1:N);
    
    %Calculate error bewteen real and Approx with 2-norm
    errorNorm2(q)= norm(abs(realV-vecotorAprox),2);
    %Calculate error bewteen real and Approx with Infinity norm
    errorNormInf(q)= norm(abs(realV-vecotorAprox),Inf);
end 
errorNorm2;
errorNormInf;
%Calculate order of convergence using 2 norm
convergence2= log(errorNorm2(1)/errorNorm2(2))/log(h(1)/h(2));
%Calculate order of convergence using Infinity norm
convergenceInf= log(errorNormInf(1)/errorNormInf(2))/log(h(1)/h(2));

%Printing
print0=sprintf("\n\n%s:",name);
print1=sprintf("\nThe order of convergence(norm=2) is %0.10f",convergence2);
print2=sprintf("\nThe order of convergence(norm=Inf) is %0.10f",convergenceInf);
disp(print0+print1+print2);

end




