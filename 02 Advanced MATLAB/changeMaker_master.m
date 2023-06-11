%% ME 2004: Change Maker
% DESCRIPTION: This code takes in some amount of money (from 1 to 99 cents) and returns the number 
% of pennies, nickels, dimes, and quarters needed to form the given amount of change. This code uses 
% the US coin denomination sans the 50-cent coin and the dollar coin. 
clear; clc; close all 

%% Test 1: Money = 82 cents
% System Parameters
money = 82                              

% Function Call
[numP,numN,numD,numQ] = change(money);

%% Test 2: Random Values of Money
money_vec = randi(99,[1 3])
coins = zeros(length(money_vec),4);

% Function Call
for i=1:length(money_vec)
    [coins(i,1),coins(i,2),coins(i,3),coins(i,4)] = change(money_vec(i));
end

%% Function
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

% Print answers to Command Window
fprintf('To make %d cents, you need: \n',money_copy)
fprintf('%d pennies \n',numP)
fprintf('%d nickels \n',numN)
fprintf('%d dimes \n',numD)
fprintf('%d quarters \n\n',numQ)

end
