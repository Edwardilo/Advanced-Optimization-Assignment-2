[best_sol_de, best_fit_de, history_de] = de_rastrigin();

disp('Best Solution (DE):');
disp(best_sol_de);
disp('Best Fitness (DE):');
disp(best_fit_de);

figure;
plot(history_de, 'LineWidth', 2);
xlabel('Generation'); ylabel('Best Fitness');
title('DE Convergence on Rastrigin Function');
grid on;