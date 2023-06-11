%% ME 2004: Pendulum Demo
% This demo solves a 2nd order ODE (classic pendulum) using ode45 by breaking it into a system of
% 1st order ODEs.
clear; clc; close all;

%% System Parameters












%% Solve via ode45()





%% Plotting



% figure
% plot(tVec,theta,'o-')
% grid on; hold on;
% plot(tVec,thetadot,'d--')
% xlabel('Time (s)')
% ylabel('Responses')
% title('Pendulum')
% legend('$\theta$','$\dot{\theta}$','Interpreter','latex')