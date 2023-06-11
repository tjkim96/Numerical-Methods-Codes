%% ME 2004: Change Maker
% DESCRIPTION: This code takes in some amount of money (from 1 to 99 cents) and returns the number 
% of pennies, nickels, dimes, and quarters needed to form the given amount of change. This code uses 
% the US coin denomination sans the 50-cent coin and the dollar coin. 
clear; clc; close all 

%% Test 1: money = 82 cents
% System Parameters
money = 82;

% Function Call
[numP,numN,numD,numQ] = change(money);

%% Test 2: Random values of money
% System Parameters
money_vec = randi(99,[1 3])
coins = zeros(length(money_vec),4)

% Function Call
for i=1:length(money_vec)
    [coins(i,1),coins(i,2),coins(i,3),coins(i,4)] = change(money_vec(i));
end


