%% ME 2004: Skydiver
% In this script, we will analyze the velocity of a falling parachutist. We will solve the first-order
% ODE numerically using ode45().
clear; clc; close all

%% Parameters
g = 9.81;           % Gravitational acceleration [m/s^2 ]
v0 = 0;             % Initial velocity [m/s]
m = 80;             % Mass [kg]
t_open = 15;        % Time parachute is opened [s]
cd_closed = 0.25;   % Drag coefficient, closed [kg/m]
cd_open = 5;        % Drag coefficient, open [kg/m]

dt = 0.01;          % ode45() step size [s] 
t_max = 30;         % Max simulation time [s]
t = 0:dt:t_max;     % ode45() simulation time vector
options = odeset('RelTol',10^-9,'AbsTol',10^-9);    % Extra accuracy needed


%% Steady-State Velocity
% Keep in mind that finding the steady-state velocity is equivalent to finding the fixed point(s).
% There are 2 possible steady-state values (when the chute is/is not opened)
vss_closed = (g*m/cd_closed)^0.5; 
vss_open   = (g*m/cd_open)^0.5;
fprintf('Terminal velocity,chute closed = %4.1f m/s',vss_closed)
fprintf('\nTerminal velocity,chute open   = %4.1f m/s \n\n',vss_open)


%% Phase Portrait/Anticipated Solution
% Done by hand


%% Effect of t_open
t_open_vec = 0:5:20;                        % Vector of t_open times
vt = zeros(length(t),length(t_open_vec));   % Matrix storing the velocities for each t_open case

% Write for loop to solve the ode for each t_open case
for i=1:length(t_open_vec)
    vt(:,i) = skydiver(g,v0,m,t_open_vec(i),cd_closed,cd_open,t,options);
end

figure
plot(t,vt,'linewidth',2)
grid on; hold on

xlabel('Time (s)','fontsize',14,'Interpreter','latex')
ylabel('Velocity $\left( \frac{m}{s} \right)$','fontsize',14,'Interpreter','latex')
title('Figure 1: Effect of $t_{open}$','fontsize',14,'Interpreter','latex')
legend([repmat('$t_{open}=$ ',[length(t_open_vec) 1]) num2str(t_open_vec')...
    repmat(' s',[length(t_open_vec) 1])],'fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% Effect of m
m_vec = 25:25:100;                      % Vector of masses
vm = zeros(length(t),length(m_vec));    % Matrix storing the velocities for each m case

% Write for loop to solve the ode for each m case
for i=1:length(m_vec)
    vm(:,i) = skydiver(g,v0,m_vec(i),t_open,cd_closed,cd_open,t,options);
end

figure
plot(t,vm,'linewidth',2)
grid on; hold on

xlabel('Time (s)','fontsize',14,'Interpreter','latex')
ylabel('Velocity $\left( \frac{m}{s} \right)$','fontsize',14,'Interpreter','latex')
title('Figure 2: Effect of $m$','fontsize',14,'Interpreter','latex')
legend([repmat('$m$=',[length(m_vec) 1]) num2str(m_vec')...
    repmat(' kg',[length(m_vec) 1])],'fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% Function
function v = skydiver(g,v0,m,t_open,cd_closed,cd_open,t,options)
% skydiver: Analysis of the velocity of a sky diver.   
% Syntax:   v = skydiver(g,v0,m,t_open,cd_closed,cd_open,t,options)
%           
% Inputs:    
%   g:                  Acceleration due to gravity [m/s^2] (scalar)
%   v0:                 Skydiver's initial velocity [m/s] (scalar)
%   m:                  Skydiver's mass [kg] (scalar)        
%   cd_closed, cd_open: Closed and open drag coefficients [kg/m] (scalars)
%   t_open:             Time at which parachute is opened [s] (scalar)
%   t:                  Simulation time vector [s] (vector)
%   options:            ode45() accuracy options [ND] (struct)
% 
% Output:   
%   v:                  Skydiver's velocity [m/s] (vector)


% Construct cd and dvdt functions
cd = @(t) cd_closed*(heaviside(t)-heaviside(t-t_open)) + cd_open*(heaviside(t-t_open));
dvdt = @(t,v) g-(cd(t)/m).*v.^2;

% Solve numerically
[~,v] = ode45(dvdt,t,v0,options);   % Ignore the t output
end
