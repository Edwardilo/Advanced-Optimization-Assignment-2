function [best_solution, best_fitness, fitness_history] = de_rastrigin()

    % ==== 1. PARAMETERS ====
    pop_size = 50;            % Number of individuals
    max_gen = 200;            % Number of generations
    bounds = [-5.12, 5.12];   % Search space
    F = 0.8;                  % Mutation factor
    CR = 0.9;                 % Crossover rate

    % ==== 2. INITIAL POPULATION ====
    population = bounds(1) + (bounds(2)-bounds(1))*rand(pop_size, 2);

    % Evaluate initial fitness
    fitness = arrayfun(@(i) rastrigin(population(i,:)), 1:pop_size)';

    % Track best
    [best_fitness, idx] = min(fitness);
    best_solution = population(idx,:);
    fitness_history = zeros(max_gen, 1);

    % ==== 3. DE MAIN LOOP ====
    for gen = 1:max_gen
        new_population = zeros(size(population));

        for i = 1:pop_size
            % --- Mutation ---
            % Pick 3 random, distinct individuals (a,b,c) different from i
            idxs = randperm(pop_size, 3);
            while any(idxs == i)
                idxs = randperm(pop_size, 3);
            end
            a = population(idxs(1),:);
            b = population(idxs(2),:);
            c = population(idxs(3),:);

            % Mutant vector
            mutant = a + F*(b - c);

            % Clamp to bounds
            mutant = max(min(mutant, bounds(2)), bounds(1));

            % --- Crossover ---
            trial = population(i,:);
            cross_points = rand(1,2) < CR;
            trial(cross_points) = mutant(cross_points);

            % --- Selection ---
            if rastrigin(trial) < fitness(i)
                new_population(i,:) = trial;
            else
                new_population(i,:) = population(i,:);
            end
        end

        % Replace population
        population = new_population;
        fitness = arrayfun(@(i) rastrigin(population(i,:)), 1:pop_size)';

        % Track best
        [current_best, idx] = min(fitness);
        if current_best < best_fitness
            best_fitness = current_best;
            best_solution = population(idx,:);
        end

        fitness_history(gen) = best_fitness;
    end

    % Save fitness history to CSV
    csvwrite('de_convergence.csv', fitness_history);

end