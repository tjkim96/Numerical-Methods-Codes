function F = futureworth_loop(P,i,n,plotStatus)
% futureworth_loop: Computes the future worth of money compounded annually. This version uses 
% loop-based arithmetic. Can optionally produce a plot of F over time. 
% 
% Syntax:       F = futureworth_loop(P,i,n)
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
F = 0*nn;       % preallocate F vector

for k=1:length(nn)
    F(k) = P*(1+i)^nn(k);
end

% Optionally plot F vs. nn
if isequal(plotStatus,1)
    figure
    plot(nn,F,'bd-')
    grid on
    xlabel('Years [ND]')
    ylabel('Future Value [$]')
    title('Future Value of Money Compounded Annually (Loop)')
end

end

