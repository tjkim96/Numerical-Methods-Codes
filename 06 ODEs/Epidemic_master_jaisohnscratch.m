%% ME 2004: Epidemic
% In this script, we will solve a system of 1st order ODEs describing the progression of an
% epidemic. 
clear; clc; close all;

%% System Parameters
a = 2e-3/7;                 % Infection rate [1/(person*day)]
r = 0.15;                   % Recovery rate [1/day]

S0 = 10e3;                  % Initial number of susceptible people
I0 = 1;                     % Initial number of infected people
R0 = 0;                     % Initial number of recovered people

t = 0:0.01:40;              % Simulation time vector [days]

%% Calling and Plotting Model
[S,I,R] = epidemic(a,r,S0,I0,R0,t);

figure
plot(t,S,'linewidth',2)
hold on; grid on
plot(t,I,'linewidth',2)
plot(t,R,'linewidth',2)

title('Epidemic Progression (Base Model)','fontsize',14,'Interpreter','latex')
xlabel('Time (days)','fontsize',14,'Interpreter','latex')
ylabel('Population (people)','fontsize',14,'Interpreter','latex')
legend('Susceptible','Infected','Recovered','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Function
function [S,I,R] = epidemic(a,r,S0,I0,R0,t)
% epidemic: computes the solution to a system of 1st-order ODEs describing the spread of an
% epidemic.
% 
% Syntax:   [S,I,R] = epidemic(a,r,S0,I0,R0,t)
% 
% Inputs:   
%   a:        Infection rate [1/(person*day)] (scalar)
%   r:        Recovery rate [1/day] (scalar)
%   S0:       Initial number of susceptible people [ND] (scalar)
%   I0:       Initial number of infected people [ND] (scalar)
%   R0:       Initial number of recovered people [ND] (scalar)
%   t:        Interval of integration. Must have at least 3 elements. [day] (vector)
% 
% Outputs:
%   S:        Number of susceptible individuals over time [ND] (vector)
%   I:        Number of infected individuals over time [ND] (vector)
%   R:        Number of recovered individuals over time [ND] (vector)

% The system of equations is:
%   dS/dt = -aSI
%   dI/dt = aSI-rI
%   dR/dt = rI
% 
% Define y = [S              dy/dt = [dS/dt    =   [-aSI     =    [-a*y(1)*y(2)
%             I     ----->            dI/dt         aSI-rI         a*y(1)*y(2) - r*y(2)
%             R]                      dR/dt]        rI]            r*y(2)]
dydt = @(t,y) [(-a*y(1)*y(2));
               (a*y(1)*y(2) - r*y(2));
               (r*y(2))];
[~,y] = ode45(dydt,t,[S0 I0 R0]);

% Parse outputs
S = y(:,1);
I = y(:,2);
R = y(:,3);
end
