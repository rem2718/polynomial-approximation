function plot_two_functions(f1, f2, x, name)

    n = length(x);    
    y1 = zeros(1,n);
    y2 = zeros(1,n);
    for i=1:n
        y1(i) = f1(x(i));
        y2(i) = f2(x(i));
    end

    plot(x, y1, 'b-', 'LineWidth', 2);

    hold on;

    plot(x, y2, 'r--', 'LineWidth', 2);

    title(name);
    legend('original function', 'approx function');
    grid on;
     set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'LineWidth', 0.5);

end