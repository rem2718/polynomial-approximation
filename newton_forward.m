function L = newton_forward(x, y)
    n = length(x);
    h = x(2) - x(1);
    delta = zeros(n);
    delta(:,1) = y';
    for i = 2:n
        for j = 1:n-i+1
            delta(j,i) = (delta(j+1,i-1) - delta(j,i-1)) / (h*(i-1));
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