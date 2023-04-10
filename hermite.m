function L = hermite(x, y, dy)
    % compute the number of points
    n = length(x);
    h = x(2) - x(1);
    delta = zeros(n*2);
    k = 1;
    for i = 1:n
        delta(k,1) = y(i);
        delta(k+1,1) = y(i);
        delta(k,2) = dy(i);
        k = k + 2;    
    end
    for i = 2:n*2
        for j = 1:(n*2)-i+1
            if i == 2 && mod(j,2) ~= 0
                continue;
            end
            ind = floor((i-1)/2);
            if ind == 0
                ind = 1;
            end
            fprintf('%d',ind);
            delta(j,i) = (delta(j+1,i-1) - delta(j,i-1)) / (h*ind);
        end
    end
    syms t;
    f = delta(1,1);
    for i = 2:n
        term = delta(1,i);
        for j = 1:i-1
            term = term * (t-x(j));
        end
        f = f + term;
    end
    L = matlabFunction(simplify(f));
end
