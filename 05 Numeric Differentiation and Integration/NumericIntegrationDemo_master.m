%% ME 2004: Numeric Integration Demo
% DESCRIPTION: In this demo, we'll integrate a set of discrete velocity-verusus-time data to compute 
% the total distance traveled by a vehicle using the composite trapezoid rule.
clear; clc; close all;

%% Load/plot data
load('velocityvstime.mat')

figure
plot(t,v,'bo-')
grid on; hold on
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Figure 1: Raw Data')

%% Compute total distance
% Using myTrap
totDist = myTrap(t,v)

% Using the built-in trapz() function to double check
totDist2 = trapz(t,v)

% myTrap and trapz match. Let's do a "back of the envelope" calculation just to be sure
base = t(end) - t(1);
avgheight = mean(v);
yline(avgheight,'r');
patch([t(1) t(1) t(end) t(end)],[v(1) avgheight avgheight v(1)],'r','facealpha',0.2)

totDist_approx = base*avgheight
% As expected, totDist_approx =/= totDist or totDist2, but it's relatively close. 
% Therefore, we can conclude our myTrap function works properly. 

%% Function
function I = myTrap(x,y)
% Inputs:
% x: x data. Can be equally or unequally spaced [ND] (vector)
% y: y data [ND] (vector)
% 
% Output:
% I: Integral estimate using the composite trapezoidal rule.

I = 0;      % Initialize the integral estimate
for i=1:length(x)-1
    I = I + (x(i+1)-x(i))*(y(i+1)+y(i))/2;
    % (new I) = (old I) + (base*avg height)
end
end
