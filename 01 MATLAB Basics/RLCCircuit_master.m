%% ME 2004: RLC Circuit
% DESCRIPTION: In this example, we will plot an RLC circuit on 3 subplots with varying x-axis limits
% to investigate how to best display data. 
clear; clc; close all;

%% a) Time vector
% First, we should define the other parameters
q0 = 10;                % Initial charge on the capacitor [C]
R = 60;                 % Resistance [Ohms] 
L = 9;                  % Inductance [H]
C = 5e-5;               % Capacitance [F]


% And now the time vector
t_start = 0;
t_end = 20;
dt = 0.01;              % No step size is explicitly given in the prompt, so use your judgement

t = t_start:dt:t_end;

%% b) Construct q(t)
q = q0*exp(-R*t/(2*L)).*cos(sqrt(1/(L*C) - (R/(2*L))^2)*t); 

%% c) Subplots
figure
sgtitle('Figure 1: Capacitor charge time history')      % Uses sgtitle() instead of title()


% Upper subplot: x-axis goes from 0-0.2 s
subplot(3,1,1)
plot(t,q)
grid on

xlim([0 0.2])
xlabel('Time (s)')
ylabel('Capacitor Charge (C)')


% Middle subplot: x-axis goes from 0-2 s
subplot(3,1,2)
plot(t,q)
grid on

xlim([0 2])
xlabel('Time (s)')
ylabel('Capacitor Charge (C)')


% Lower subplot: x-axis spans full time range (0-20 s)
subplot(3,1,3)
plot(t,q)
grid on

xlabel('Time (s)')
ylabel('Capacitor Charge (C)')

%% d) Best subplot?
% Subplot 2 (middle) is the best. q(t) oscillates wildly at the beginning but attenuates over time. 
% The middle subplot fully captures the oscillations but does not include much of the steady-state 
% attenuation. The upper subplot does not capture the full behavior, whereas the lower subplot
% includes too much information. 
