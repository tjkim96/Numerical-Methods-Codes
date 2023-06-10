%% ME 2004: Plotting Practice
% DESCRIPTION: This script plots a bunch of stuff in a variety of ways. 
% This script requires an associated .mat file. Make sure the .mat file is in the same Working
% Directory (aka, folder) as this script. 
clear; clc; close all;

%% Load Data and Plot Positions
% Load data
load('two_car_data.mat');                   % .mat file must be in your Working Directory

% Plot positions
figure
plot(t,x1,'bx:')
hold on; grid on
plot(t,x2,'rd--')

legend('Car 1','Car 2','location','northwest')
xlabel('Time (s)')
ylabel('Position (m)')
title('Position of Two Cars')

%% Plot Velocities
my_fig = figure;
subplot(2,1,1)                              % Create 2x1 matrix of plots. Plot on the 1st (upper) plot
plot(t,v1,'ko','LineWidth',8)
grid on
xlabel('Time (s)')
ylabel('Car 1 Velocity (m/s)')


subplot(2,1,2)                              % Create 2x1 matrix of plots. Plot on the 2nd (lower) plot.
plot(t,v2,'p-.','Color',[0.5 0 0.8])
xlabel('Time (s)')
ylabel('Car 2 Velocity (m/s)')


sgtitle('Velocity of Two Cars')             % Adds an overall title to the figure window

% Set figure position
set(my_fig,'position',[1200 100 600 800])   % Play around with the numbers
