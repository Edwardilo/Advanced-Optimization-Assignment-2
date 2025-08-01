% Define a threshold for "converged"
threshold = 1e-6;

% Find generation index where fitness goes below threshold
gen_ga  = find(history_ga <= threshold, 1);
gen_pso = find(history_pso <= threshold, 1);
gen_de  = find(history_de <= threshold, 1);

% If no convergence, mark as max generations
if isempty(gen_ga),  gen_ga  = length(history_ga); end
if isempty(gen_pso), gen_pso = length(history_pso); end
if isempty(gen_de),  gen_de  = length(history_de); end

Summary = table( ...
    ["GA"; "PSO"; "DE"], ...
    [best_fit_ga; best_fit_pso; best_fit_de], ...
    [gen_ga; gen_pso; gen_de], ...
    {best_sol_ga; best_sol_pso; best_sol_de}, ...
    'VariableNames', {'Algorithm', 'BestFitness', 'ConvergenceGen', 'BestSolution'})

disp(Summary);

writetable(Summary, 'algorithm_comparison.csv');

