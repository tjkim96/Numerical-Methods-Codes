function [root,fx,iter] = bisection_ftol(func,xl,xu,es,maxit)
% bisection_ftol: Implements the bisection rule for root finding. Includes two stopping criteria: 
% if the function evaluated at the root is reasonably close to 0, or if the algorithm exceeds the 
% maximum number of iterations.
% 
% Inputs:
% func:     Anonymous function for root finding [ND] 
% xl:       Initial lower guess [ND] (scalar)
% xu:       Initial upper guess [ND] (scalar)
% es:       Desired absolute y-error (default = 0.0001) [ND] (scalar)
% maxit:    Maximum number of iterations (default = 50) [ND] (scalar)
% 
% Outputs:
% root:     Root of the function [ND] (scalar)
% fx:       Function value at the root [ND] (scalar)
% iter:     Number of iterations [ND] (scalar) 



if nargin<3         % Check for proper number of inputs
    error('at least 3 non-empty input arguments required')
end

if isempty(es)      % Assign default tolerance if needed
    es = 0.0001;
end

if isempty(maxit)   % Assign default max number of iterations if needed
    maxit = 50;
end

% Check if initial lower/upper guesses are valid (function values at guesses have opposite signs)
if sign(func(xl)) == sign(func(xu))
    error('no sign change -- check your xl/xu again')
end



iter = 0;   % Start counting the number of iterations
xr = xl;    % Guess that the root is the lower guess

while true
    iter = iter + 1;
    xr = (xl + xu)/2;
    
    if sign(func(xr)) ~= sign(func(xl)) % Check sign of func(xr) vs. func(xl)
        xu = xr;
    else
        xl = xr;
    end
    
    if (abs(func(xr)) <= es) || (iter >= maxit)
        break
    end
end

root = xr;
fx = func(root);
end