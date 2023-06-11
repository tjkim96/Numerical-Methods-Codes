%% ME 2004: Vehicle Pitch Rate
% DESCRIPTION: This demo explores numerical differentiation using a
% forward, backward, and central difference. Numeric differentiation is
% applied to a comparison of two vehicles' pitch rates. 
clear; clc; close all;

%% Pitch and Pitch Rate
% Load and plot data contained in the MAT file:
load('ME2004_PitchData.mat')

figure 
grid on
plot(t,pitch1,t,pitch2)
xlabel('Time (s)')
ylabel('Pitch (deg)')
title('Figure 1: Pitch Data')
legend('Vehicle 1 (no control)','Vehicle 2 (control)')

% Compute and plot the pitch rate:
pitchRate1 = numericDerivatives(t,pitch1);      % Pitch rate of Vehicle 1
pitchRate2 = numericDerivatives(t,pitch2);      % Pitch rate of Vehicle 2

figure 
grid on; hold on
plot(t,pitchRate1)
plot(t,pitchRate2,'linewidth',1.25)
xlabel('Time (s)')
ylabel('Pitch Rate (deg/s)')
title('Figure 2: Pitch Rate Data')
legend('Vehicle 1 (no control)','Vehicle 2 (control)')

%% Numeric Derivatives Function
function dydx = numericDerivatives(x,y)
% Inputs:
% x: Independent variable data [ND] (vector)
% y: Dependent variable data [ND] (vector)
% 
% Output:
% dydx: Numeric estimate of dy/dx using all 3 schemes [ND] (vector)
% 
% This code is robust enough to use in any numeric differentiation
% application!

h = x(2) - x(1);            % Assumes constant step size (not always valid!!)
dydx = zeros(1,length(x));	% Preallocate dydx vector

% Forward difference @ first data point:
dydx(1) = (y(2)-y(1))/h;

% Backwards difference @ last data point:
dydx(end) = (y(end)-y(end-1))/h;

% Central difference @ interior data points:
for i=2:length(x)-1
    dydx(i) = (y(i+1)-y(i-1))/(2*h);    % 2h, not h!
end
end
