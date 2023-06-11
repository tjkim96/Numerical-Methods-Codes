function F = futureworth_vectorized(P,i,n,plotStatus)
% futureworth_vectorized: Computes the future worth of money compounded annually. This version uses 
% vectorized arithmetic. Can optionally produce a plot of F over time. 
% 
% Syntax:       F = futureworth_vectorized(P,i,n,plotStatus)
% 
% Inputs:
%   P = Present worth of money [$] (scalar)
%   i = Interest rate [ND] (scalar)
%   n = Number of years [ND] (scalar)
%   plotStatus = plot toggle. 1 = plot on; 0 = plot off [ND] (scalar)
% 
% Outputs:
%   F = Future worth of money [$] (vector)

% Compute F
nn = 1:n;
F = P*(1+i).^nn;

% Optionally plot F vs. nn
if isequal(plotStatus,1)
    figure
    plot(nn,F,'bd-')
    grid on
    xlabel('Years [ND]')
    ylabel('Future Value [$]')
    title('Future Value of Money Compounded Annually (Vectorized)')
end

end

