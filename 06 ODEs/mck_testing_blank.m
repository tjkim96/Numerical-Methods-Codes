%% ME 2004: Mass-Spring-Damper System
% In this script, we will study the position and velocity of a mass-spring-damper system under the
% influence of different parameters and loads (forcing functions).
clear; clc; close all;

%% Effect of Damping (No Forcing)
% Parameters
x0 = 1;             % Initial displacement [m]
v0 = 0;             % Initial velocity [m/s]

dt = 0.01;          % Simulation time step [s]
tend = 20;          % Max simulation time [s]
t = 0:dt:tend;      % ode45() time vector [s]

m = 20;             % Mass [kg]
k = 20;             % Spring constant [N/m]
cvec = [0 8 40];    % Vector of damping coefficients [kg/s = N*s/m]

u0 = 0;             % Magnitude of the forcing function [N]
u = @(t) u0 + 0*t;  % Forcing function [N]
options = odeset('RelTol',1e-6,'AbsTol',1e-6);  % Change ode45() tolerances


% mck() Function Call








% Plot position
% figure
% sgtitle('Effect of Damping, $c$','fontsize',14,'Interpreter','latex')
% 
% subplot(2,1,1)
% plot(t,xc,'linewidth',2)
% grid on; hold on
% ylabel('Position (m)','fontsize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')
% 
% % Plot velocity
% subplot(2,1,2)
% plot(t,vc,'linewidth',2)
% grid on; hold on
% xlabel('Time (s)','fontsize',14,'Interpreter','latex')
% ylabel('Velocity $\left( \frac{m}{s} \right)$','fontsize',14,'Interpreter','latex')
% legend([repmat('$c= $ ',[length(cvec) 1]) num2str(cvec')...
%     repmat(' $\frac{N \cdot s}{m}$',[length(cvec) 1])],...
%     'fontsize',14,'Interpreter','latex','location','southeast')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% Effect of Forcing Function
% Parameters 
c = 4;          % Constant damping coefficient [N*s/m]
tend = 40;      % New max simulation time [s]
t = 0:dt:tend;  % New ode45() time vector [s]
u0 = 10;        % Magnitude of forcing function [N]

% Switch statement to determine the forcing function


















% % mck() Function Call
% [~,x,v] = mck(m,c,k,u,t,x0,v0,options);
% 
% % Plot forcing function
% figure
% sgtitle(['Response to ' type ' Vibration'],'fontsize',14,'Interpreter','latex')
% 
% subplot(3,1,1)
% fplot(u,[0 tend],'linewidth',2)
% grid on; hold on
% ylabel('Forcing Function (N)','fontsize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')
% 
% % Plot position
% subplot(3,1,2)
% plot(t,x,'linewidth',2)
% grid on; hold on
% ylabel('Position (m)','fontsize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')
% 
% % Plot velocity
% subplot(3,1,3)
% plot(t,v,'linewidth',2)
% grid on; hold on
% xlabel('Time (s)','fontsize',14,'Interpreter','latex')
% ylabel('Velocity $\left( \frac{m}{s} \right)$','fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
