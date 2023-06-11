%% ME 2004: Curve Fitting Demo
% DESCRIPTION: In this demo, we'll fit a line to a dataset using the "fit()" functions and some
% other postprocessing function. Like most problems, there are many ways to approach curve fitting;
% this is just one method. 
clear; clc; close all;

%% 1) Load and plot dataset


% figure
% plot(V,i,'bo')
% xlabel('Voltage (V)')
% ylabel('Current (A)')
% title('Figure 1: Raw Data') 
% grid on

%% Construct best-fit line and plot




% figure
% plot(fitobject,V,i)
% xlabel('Voltage (V)')
% ylabel('Current (A)')
% title('Figure 2: Raw Data and Curve Fit') 
% grid on; hold on

%% Predict current given a voltage




% plot(V_predict,i_predict,'ks')          % Plot (V_predict,i_predict) as a black square
% legend('Raw Data','Best-Fit Line','Predicted Data','location','northwest')
