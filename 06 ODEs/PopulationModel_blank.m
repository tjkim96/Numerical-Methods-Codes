%% ME 2004: Population Model
% In this script, we will analyze the population of the earth over time. We will solve the 
% first-order ODE numerically using ode45().
clear; clc; close all;

%% System Parameters
P0 = 100e6;         % Initial population in the year 1800 [people] 
a = 0.028;          % Birth rate parameter [1/year]
b = 2.9e-12;        % Death rate parameter [1/year/people]

t0 = 1800;          % Starting year [year]
tn = 2200;          % Final year [year]
t = t0:tn;          % Simulation time vector [year]

options = odeset('RelTol',10^-3,'AbsTol',10^-6);    % Extra accuracy (optional)


%% a) Steady-State Population
% Fixed points occur when dP/dt = a*P - b*P^2 = 0, thus:
% P = a/b --> stable (steady-state)
% P = 0   --> unstable


%% b) Phase Portrait/Anticipated Solution
% Done by hand


%% c) P vs. t, Maximum Population
% Numerical solution
    

% Find year in which we hit or surpass P99



% fprintf("The earth's population will reach %5.3f billion people!\n",P_ss/1e9)
% fprintf("We will reach 99 percent of the earth's maximum population in the year %d.\n\n",t99)

% Plot population and P99
% figure
% plot(t,P,t99,P99,'d','linewidth',2)
% grid on, hold on
% yline(P99,'r--','linewidth',1.5,'HandleVisibility','Off')
% 
% xlabel('Year','fontsize',14,'Interpreter','latex')
% ylabel("Earth's Population (people)",'fontsize',14,'Interpreter','latex')
% title('Population History and Maximum Population','fontsize',14,'Interpreter','latex')
% legend('Population','99$\%$ Population','fontsize',14,'Interpreter','latex','Location','southeast')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% d) Effect of Birth Rate Parameter 'a'




% Write for loop to iterate through each case of a


% figure
% plot(t,Pa,'linewidth',2)
% grid on; hold on
% 
% xlabel('Year','fontsize',14,'Interpreter','latex')
% ylabel("Earth's Population (people)",'fontsize',14,'Interpreter','latex')
% title('Effect of Birth Rate Parameter, $a$','fontsize',14,'Interpreter','latex')
% legend([repmat('$a= $ ',[length(aData) 1]) num2str(aData')...
%     repmat(' $\frac{1}{year}$',[length(aData) 1])],'fontsize',14,'Interpreter','latex','location','southeast')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% e) Effect of Death Rate Parameter 'b'




% Write for loop to iterate through each case of b


% figure
% plot(t,Pb,'linewidth',2)
% grid on; hold on
% 
% xlabel('Year','fontsize',14,'Interpreter','latex')
% ylabel("Earth's Population (people)",'fontsize',14,'Interpreter','latex')
% title('Effect of Death Rate Parameter, $b$','fontsize',14,'Interpreter','latex')
% legend([repmat('$b= $ ',[length(bData) 1]) num2str(bData')...
%     repmat(' $\frac{1}{ppl \cdot year}$',[length(bData) 1])],'fontsize',14,'Interpreter','latex','location','southeast')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% Function
function [tt,P] = population(t,P0,a,b,options)
% population: Solves the population model: P'=a*P-b*P^2  
% 
% Syntax: [t,P] = population(tspan,P0,a,b,options)
%           
% Inputs:    
%   t:          Interval of integration [year] (vector)
%                   t can be either a 2-element vector specifying only the start and end times,
%                   or a 3+ element vector containing all the points at which to solve the ODE.
%   P0:         Initial population [people] (scalar)
%   a:          Birth rate parameter [1/year] (scalar)
%   b:          Death rate parameter [1/year/people] (scalar)
%   options:    ode45() accuracy options [ND] (struct)
% 
% Outputs:   
%   tt:         Output time vector [year] (vector)
%                   If t contains 2 elements, tt is auto-generated by MATLAB's adaptive time step algorithm. 
%                   If t contains 3+ elements, tt = t.
%   P:          Population vector [people] (vector)


% Create anonymous function and solve 


end
