[best_sol_pso, best_fit_pso, history_pso] = pso_rastrigin();

disp('Best Solution (PSO):');
disp(best_sol_pso);
disp('Best Fitness (PSO):');
disp(best_fit_pso);

figure;
plot(history_pso, 'LineWidth', 2);
xlabel('Iteration'); ylabel('Best Fitness');
title('PSO Convergence on Rastrigin Function');
grid on;