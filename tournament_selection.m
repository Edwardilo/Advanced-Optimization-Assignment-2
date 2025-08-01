function parents = tournament_selection(population, fitness)
    pop_size = size(population, 1);
    parents = zeros(size(population));
    for i = 1:pop_size
        idx = randperm(pop_size, 2); % Select 2 random individuals
        if fitness(idx(1)) < fitness(idx(2))
            parents(i,:) = population(idx(1),:);
        else
            parents(i,:) = population(idx(2),:);
        end
    end
end