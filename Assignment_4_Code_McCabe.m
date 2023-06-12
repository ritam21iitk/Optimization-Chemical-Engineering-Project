A_propanol = 8.00308;
B_propanol = 1505.52;
C_propanol = 211.6;

A_butanol = 7.92484;
B_butanol = 1617.52;
C_butanol = 203.296;


P = 1;


reflux_ratio = input('Enter the reflux ratio: ');
boilup_ratio = input('Enter the boil-up ratio: ');
bottom_composition = input('Enter the bottom product composition: ');
top_composition = input('Enter the top product composition: ');


x = linspace(0, 1, 100);
P_vapor_propanol = 10.^(A_propanol - (B_propanol ./ (C_propanol + x)));
P_vapor_butanol = 10.^(A_butanol - (B_butanol ./ (C_butanol + x)));


q = (boilup_ratio / (boilup_ratio + 1)) * (P_vapor_butanol - P_vapor_propanol) + P_vapor_propanol;


slope_stripping = reflux_ratio / (reflux_ratio + 1);
intercept_stripping = bottom_composition / (reflux_ratio + 1);


slope_enriching = (top_composition - q(end)) / (1 - q(end));
intercept_enriching = top_composition - slope_enriching;

x_intercept = (intercept_stripping - intercept_enriching) / (slope_enriching - slope_stripping);
y_intercept = slope_stripping * x_intercept + intercept_stripping;

figure;
plot(x, P_vapor_propanol, 'r-', 'LineWidth', 2);
hold on;
plot(x, P_vapor_butanol, 'b-', 'LineWidth', 2);
plot(x, q, 'g-', 'LineWidth', 2);
plot([x_intercept, x_intercept], [0, y_intercept], 'k--', 'LineWidth', 1.5);
plot([x_intercept, 1], [y_intercept, y_intercept], 'k--', 'LineWidth', 1.5);
plot([x_intercept, x_intercept], [y_intercept, y_intercept], 'ro', 'MarkerSize', 8);
text(x_intercept, y_intercept, sprintf('(%0.2f, %0.2f)', x_intercept, y_intercept), 'VerticalAlignment', 'bottom');
hold off;
xlabel('Mole Fraction of 2-Propanol (x)');
ylabel('Vapor Pressure (P)');
legend('2-Propanol', '1-Butanol', 'q-line');
title('McCabe-Thiele Diagram');
grid on;

actual_stages = sum(x >= x_intercept);
minimum_stages = actual_stages - 1;
minimum_reflux_ratio = (y_intercept - bottom_composition) / (top_composition - y_intercept);

fprintf('Actual Number of Stages: %d\n', actual_stages);
fprintf('Minimum Number of Stages: %d\n', minimum_stages);
fprintf('Minimum Reflux Ratio: %.2f\n', minimum_reflux_ratio);
