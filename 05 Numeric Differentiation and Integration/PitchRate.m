%% ME 2004: Vehicle Pitch Rate
% DESCRIPTION: This demo explores numerical differentiation using a
% forward, backward, and central difference. Numeric differentiation is
% applied to a comparison of two vehicles' pitch rates. 
clear; clc; close all;

%% Pitch and Pitch Rate
% Load and plot data contained in the MAT file:


% figure 
% plot(t,pitch1,t,pitch2)
% grid on
% xlabel('Time (s)')
% ylabel('Pitch (deg)')
% title('Figure 1: Pitch Data')
% legend('Vehicle 1 (no control)','Vehicle 2 (control)')

% Compute and plot the pitch rate:



% figure 
% grid on; hold on
% plot(t,pitchRate1)
% plot(t,pitchRate2,'linewidth',1.25)
% xlabel('Time (s)')
% ylabel('Pitch Rate (deg/s)')
% title('Figure 2: Pitch Rate Data')
% legend('Vehicle 1 (no control)','Vehicle 2 (control)')

%% Numeric Derivatives Function

% Inputs:
% x: Independent variable data [ND] (vector)
% y: Dependent variable data [ND] (vector)
% 
% Output:
% dydx: Numeric estimate of dy/dx using all 3 schemes [ND] (vector)
% 
% This code is robust enough to use in any numeric differentiation
% application!




% Forward difference @ first data point:


% Backwards difference @ last data point:


% Central difference @ interior data points:




