%% ME 2004: Numeric Integration Demo
% DESCRIPTION: In this demo, we'll integrate a set of discrete velocity-verusus-time data to compute 
% the total distance traveled by a vehicle using the composite trapezoid rule.
clear; clc; close all;

%% Load/plot data


% figure
% plot(t,v,'bo-')
% grid on; hold on
% xlabel('Time (s)')
% ylabel('Velocity (m/s)')
% title('Figure 1: Raw Data')

%% Compute total distance
% Using myTrap


% Using the built-in trapz() function to double check


% myTrap and trapz match. Let's do a "back of the envelope" calculation just to be sure



% patch([t(1) t(1) t(end) t(end)],[v(1) avgheight avgheight v(1)],'r','facealpha',0.2)



%% Function

% Inputs:
% x: x data. Can be equally or unequally spaced [ND] (vector)
% y: y data [ND] (vector)
% 
% Output:
% I: Integral estimate using the composite trapezoidal rule.



   
    


