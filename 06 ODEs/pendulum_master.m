%% ME 2004: Pendulum Demo
% This demo solves a 2nd order ODE (classic pendulum) using ode45 by breaking it into a system of
% 1st order ODEs.
clear; clc; close all;

%% System Parameters
L = 2;                          % Pendulum length [m]
g = 9.81;                       % Gravitational acceleration [m/s^2]

theta_0 = pi/3;                 % Initial angle [rad]
thetadot_0 = 0;                 % Initial angular velocity [rad/s]
IC = [theta_0 thetadot_0]';     % Initial condition column vector

t_start = 0;                    % Start of simulation [s]
dt = 0.1;                       % Time step [s]
t_end = 2*pi;                   % Max simulation time [s]
tVec = [t_start:dt:t_end]';     % Simluation time vector [s]

%% Solve via ode45()
% z = [theta thetadot]';
zdot = @(t,z) [z(2);
    -g/L*sin(z(1))];
[t,z] = ode45(zdot,tVec,IC);

%% Plotting
theta = z(:,1);                 % Extract theta
thetadot = z(:,2);              % Extract theta dot

figure
plot(tVec,theta,'o-')
grid on; hold on;
plot(tVec,thetadot,'d--')
xlabel('Time (s)')
ylabel('Responses')
title('Pendulum')
legend('$\theta$','$\dot{\theta}$','Interpreter','latex')