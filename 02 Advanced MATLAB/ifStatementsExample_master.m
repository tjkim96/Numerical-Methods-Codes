%% ME 2004: If Statements Example
% DESCRIPTION: This script file demonstrates simple if/elseif/else examples.
clear; clc; close all

%% If/Else
x = 2;                  % Change this
thresh = 5;             % Threshold value

if x <= thresh
    y = x/2
else
    y = 10*x
end

%% Incorporating ElseIf
if x < thresh
    y = 1
    disp('if was executed') % Adding disp() statements like this can help debug
elseif x > thresh
    y = 10
    disp('elseif was executed')
else
    y = 100
    disp('else was executed')
end 

%% Nested If
if x > thresh
    if x > 3*thresh                         % You can nest if/elseif/else inside a block
        disp('nested if executed')
    elseif x > 2*thresh
        disp('nested elseif executed')
    else 
        disp('nested else executed')
    end
else
    disp('else executed')
end
