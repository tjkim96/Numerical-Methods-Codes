function [root,fx,ea,iter] = bisection_xtol(func,xl,xu,es,maxit)
% bisection_xtol: Implements the bisection rule for root finding. Includes two stopping criteria: 
% if the percent relative error falls under a threshold, or if the algorithm exceeds the maximum 
% number of iterations.
% 
% Inputs:
% func:     Anonymous function for root finding [ND] 
% xl:       Initial lower guess [ND] (scalar)
% xu:       Initial upper guess [ND] (scalar)
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

% Check if initial lower/upper guesses are valid (function values at guesses have opposite signs)
if sign(func(xl)) == sign(func(xu))
    error('no sign change -- check your xl/xu again')
end



iter = 0;   % Start counting the number of iterations
xr = xl;    % Guess that the root is the lower guess
ea = 100;   % Placeholder percent relative error for 1st iteration

while true
    iter = iter + 1;

    xrold = xr;
    xr = (xl + xu)/2;
    
    if xr ~= 0
        ea = abs((xr - xrold)/xr)*100;
    end
    
    test = func(xl)*func(xr);
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end

    if (ea <= es) || (iter >= maxit)
        break
    end
end

root = xr; 
fx = func(xr);
end