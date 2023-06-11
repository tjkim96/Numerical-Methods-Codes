%% ME 2004: While Loop Examples
% DESCRIPTION: In this script, we write and test 2 simple while loop examples. 
clear; clc; close all

%% Example 1) Recreating the example from the first video
a = [10 40 100 12]
b = 0*a;                % Preallocate the b vector 
i = 1;                  % Index variable/loop counter variable
while i < 5             % Iterate until i < 5 is violated
    b(i) = a(i)/2;
    i = i + 1;          % Increment i at the end of each iteration
end

%% Example 2) Infinite loop
% Press Ctrl+C to exit an infinite loop
x = 3;
threshold = 1;

while x > threshold 
    x = x - 0.0001      % Change the - to a + to create an infinite loop
end