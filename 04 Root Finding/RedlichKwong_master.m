%% ME 2004: Redlich-Kwong Equation of State
% DESCRIPTION: In this example, we will solve a root finding problem about the Redlich-Kwong 
% Equation of State via the graphical method and also the built-in fzero() function. 
clear; clc; close all;

%% Plot
% Parameters
R = 0.518;                      % Methane gas constant [kJ/kg-K]
pc = 4580;                      % Critical pressure [kPa]
Tc = 191;                       % Critical temperature [K]
V = 3;                          % Tank volume [m^3]
T = 223;                        % Tank temperature [K]
p = 65e3;                       % Tank pressure [kPa]
a = 0.427*(R^2)*(Tc^2.5)/pc;    % Corrective Redlich-Kwong parameter
b = 0.0866*R*Tc/pc;             % Corrective Redlich-Kwong parameter

func = @(v) R*T*v.*(v+b).*sqrt(T) - a*(v-b) - p*(v-b).*v.*(v+b).*sqrt(T);
figure
fplot(func,[0 0.005],'linewidth',2)
grid on; hold on
yline(0,'r--','linewidth',2)

xlabel('Specific Volume $\left( \frac{m^3}{kg} \right)$','fontsize',14,'Interpreter','latex')
ylabel('Pressure (kPa)','fontsize',14,'Interpreter','latex')
title('Redlich-Kwong Root Finding','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% fzero()
guess = 3e-3;                   % Obtained from inspecting the plot
v_root = fzero(func,guess)

%% Comparing to Ideal Gas Law
v_ideal = R*T/p;
pcError = 100*abs((v_root-v_ideal)/v_root)

% There is a major discrepancy between the Redlich-Kwong Equation and the Ideal Gas Law.
