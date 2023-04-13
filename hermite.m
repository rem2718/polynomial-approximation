function L = hermite(x, y, dy)
    n = length(x);
    delta = zeros(n*2);
    k = 1;
    z = zeros(1,n*2);
    for i = 1:n
        delta(k,1) = y(i);
        delta(k+1,1) = y(i);
        delta(k,2) = dy(i);
        z(k) = x(i);
        z(k+1) = x(i);
        k = k + 2;    
    end
    for i = 2:n*2
        p = i;
        for j = 1:(n*2)-i+1
            q = j;
            if i == 2 && mod(j,2) ~= 0
                p = p + 1;
                continue;
            end
            delta(j,i) = (delta(j+1,i-1) - delta(j,i-1)) / (z(p)-z(q));
            p = p + 1;
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
