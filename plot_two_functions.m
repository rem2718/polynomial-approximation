function plot_two_functions(f1, f2, x, name)
    y1 = f1(x);
    y2 = f2(x);

    plot(x, y1, 'b-', 'LineWidth', 2);

    hold on;

    plot(x, y2, 'r--', 'LineWidth', 2);

    title(name);
    legend('original function', 'approx function');
    grid on;
     set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'LineWidth', 0.5);

end