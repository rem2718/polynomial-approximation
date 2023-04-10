function [x_interp, y_interp] = lagrange(f, x, x_interp)
    % f is the original function
    % x array contains the data points
    % x_interp is an array of points at which to interpolate

    n = length(x);
    m = length(x_interp);

    % Initialize the output array
    y_interp = zeros(1, m);

    % Loop over each point to interpolate
    for i = 1:m
        % Initialize the sum for this point
        sum = 0;

        % Loop over each data point
        for j = 1:n
            % Calculate the product for this data point
            product = f(x(j));
            for k = 1:n
                if k ~= j
                    product = product*(x_interp(i)-x(k))/(x(j)-x(k));
                end
            end

            % Add the product to the sum
            sum = sum + product;
        end

        % Save the result for this point
        y_interp(i) = sum;
    end
end