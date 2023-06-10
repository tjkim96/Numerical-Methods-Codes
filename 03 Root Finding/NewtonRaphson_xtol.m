function [root,fx,ea,iter] = NewtonRaphson_xtol(func,dfunc,x0,es,maxit)
% NewtonRaphson_xtol: Implements the Newton-Raphson Method for root finding. Includes two stopping 
% criteria: if the percent relative error falls under a threshold, or if the algorithm exceeds the 
% maximum number of iterations.
% 
% Inputs:
% func:     Anonymous function for root finding [ND] 
% dfunc:    Anonymous function. Derivative of func [ND]
% x0:       Initial guess [ND] (scalar)
% es:       Desired percent relative error (default = 0.0001%) [ND] (scalar). 
%           Enter as a number (i.e., give a 5% desired percent relative error as 5)
% maxit:    Maximum number of iterations (default = 50) [ND] (scalar)
% 
% Outputs:
% root:     Root of the function [ND] (scalar)
% fx:       Function value at the root [ND] (scalar)
% ea:       Percent relative error [%] (scalar)
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



iter = 0;   % Start counting the number of iterations
xr = x0;    % Guess that the root is the lower guess (placeholder for the ea calculation)

while true
    iter = iter + 1;

    xrold = xr;
    xr = xr - func(xr)/dfunc(xr);
    
    if xr ~= 0
        ea = abs((xr - xrold)/xr)*100;
    end
    
    if (ea <= es) || (iter >= maxit)
        break
    end
end

root = xr;
fx = func(xr);
end