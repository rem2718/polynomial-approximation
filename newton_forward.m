function L = newton_forward(x, y)
    % compute the number of points
    n = length(x);
    h = x(2) - x(1);
    % compute the forward difference table
    fd_table = zeros(n);
    fd_table(:,1) = y';
    for i = 2:n
        for j = 1:n-i+1
            %fprintf('j: %d val: %f %f %f %f\n',j, );
            fd_table(j,i) = (fd_table(j+1,i-1) - fd_table(j,i-1)) / (h*(i-1));
        end
    end
    %define the Newton forward difference function
    syms t;
    f = fd_table(1,1);
    for i = 2:n
        term = fd_table(1,i)
        for j = 1:i-1
            term = term * (t-x(j));
        end
        f = f + term;
    end
    L = matlabFunction(simplify(f));
end