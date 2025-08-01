function f = rastrigin(x)
% RASTRIGIN Benchmark function for optimization
%   Input: x - a vector [x1, x2]
%   Output: f - scalar fitness value

    % Ensure x is a row or column vector
    x = x(:);  % Convert to column vector

    % Rastrigin formula
    f = 20 + x(1)^2 + x(2)^2 - 10*(cos(2*pi*x(1)) + cos(2*pi*x(2)));
end