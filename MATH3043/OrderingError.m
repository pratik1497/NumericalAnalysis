
%Will show how the going from to largest to smallest and smallest to
%largest in a summation are going to be two different values due to
%floating point arithmetic on a machine

function [x2,x3]=OrderingError(n)
    format long;
    sum1=0;
    sum2=0;
    sum3=0;
    sum4=0;
    dsum1=0;
    dsum2=0;
    dsum3=0;
    dsum4=0;
    %Finds the sum of the given summation from smallest to largest
    % in both single and double precision
    for i=1:n
        sum1=single((1/i +sum1));
        sum2=single((1/(i^2) +sum2));
        sum3=single((1/(i^3) +sum3));
        sum4=single(((-1)^i/i +sum4));
        dsum1=1/i +dsum1;
        dsum2=1/(i^2) +dsum2;
        dsum3=1/(i^3) +dsum3;
        dsum4=(-1)^i/i +dsum4;
    end
    a=0;b=0;c=0;d=0;
    da=0;db=0;dc=0;dd=0;
    %Finds the sum of the given summation from largest to smallest
    %in both sing eand double precision
    for i=n:-1:1
        a=single((1/i +a));
        b=single((1/(i^2) +b));
        c=single((1/(i^3) +c));
        d=single(((-1)^i/i +d));
        da=1/i +da;
        db=1/(i^2) +db;
        dc=1/(i^3) +dc;
        dd=(-1)^i/i +dd;
    end
    %Changes values to single precision
    diff1=single(sum1-a);
    diff2=single(sum2-b);
    diff3=single(sum3-c);
    diff4=single(sum4-d);
    diff5=dsum1-da;
    diff6=(dsum2-db);
    diff7=(dsum3-dc);
    diff8=(dsum4-dd);
    %Outputs values in a vector to display differences
    x2=[diff1,diff2,diff3,diff4];
    x3=[diff5,diff6,diff7,diff8];
    
    end



