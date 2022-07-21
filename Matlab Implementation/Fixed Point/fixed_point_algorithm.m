function [fixed_point, Rp_list, P_list, A_list, Ep_list, iteration_list] = fixed_point_algorithm(initial_guess, stopping_criteria, max_iterations)
% Inputs:
%       initial_guess: float
%       stopping_criteria: float: how low should the relative approximate
%       error go?
%       max_iterations: int: maximum iterations
%
% Outputs:
%       fixed_point: float: The possible solution
%       Rp_list: array(float): List of relative approximate errors
%       P_list: array(float): List of fixed points calculated in each
%       iteration.
%       iteration_list: array(int): List of iterations

P = fn(initial_guess);

iteration_list = ones(1);
Rp_list = ones(1);
P_list = ones(1);
Ep_list = ones(1);
A_list = ones(1);

Ep1 = 1;

for i = 1:max_iterations
    if abs(fn_dash(P)) >= 1
        break
    end
    P_new = fn(P);
    Rp = abs((P_new - P)/P_new) * 100;
    Ep = abs(P_new - P);
    P = P_new;

    A = Ep1 / Ep;
    Ep1 = Ep; 
    
    iteration_list(i) = i;
    Rp_list(i) = Rp;
    P_list(i) = P;
    Ep_list(i) = Ep1;
    A_list(i) = A; 

    if Rp <= stopping_criteria
        break;
    end
end
fixed_point = P;
end

