%% ME 2004: Charles's Law
% DESCRIPTION: In this example, we will curve fit some data pertaining to a Charles's Law-based
% experiment the "long way" (without using any built-in curve fitting functions).
clear; clc; close all;

%% a) Load and Plot Data
load('ME2004_CharlesLawData.mat');

figure
plot(T,p,'bs','linewidth',2)
grid on; hold on

xlabel('Gas Temperature $\left( ^{\circ}C \right)$','fontsize',14,'Interpreter','latex')
ylabel('Gas Pressure (atm)','fontsize',14,'Interpreter','latex')
title("Charles's Law Experiment",'fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% b) Compute Regression Coefficients
% Compute summation terms
n = length(T);          % Number of data points
Sx = sum(T);            % Sum of independent variables
Sxx = sum(T.^2);        % Sum of square of independent variables
Sy = sum(p);            % Sum of dependent variables
Syy = sum(p.^2);        % Sum of square of dependent variables
Sxy = sum(T.*p);        % Sum of product of independent and dependent variables

% Set up and solve linear system
A = [n  Sx;
    Sx  Sxx];
b = [Sy Sxy]';
coefs = A\b;

% Extract regression coefficients
a0 = coefs(1);          % Intercept
a1 = coefs(2);          % Slope

% Append best-fit line to plot
pressure = @(T) a1*T + a0;     % Generate best-fit line as an anonymous function
fplot(pressure,[min(T) max(T)],'r','linewidth',2)

%% c) Compute R^2
St = sum((p-mean(p)).^2);
Sr = sum((p - pressure(T)).^2);
R2 = 1 - (Sr/St)

%% d) Predict Pressure
T_predict = 55;
p_predict = pressure(T_predict)

% Append to plot
plot(T_predict,p_predict,'ko','linewidth',2)

legend('Data','Regression Line','Predicted Pressure',...
    'fontsize',14,'Location','northwest','Interpreter','latex')

% Visually inspecting the plot confirms our numerical answer. 
