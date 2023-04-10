function f = lagrange(x, y)
    % f is the original function
    % x and y arrays contains the data points
    % L is thr lagrange interpolation function

    n = length(x);
    syms t;
    f = 0;
    % Loop over each data point
    for i = 1:n
        % Calculate the product for this data point
        L = 1;
        for j = 1:n
            if i ~= j
                L = L*(t-x(j))/(x(i)-x(j));
            end
        end

        % Add the product to the sum
        f = f + y(i)*L;
    end
    f = matlabFunction(simplify(f));
end