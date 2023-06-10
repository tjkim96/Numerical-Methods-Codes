%% ME 2004: Probability Density Function 
% DESCRIPTION: In this example, we will construct the Probability Density Function (Bell Curve) and
% experiment with various plot settings (step size, colors, etc.) to learn how the plot's
% readability is affected.
clear; clc; close all;

%% a) Create z vector from -6 to 6 
z_start = -6;
z_end = 6;
dz = 0.000001;                      % Step size. Experiment with this
z = z_start:dz:z_end;

%% b) Compute P vector 
P = exp(-z.^2/2)/sqrt(2*pi);

%% c) Plotting
figure

c = uisetcolor                      % Customize the plot color
plot(z,P,'linewidth',2,'color',c)   
grid on
xlabel('z')
ylabel('frequency')
title('Figure 1: Normal Probability Density Function')
% No units required since this is a "simple" function

%% d) Comments
% d) After testing various step sizes, we found dz = 0.1 to be acceptable. Note that there are 
% infinitely many "correct" answers...but there are also infinitely many "incorrect" answers. 
