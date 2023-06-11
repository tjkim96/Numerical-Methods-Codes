%% A study of compound annual interest
clear       % Clears Workspace variables
clc         % Clears Command Window
close all   % Closes all plot windows

%% Call functions for a simple test case
P = 100e3;      % Present worth [$]
i = 0.05;       % Interest rate [ND]
n = 10;         % Number of years [ND]
plotStatus = 1; % Turns plots on

F_vec = futureworth_vectorized(P,i,n,plotStatus)
F_loop = futureworth_loop(P,i,n,plotStatus)

isequal(F_vec,F_loop)       % Check for equality