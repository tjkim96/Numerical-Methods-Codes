%% ME 2004: ode45 Demo
% DESCRIPTION: In this example, we solve the following 1st-order ODE:
% 
% dy/dt = -2y + 6
% y0 = 1
% 
% using MATLAB's ode45 function. 
clear; clc; close all

%% ode45
% You should always sketch the phase portrait + anticipated solution BEFORE
% you do ANYTHING in MATLAB. You want to make sure you have a general idea
% of what y(t) looks like so you can check the solution from ode45. 
% 
% ode45 inputs:
func = @(t,y) -2*y + 6;         % Don't forget @(t,y) instead of just @(y) or @(t)
t0 = 0;                         % Start time [s]
t_end = 4;                      % End time [s]
tspan = [t0 t_end];             % 2 element vector. Don't "hard code" t0/t_end!
% tspan = t0:0.1:t_end;           % Use this if you want "nice" entries in the t vector
y0 = 1;                         % 1st order ODE --> only 1 initial condition

% Call ode45:
[t,y] = ode45(func,tspan,y0);

% Plot the solution:
plot(t,y,'b*-')
grid on; hold on;

fixedPoint = 3;                 % Verify this yourself! 
yline(fixedPoint,'r');

xlabel('Time')
ylabel('Response')
title('ode45 Example')
ylim([0 1.5*fixedPoint])
legend('ode45 Solution','Fixed Point')

% We see that the ode45 output agrees with our sketched anticipated
% solution. 
