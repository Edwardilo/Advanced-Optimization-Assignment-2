function [best_solution, best_fitness, fitness_history] = ga_rastrigin()

    % ==== 1. PARAMETERS ====
    pop_size = 50;           % Number of individuals
    max_gen = 200;           % Number of generations
    crossover_rate = 0.8;    % Probability of crossover
    mutation_rate = 0.05;    % Probability of mutation
    bounds = [-5.12, 5.12];  % Search space limits

    % ==== 2. INITIAL POPULATION ====
    population = bounds(1) + (bounds(2) - bounds(1)) * rand(pop_size, 2);

    % Evaluate initial fitness
    fitness = arrayfun(@(i) rastrigin(population(i,:)), 1:pop_size)';

    % Track best
    [best_fitness, idx] = min(fitness);
    best_solution = population(idx,:);
    fitness_history = zeros(max_gen,1);

    % ==== 3. GA MAIN LOOP ====
    for gen = 1:max_gen

        % Selection
        parents = tournament_selection(population, fitness);

        % Crossover
        offspring = crossover(parents, crossover_rate, bounds);

        % Mutation
        offspring = mutate(offspring, mutation_rate, bounds);

        % Evaluate offspring
        fitness = arrayfun(@(i) rastrigin(offspring(i,:)), 1:pop_size)';

        % Replace old population
        population = offspring;

        % Track best
        [current_best, idx] = min(fitness);
        if current_best < best_fitness
            best_fitness = current_best;
            best_solution = population(idx,:);
        end

        fitness_history(gen) = best_fitness;

    end

    % Save fitness history to CSV
    csvwrite('ga_convergence.csv', fitness_history);

end