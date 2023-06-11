%% ME 2004: Relational Operator Examples
% DESCRIPTION: In this script, we explore relational operators and the resulting logicals.
clear; clc; close all

%% Comparing two scalars 
a = 1;
b = 2;

a < b
a >= b
a == b          % Use == for checking equality; use = for assignment 
a ~= b

%% Comparing two vectors/matrices
a = [0 1 5];
b = [1 1 2];

a <= b

c = [1 2; 
    3 4];
d = [2 2; 
    3 0];
c ~= d

%% Comparing a scalar to a vector/matrix
a = 3
b = 2:3:14
c = [4 5;
    11 90];

a < b               % Can compare scalars to arrays
a == c              
% b >= c            % Will generate an error (arrays are unuequally sized)

%% Sequential relational operators
2*3 < 3+4 ~= 4
((2*3) < (3+4)) ~= 4    % Much better way of writing the above line

%% Avoid "=="
a = 0.3;
b = 0.1 + 0.1 + 0.1;
a == b

(a-b) <= 1e-8       % Always use a tolerance when checking equality 
