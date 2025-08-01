ga_data = csvread('ga_convergence.csv');
pso_data = csvread('pso_convergence.csv');
de_data  = csvread('de_convergence.csv');

figure;
plot(ga_data, 'LineWidth', 2); hold on;
plot(pso_data, 'LineWidth', 2);
plot(de_data, 'LineWidth', 2);

xlabel('Generation');
ylabel('Best Fitness');
title('Convergence Comparison: GA vs PSO vs DE');
legend('GA', 'PSO', 'DE');
grid on;