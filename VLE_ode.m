
A_propanol = 8.00308;
B_propanol = 1505.52;
C_propanol = 211.6;

A_butanol = 7.92484;
B_butanol = 1617.52;
C_butanol = 203.296;


P = 1;


nPoints = 100;


x = linspace(0, 1, nPoints);


P_vapor_propanol = 10.^(A_propanol - (B_propanol ./ (C_propanol + x)));
P_vapor_butanol = 10.^(A_butanol - (B_butanol ./ (C_butanol + x)));


y_propanol = x .* P_vapor_propanol / P;
y_butanol = x .* P_vapor_butanol / P;


figure;
plot(x, P_vapor_propanol, 'r-', 'LineWidth', 2);
hold on;
plot(x, P_vapor_butanol, 'b-', 'LineWidth', 2);
hold off;
xlabel('Mole Fraction of 2-Propanol (x)');
ylabel('Vapor Pressure (P)');
legend('2-Propanol', '1-Butanol');
title('Isobaric T vs X, Y Diagram');
grid on;


figure;
plot(x, y_propanol, 'r-', 'LineWidth', 2);
hold on;
plot(x, y_butanol, 'b-', 'LineWidth', 2);
hold off;
xlabel('Mole Fraction of 2-Propanol (x)');
ylabel('Mole Fraction of 2-Propanol (y)');
legend('2-Propanol', '1-Butanol');
title('Y vs X Diagram');
grid on;
