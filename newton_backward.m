function L = newton_backward(x, y)
    % compute the number of points
    n = length(x);
    h = x(2) - x(1);
    % compute the forward difference table
    delta = zeros(n);
    delta(:,1) = y';
    for i = 2:n
        for j = 1:n-i+1
            delta(j,i) = (delta(j+1,i-1) - delta(j,i-1)) / (h*(i-1));
        end
    end
    %define the Newton forward difference function
    syms t;
    s = (t - x(n))/h;
    f = delta(n,1);
    for i = 2:n
        %fprintf("i: %d val: %d\n", i, n-i+1);
        term = delta(n-i+1,i);
        for j = 0:i-2
            term = term * (s+j) * h;
        end
        f = f + term;
    end
    L = matlabFunction(simplify(f));
end