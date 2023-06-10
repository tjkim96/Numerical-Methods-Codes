%% ME 2004: Space-Time Diagrams
% In this script, we will apply the (Composite) Trapezoidal Rule to generate the space-time diagram
% of a vehicle platoon. We will see that the trapz() function can work for unequally spaced data.
clear; clc; close all; 

%% Load/Plot Data
load('ME2004_VelocityData.mat')

figure
sgtitle('Space- and Velocity-Time Diagram','fontsize',14,'Interpreter','latex')

subplot(2,1,2)
plot(t,V,'bo-','linewidth',2)
grid on; hold on
plot(t2,V2,'rs-','linewidth',2)

xlabel('Time (s)','fontsize',14,'Interpreter','latex')
ylabel('Velocity $\left( \frac{m}{s} \right)$','fontsize',14,'Interpreter','latex')
legend('Trial 1','Trial 2','fontsize',14,'Interpreter','latex','location','southeast')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer



% Plot Trial 2 velocity 
figure
plot(t2,V2,'rs-','linewidth',2)
grid on; hold on

% Draw trapezoids (don't worry about these lines)
xverts = [t2(1:end-1); t2(1:end-1); t2(2:end); t2(2:end)];
yverts = [zeros(1,length(t2)-1); V2(1:end-1); V2(2:end); zeros(1,length(t2)-1)];
c = rand(1,length(xverts));
p = patch(xverts,yverts,c,'LineWidth',0.75,'FaceAlpha',0.2);

xlabel('Time (s)','fontsize',14,'Interpreter','latex')
ylabel('Velocity $\left( \frac{m}{s} \right)$','fontsize',14,'Interpreter','latex')
title('Trial 2 Velocity','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Compare Total Distances Traveled and Generate Space-Time Diagrams
% Total distance traveled
d = trapz(t,V)
d2 = trapz(t2,V2)

% Cumulative distance traveled
X = cumtrapz(t,V);
X2 = cumtrapz(t2,V2);

figure(1)
subplot(2,1,1)
plot(t,X,'b','linewidth',2)
grid on; hold on
plot(t2,X2,'r','linewidth',2)

ylabel('Position (m)','fontsize',14,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
