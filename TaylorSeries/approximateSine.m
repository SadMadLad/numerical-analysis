function [fx, approximate_relative_error, iterations] = approximateSine(x,stopping_criteria,max_iterations)

iterations = 3;
solution = x;
sign = 1;
approximate_relative_error = 100;

while (1)
    solution_old = solution;
    if mod(iterations, 2) == 1
        sign = sign*-1;
        solution = solution + sign*(x^iterations)/factorial(iterations);

        if solution~=0
             approximate_relative_error = abs((solution - solution_old)/solution)*100;
        end
    end
    iterations = iterations + 1;

    if approximate_relative_error <= stopping_criteria || iterations>=max_iterations,break,end
end
fx = solution;
end

