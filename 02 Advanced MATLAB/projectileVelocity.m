%% ME 2004: Projectile Velocity
% DESCRIPTION: This script shows a useful application of the heaviside() function. It can be used to
% control when components of a piecewise function turn "on" and "off."
clear; clc; close all 

%% System parameters
t = 0:0.5:16;



%% Build v(t) using heaviside()




% Plotting
% figure
% sgtitle('Projectile Velocity Using {\it{heaviside()}}') % Puts a title above the subplot grids
% subplot(2,1,1)                 % Create a 2x1 matrix of plots. Plot on the first (upper) subplot
% plot(t,v,'bs-','linewidth',1.5)
% grid on; hold on
% plot(t,v_alt,'rd-')
% ylim([-50 700])
% xlabel('Time (s)')
% ylabel('Velocity (m/s)')
% legend('v','v_{alt}','location','northwest')
% 
% subplot(2,1,2)                  % Plot on the second (lower) subplot
% plot(t,err,'ko-')
% grid on
% xlabel('Time (s)')
% ylabel('Velocity Error (m/s)')
