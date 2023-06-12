N= linspace(2,100,99);
k=100;
N_max=100;
h=20*(1-(N/N_max).^2);
T_b=120;
T_inf=35;
theta_b = T_b-T_inf;
P = 2*(0.1+10)/100;
A = 0.1*10/100;
m=sqrt((h*P)/(k*A));
M = sqrt(h*P*k*A*theta_b);
L=2/100;


q = N.*M.*tanh(m*L);
subplot(2,2,1);
plot(N,q, LineWidth=1.5);
title("Total Heat transfer rate vs. Number of fins");
xlabel("Number of fins");
ylabel("Total Heat transfer rate");
hold on
[maxval, idx]=max(q);
N_opt = N(idx);
scatter(N_opt, maxval, LineWidth=1.5);
fprintf('Optimum Number of Fins: %d',N_opt);
hold off


fin_space = (0.1-(N*0.001))./(N-1);
subplot(2,2,2);
plot(q,fin_space, LineWidth=1.5);
title("Total Heat transfer rate vs Fin Spacing");
xlabel("Fin Spacing");
ylabel("Heat transfer rate");

eff = (q./(h.*0.1*10*theta_b))*100;
subplot(2,2,3);
plot(eff, fin_space, LineWidth=1.5);
title("Efficiency of finned section vs fin space ");
xlabel("Fin Spacing");
ylabel("Efficiency");

