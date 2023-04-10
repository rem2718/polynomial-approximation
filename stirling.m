function L = stirling(x, y)
    n = length(x); d = 1;
    temp1 = 1; temp2 = 1;
    k = 1; l = 1;
    delta = zeros(n);
 
    h = x(2) - x(1);
    m = ceil(n / 2);
    a = x(m);
    syms t;
    s = (t - a) / h;
 
    for i=1:(n-1)
        delta(i,1) = y(i + 1) - y(i);
    end
    for i=2:n
        for j=1:n-i
            delta(j,i) = (delta(j + 1,i - 1) - delta(j,i - 1));
        end
    end
    y1 = y(m);
    for i=1:n
        if mod(i,2) ~= 0
            if k ~= 2
                temp1 = temp1 * (s^k - (k - 1)^2);
            else
                temp1 = temp1 * (s^2 - (k - 1)^2);
            end
            k = k+1;
            d = d*i;
            m = ceil((n - i) / 2);
            if m == 0
                m = 1;
            end
            y1 = y1 + (temp1 / (2 * d)) * (delta(m+1,i) + delta(m,i));            
        else
            temp2 = temp2 * (s^2 - (l - 1)^2);
            l = l+1;
            d = d*i;
            m = ceil((n - i) / 2);
            y1 = y1 +(temp2 / d) * (delta(m,i));
        end
    end
    L = matlabFunction(simplify(y1));
end











