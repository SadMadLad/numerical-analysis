function [fx, approximate_relative_error, iterations] = approximateExponential(x, stopping_criteria, max_iterations)
iterations = 1; 
solution = 1;  
approximate_relative_error = 100;
while (1)
    solution_old = solution;
    solution = solution + x ^ iterations / factorial(iterations);
    iterations = iterations + 1;
    if solution~=0
        approximate_relative_error=abs((solution - solution_old)/solution)*100;
    end
    if approximate_relative_error<=stopping_criteria || iterations>=max_iterations,break,end
end
fx = solution;
end