%% ME 2004: Mass-Spring-Damper Design Problem
% In this script, we will solve a mass-spring-damper design-oriented problem. We will have to find
% the damper values (c values) which satisfy a set of performance requirements.
clear; clc; close all;

%% System Parameters
% tic
m = 60;                 % Cart's mass [kg] (scalar)
k = 55;                 % Spring stiffness [N/m] (scalar)
F1 = 45;                % Initial magnitude of the input force [N] (scalar)
t1 = 10;                % Time at which the input force reaches 0 [s] (scalar)
t_end = 25;             % Final simulation time [s]
IC = [0 0];             % Initial position and velocity (vector)

dt = 1e-2;              % Simulation time step [s]
t = 0:dt:t_end;         % Simulation interval [s] (vector)

v_min = 0.4;            % Min forward velocity after t1 (Requirement 1) [m/s]
v_max = 0.5;            % Max forward velocity after t1 (Requirement 1) [m/s]

options = odeset('RelTol',1e-6,'AbsTol',1e-6);      % Set ode45() tolerances


%% Construct Forcing Function


% figure
% fplot(u,[0 t_end],'linewidth',2)
% grid on
% xlabel('Time (s)','fontsize',14,'Interpreter','latex')
% ylabel('Forcing Function (N)','fontsize',14,'Interpreter','latex')
% title('Mass-Spring-Damper Input Force','fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% Single c Testing



% Call mck function, then determine if requirements are met




% % Plot responses
% figure
% sgtitle(['Kinematics of Mass-Spring-Damper System, c=' num2str(c_test)...
%     ' $\left( \frac{N*s}{m} \right)$'],'fontsize',14,'Interpreter','latex')
% 
% % Plot position
% subplot(2,1,1)
% plot(t,x,'linewidth',2)
% grid on
% ylabel('Position (m)','fontsize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')
% 
% % Plot velocity
% subplot(2,1,2)
% plot(t,v,'linewidth',2)
% grid on; hold on
% yline(v_min,'r--','$v_{min}$','linewidth',2,'LabelVerticalAlignment','bottom',...
%     'fontsize',14,'Interpreter','latex')        % Draw line representing min v
% yline(v_max,'r--','$v_{max}$','linewidth',2,'LabelVerticalAlignment','top',...
%     'fontsize',14,'Interpreter','latex')        % Draw line representing min v
% xline(t1,'k--','$t_1$','linewidth',2,'LabelOrientation','horizontal',...
%     'fontsize',14,'Interpreter','latex')        % Draw line at t=t1   
% ylim([min(v) 1.2*max(max(v),v_max)])
% xlabel('Time (s)','fontsize',14,'Interpreter','latex')
% ylabel('Velocity $\left( \frac{m}{s} \right)$','fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% Sweep test to identify min/max c's
% Instantiate parameters/storage vectors
c_start = 4;            % Based on experimentation in the previous part
c_end = 8;              % Based on experimentation in the previous part
dc = 1e-2;              % Desired step size
c = c_start:dc:c_end;   % Damping values to sweep [N*s/m]
R1_met = 0*c;           % Vector storing a Boolean representing if Requirement 1 is met
R2_met = 0*c;           % Vector storing a Boolean representing if Requirement 2 is met
v_maxaftert1 = 0*c;     % Vector storing the max v after t1 in each iteration


% Write a for loop to iterate through all of the possible c values




% toc


% % Plot Requirements
% figure
% sgtitle('Judging Requirement 1','fontsize',14,'Interpreter','latex')
% 
% subplot(2,1,1)
% plot(c,v_maxaftert1,'b.-','linewidth',2)
% grid on; hold on
% yline(v_min,'r--','$v_{min}$','linewidth',2,'LabelVerticalAlignment','bottom',...
%     'fontsize',14,'Interpreter','latex')        % Draw line representing min v
% yline(v_max,'r--','$v_{max}$','linewidth',2,'LabelVerticalAlignment','top',...
%     'fontsize',14,'Interpreter','latex')        % Draw line representing min v
% xlabel('Damper Value $\left( \frac{N*s}{m} \right)$','fontsize',14,'Interpreter','latex')
% ylabel('Max $v(t)$ After $t_1$','fontsize',14,'Interpreter','latex')
% ylim([0.8*v_min 1.2*v_max])
% set(gca,'TickLabelInterpreter','latex')
% 
% subplot(2,1,2)
% plot(1:length(c),R1_met,'b.-')
% grid on;
% xlabel('Iterations (ND)','fontsize',14,'Interpreter','latex')
% ylabel('Boolean (ND)','fontsize',14,'Interpreter','latex')
% title('Requirement 1 Met?','fontsize',14,'Interpreter','latex')
% ylim([0 1.1])
% xlim([1 length(c)])
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% Determine Lower/Upper c







%% Function
function [R1_met,v_maxaftert1,R2_met] = checkRequirements(t,v,t1,v_min,v_max,c,c_max)
% checkRequirements: Checks whether Requirements 1 and 2 are met for each c-value.
% 
% Inputs:
%   t: Time vector [s] (vector)
%   v: Cart's velocity over time [m/s] (vector)
%   t1: Time at which u(t) reaches 0 [s] (scalar)
%   v_min: Lower velocity limit for Requirement 1 [m/s] (scalar)
%   v_max: Upper velocity limit for Requirement 1 [m/s] (scalar)
%   c: Chosen damping value [N*s/m] (scalar)
%   c_max: Max possible damping value according to Requirement 2 [N*s/m] (scalar)
% 
% Outputs:
%   R1_met: Boolean if Requirement 1 is met [ND] (scalar)
%   v_maxaftert1: Max velocity after t1 [m/s] (scalar)
%   R2_met: Boolean if Requirement 2 is met [ND] (scalar)


% Check Requirement 1


% fprintf('Peak forward velocity after t=t1: %4.4f m/s \n',v_maxaftert1)
% fprintf('Is Requirement 1 met? %d \n',R1_met)

% Check Requirement 2

% fprintf('Is Requirement 2 met? %d \n',R2_met)
end
