function mutated = mutate(offspring, mutation_rate, bounds)
    mutated = offspring;
    for i = 1:numel(mutated)
        if rand < mutation_rate
            mutated(i) = bounds(1) + (bounds(2)-bounds(1))*rand;
        end
    end
end