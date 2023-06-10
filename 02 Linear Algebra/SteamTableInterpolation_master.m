%% ME 2004: Steam Table Interpolation
% DESCRIPTION: In this example, we will linearly interpolate to obtain some properties of
% superheated water vapor. 
clear; clc; close all;

%% Load/Plot Data
load('ME2004_InternalEnergyData.mat')

figure
plot(T,u,'ko','LineWidth',2)
grid on; hold on

xlabel('Temperature ($^\circ$C)','fontsize',14,'Interpreter','latex')
ylabel('Specific Internal Energy $\left( \frac{kJ}{kg} \right)$','fontsize',14,'Interpreter','latex')
title('Superheated Water Vapor Properties (p=0.06 bar)','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Interpolate at a Single Temperature
Tq1 = 300;
uq1 = interp1(T,u,Tq1)

% Append to plot
plot(Tq1,uq1,'bh','LineWidth',2)

%% Interpolate at Multiple Temperatures
Tq2 = 180:50:380;
uq2 = interp1(T,u,Tq2)

% Append to plot
plot(Tq2,uq2,'bh','LineWidth',2)
legend('Raw Data','Interpolated Points','location','northwest','fontsize',14,'Interpreter','latex')
