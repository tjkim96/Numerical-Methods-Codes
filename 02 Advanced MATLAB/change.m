function [numP,numN,numD,numQ] = change(money)
% change: Computes the minimum number of pennies, nickels, dimes, and quarters needed to form a
% specified amount of money.
% 
% Syntax:       [numP,numN,numD,numQ] = change(money)
% 
% Inputs:
%   money = Amount of money, from 1 to 99 cents [cents] (scalar)
% 
% Outputs:
%   numP = Number of pennies [ND] (scalar)
%   numN = Number of nickels [ND] (scalar)
%   numD = Number of dimes [ND] (scalar)
%   numQ = Number of quarters [ND] (scalar)

money_copy = money;
p = 1;
n = 5;
d = 10;
q = 25;

numP = 0;
numN = 0;
numD = 0;
numQ = 0;

while money > 0
    if money >= q
        numQ = numQ + 1;
        money = money - q;
    elseif money >= d
        numD = numD + 1;
        money = money - d;
    elseif money >= n
        numN = numN + 1;
        money = money - n;   
    else
        numP = numP + 1;
        money = money - p;
    end
end

% Print results to Command Window
fprintf('To make %d cents, you need: \n',money_copy)
fprintf('%d pennies \n',numP)
fprintf('%d nickels \n',numN)
fprintf('%d dimes \n',numD)
fprintf('%d quarters \n',numQ)

end

