%% ME 2004: Logical Operator Examples
% DESCRIPTION: In this script, we explore logical operators.
clear; clc; close all

%% Scalar Logical Expressions
% Use && and || for scalar logical expressions (short-circuiting)
a = 1;
b = 2;

(a < 3) && (b ~= 7)
(a < 3) && (b <= -1)
(a+b <= 0) || (a/b > -2)

%% Array Logical Expressions
% Use & and | for array logical expressions
a = [3 0 4];
b = [2 2 4];

(a < b) | (a == b)

%% Complex Example
a = 5;
b = -2;
c = 0:2:4;

(~((a < 2) && (a > 0))) | (c >= a)
% && is used because (a < 2) and (a > 0) are scalars
% | is used because (c >= a) yields a logical vector 
