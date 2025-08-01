[best_sol, best_fit, history] = ga_rastrigin();

disp('Best Solution:');
disp(best_sol);
disp('Best Fitness:');
disp(best_fit);

figure;
plot(history, 'LineWidth', 2);
xlabel('Generation'); ylabel('Best Fitness');
title('GA Convergence on Rastrigin Function');
grid on;