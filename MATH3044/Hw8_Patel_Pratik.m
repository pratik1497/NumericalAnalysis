function Hw8_Patel_Pratik()
    
    % A function handle of p(x)
    p = @(x) exp(x);
    % A function handle of f(x)
    f = @(x) 2*pi*exp(x)*(2*pi*sin(2*pi*x)-cos(2*pi*x));
    % A function handle of real solution
    real = @(x) sin(2*pi*x);

    % A vector to contain all norms
    errorNormInf = zeros(1,3);
    % A vector to hold each h value
    hvalues = [10^-1,10^-2,10^-3];
    
    % This loop will repeat for each mesh value
    for q=1:3
        % Store value of h
        h = hvalues(q);
        % Determine Number of partitons
        N = round(1/h);
        %{
        Create an empty Matrix of size N-1 as in this case we have to use
        p(xi-1) therefore we no longer go from i=0 to N-1 but from 
        i=1 to N-1
        
        Create an empty vector for the b portion in linear system
        
        Create an empty vector for real solution
        
        %}
    
        AproxMatrix = zeros(N-1,N-1);
        AproxVector = zeros(1,N-1);
        realVector = zeros(1,N-1);

        % Loop through each xi value
        for i=1:N-1
                % Determine x value
                t=i*h;
                % Determine real solution
                realVector(i) = real(t);
                
                %Create the tri-diagonal matrix with appropriate b vector
                AproxVector(i) = (h/3)*(f(t-(h/2))+f(t)+f(t+(h/2)));
                
                %Main Diagonal portion of Matrix
                AproxMatrix(i,i) = (1/(3*h))*(p(t+h)+4*p(t)+p(t-h));
                hold = -(1/(6*h))*(p(t)+4*p(t+(h/2))+p(t-h));
               
                % Other diagonals
                if (i ~= N-1)
                    AproxMatrix(i,i+1)=hold;
                    AproxMatrix(i+1,i)=hold;
                end 

        end
         
        % Solve linear system
        answer = linsolve(AproxMatrix,transpose(AproxVector));
        answer = transpose(answer);
        % Find differnce bewteen real an aproximate solution
        hold2 = realVector-answer;
        % Find the norm of vector
        errorNormInf(q) = norm(hold2,inf);
    end
    fprintf("\nThe Error Vector is "); 
    disp(errorNormInf);
    % Print out convergence value
    convergenceInf = log(errorNormInf(3)/errorNormInf(2))/log(hvalues(3)/hvalues(2));
    fprintf("\nThe order of convergence(norm=Inf) is %0.10f",convergenceInf);
    
end

