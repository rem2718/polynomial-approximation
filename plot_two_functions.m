function plot_two_functions(f1, f2, x, name)
% Plot two functions on the same graph
% Inputs: f1 is the original function, f2 is the approx function
% x is array of x values

%calculating y values
y1 = f1(x);
y2 = f2(x);

% Plot the first function
plot(x, y1, 'b-', 'LineWidth', 2);

% Hold on to the current plot
hold on;

% Plot the second function
plot(x, y2, 'r--', 'LineWidth', 2);
title(name);
legend('original function', 'approx function');
grid on;
 set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'LineWidth', 0.5);

end