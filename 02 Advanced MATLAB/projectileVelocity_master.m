%% ME 2004: Projectile Velocity
% DESCRIPTION: This script shows a useful application of the heaviside() function. It can be used to
% control when components of a piecewise function turn "on" and "off."
clear; clc; close all 

%% System parameters
t = 0:0.5:16;
v1 = 10*t.^2 - 5*t;             % First component of the piecewise function
v2 = 624 - 3*t;                 % Second component of the piecewise function
b = 8;                          % Time at which the velocity changes from v1 to v2

%% Build v(t) using heaviside()
v = v1.*(1-heaviside(t-b)) + v2.*heaviside(t-b);    
% (1-heaviside(t-b)) reverses what heaviside(t-b) evaluates to. 
% If heaviside(t-b) = 1 at some t, (1-heaviside(t-b)) = 0.
v_alt = v1 + (v2-v1).*heaviside(t-b);   % Alternate expression for v

err = abs(v-v_alt);                     % (Absolute value of the) Error between v and v_alt

% Plotting
figure
sgtitle('Projectile Velocity Using {\it{heaviside()}}') % Puts a title above the subplot grids
subplot(2,1,1)                 % Create a 2x1 matrix of plots. Plot on the first (upper) subplot
plot(t,v,'bs-','linewidth',1.5)
grid on; hold on
plot(t,v_alt,'rd-')
ylim([-50 700])
xlabel('Time (s)')
ylabel('Velocity (m/s)')
legend('v','v_{alt}','location','northwest')

subplot(2,1,2)                  % Plot on the second (lower) subplot
plot(t,err,'ko-')
grid on
xlabel('Time (s)')
ylabel('Velocity Error (m/s)')
