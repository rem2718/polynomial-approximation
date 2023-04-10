function L = neville(x, y)
    n = length(x);
    delta = sym(zeros(n,n));
    for i = 1:n
        delta(i,1) = y(i);
    end
    syms t;
    for j = 2:n
        for i = 1:n-j+1
            delta(i,j) = ((t - x(i))*delta(i+1,j-1) - (t - x(i+j-1))*delta(i,j-1))/(x(i+j-1) - x(i));
        end
    end
    y1 = delta(1,n);
    L = matlabFunction(simplify(y1));
end
