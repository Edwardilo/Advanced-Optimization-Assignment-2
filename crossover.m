function offspring = crossover(parents, crossover_rate, bounds)
    pop_size = size(parents, 1);
    offspring = parents;
    for i = 1:2:pop_size-1
        if rand < crossover_rate
            alpha = rand; % Blend crossover
            offspring(i,:)   = alpha*parents(i,:) + (1-alpha)*parents(i+1,:);
            offspring(i+1,:) = alpha*parents(i+1,:) + (1-alpha)*parents(i,:);
        end
    end
    offspring = max(min(offspring, bounds(2)), bounds(1)); % Keep in bounds
end