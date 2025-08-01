function [best_solution, best_fitness, fitness_history] = pso_rastrigin()

    % ==== 1. PARAMETERS ====
    swarm_size = 50;          % Number of particles
    max_iter = 200;           % Iterations
    bounds = [-5.12, 5.12];   % Search space
    w = 0.7;                  % Inertia weight
    c1 = 1.5;                 % Cognitive coefficient
    c2 = 1.5;                 % Social coefficient

    % ==== 2. INITIALIZE SWARM ====
    % Positions and velocities
    positions = bounds(1) + (bounds(2)-bounds(1))*rand(swarm_size, 2);
    velocities = zeros(swarm_size, 2);

    % Personal and global best
    personal_best_pos = positions;
    personal_best_val = arrayfun(@(i) rastrigin(positions(i,:)), 1:swarm_size)';
    [best_fitness, idx] = min(personal_best_val);
    global_best_pos = personal_best_pos(idx, :);

    fitness_history = zeros(max_iter, 1);

    % ==== 3. PSO MAIN LOOP ====
    for iter = 1:max_iter
        for i = 1:swarm_size
            % Update velocity
            r1 = rand(1,2);
            r2 = rand(1,2);
            velocities(i,:) = w*velocities(i,:) + ...
                              c1*r1.*(personal_best_pos(i,:) - positions(i,:)) + ...
                              c2*r2.*(global_best_pos - positions(i,:));

            % Update position
            positions(i,:) = positions(i,:) + velocities(i,:);

            % Clamp positions to bounds
            positions(i,:) = max(min(positions(i,:), bounds(2)), bounds(1));

            % Evaluate fitness
            fitness = rastrigin(positions(i,:));

            % Update personal best
            if fitness < personal_best_val(i)
                personal_best_val(i) = fitness;
                personal_best_pos(i,:) = positions(i,:);
            end

            % Update global best
            if fitness < best_fitness
                best_fitness = fitness;
                global_best_pos = positions(i,:);
            end
        end

        fitness_history(iter) = best_fitness;
    end

    % Save convergence to CSV
    csvwrite('pso_convergence.csv', fitness_history);

    best_solution = global_best_pos;

end