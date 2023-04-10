function f = lagrange(x, y)
    n = length(x);
    syms t;
    f = 0;
    for i = 1:n
        L = 1;
        for j = 1:n
            if i ~= j
                L = L*(t-x(j))/(x(i)-x(j));
            end
        end
        f = f + y(i)*L;
    end
    f = matlabFunction(simplify(f));
end