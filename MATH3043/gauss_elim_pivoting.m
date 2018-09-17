function U=gauss_elim_pivoting(M)
disp(M)
disp('')
% gaussian elimination with Partial pivoting
[m,n] = size(M);
k=1;
j=1;

while (j <= m) && (k <= n)
   
    a=abs(M(j:end,k)); %find absolute value below the pivot position
    
    if max(a)==0
        k=k+1;
        continue    % if all zeros below (and possibly including) the pivot, no need to swap rows, so move on to next column, 
                    % but stay on same row! <- this is where k is important
        
    elseif ((max(a) > 0) || (M(j,k) == 0))  %CHANGED  to OR since we are doing partial pivoting and 
        %always want to find max in column to use as pivot
        b=M(j:end,k); %set b to be portion of k-th column below (and including) (j,k) position
        [~,idx]=max(abs(b)); 
        %CHANGED want the index value which is the max value in magintude in the column and use that as pivot
        idx=idx+j-1; %reindex to get correct index for full j-th column
        %swap rows to get rid of zero/or not max column value in pivot position
        swap = M(j,:);
        M(j,:) = M(idx,:); 
        M(idx,:) = swap;
        string=['After swap ',num2str(j)];
        disp(string)
        disp(M)
    end
    
    for i = j+1:m
        M(i,:) = M(i,:) - (M(i,k)/M(j,k))*M(j,:); % perform type III operations 
    end
    string=['After reducing rows under pivot ',num2str(j)];
    disp(string)
    disp(M)
    j=j+1;
    k=k+1;
end

U=M;
