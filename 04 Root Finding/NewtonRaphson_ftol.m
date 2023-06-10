function [root,fx,iter] = NewtonRaphson_ftol(func,dfunc,x0,es,maxit)
% NewtonRaphson: Implements the Newton-Raphson method for root finding. Includes two stopping 
% criteria: if the function evaluated at the root is reasonably close to 0, or if the algorithm 
% exceeds the maximum number of iterations.
% 
% Inputs:
% func:     Anonymous function for root finding [ND] 
% dfunc:    Anonymous function. Derivative of func [ND]
% x0:       Initial guess [ND] (scalar)
% maxit:    Maximum number of iterations (default = 50) [ND] (scalar)
% 
% Output:
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



xr = x0;    % Guess that the root is the lower guess (placeholder for 1st iteration)
iter = 0;   % Start counting the number of iterations

while true
    iter = iter + 1;
    xr = xr - func(xr)/dfunc(xr);
    
    if (abs(func(xr)) <= es) || (iter >= maxit)
        break
    end
end

root = xr;
fx = func(root);
end