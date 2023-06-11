%% ME 2004: Rope Tension
% DESCRIPTION: We will construct a function to solve our statics/linear 
% algebra problem and we will test many different forcing functions (aka
% weights of the box) to verify our math. 
clear; clc; close all

%% Test 1: Check T1 and T2 for W=0 (base case)
% Intuitively, if there's no weight, there's no tension...let's test this!
% System Parameters
W = 0; % Weight of the box [N]

% Function Call
[T1,T2] = statics(W)

% Check Answers
assert(isequal(T1,0),'Incorrect T1')    % assert statements are useful 
assert(isequal(T2,0),'Incorrect T2')

% This emulates the MATLAB Grader test suite almost exactly. 

%% Further Analysis: Maximum Tension 
% Assume each rope can hold a maximum of 200 N. What's the heaviest the box
% can weigh? 
T_max = 200;        % Maximum tension in either rope 
W_vec = 0:10:250;   % Range of weights 
T1_vec = 0*W;       % Preallocate T1 vector
T2_vec = 0*W;       % Preallocate T2 vector

for i=1:length(W_vec)
    [T1_vec(i),T2_vec(i)] = statics(W_vec(i));
end

figure
grid on; hold on
plot(W_vec,T1_vec,'b.-')
plot(W_vec,T2_vec,'r.-')
yline(T_max,'m','Max Rope Tension','LabelHorizontalAlignment','left','linewidth',2);
xlabel('Box Weight (N)')
ylabel('Rope Tensions (N)')
title('Figure 1: Rope Tensions with Varying Box Weight')
legend('T_1','T_2','location','northwest')

% From the plot, we see that T1 almost surpasses T_max around W=140 N.
% Let's check this numerically:
T1_max = max(T1_vec(T1_vec <= T_max))
W_max = max(W_vec(T1_vec <= T_max))

% Refer to the link in the video description for a detailed explanation of
% the logical indexing lines. 

%% Function 
function [T1,T2] = statics(W)
% Input:
% W: Box weight [N] (scalar)
% 
% Outputs:
% T1: Rope 1 tension [N] (scalar)
% T2: Rope 2 tension [N] (scalar)

A = [cosd(45) -1;   
    sind(45) 0];    % This uses cosd() and sind(), not cos() and sin()
b = [0 W]';         % Make b a column vector by transposing the row vector
x = A\b;            % x is also a column vector

T1 = x(1);          % Extract T1
T2 = x(2);          % Extract T2
end
