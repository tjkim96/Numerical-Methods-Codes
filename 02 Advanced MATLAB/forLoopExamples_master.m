%% ME 2004: For Loop Examples
% DESCRIPTION: In this script, we write and test 4 simple for loop examples. 
clear; clc; close all

%% Example 1) Recreating the example from the first video
a = [10 40 100 12]

for i=1:4
    b(i) = a(i)/2;
end

%% Example 2) Generalized Example 1
a = [10 40 100 12 15]
b = 0*a;                    % Preallocate the b vector

for i=1:length(a)           % Use length(a) (or length(b)) instead of "4"
    b(i) = a(i)/2;
end

%% Example 3) Decrementing the loop counter
for j = 5:-1:2              
    disp(j)
end

%% Example 4) Non-unity increment
x = 0:5;

for z = 1:2:length(x)
    x(z) = 2*x(z);      % Double every other element in the x vector 
end
