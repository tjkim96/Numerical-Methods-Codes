%% ME 2004: Mechanical Work
% In this script, we will apply the (Composite) Trapezoidal Rule to integrate some data related to
% mechanical work.
clear; clc; close all; 

%% Load/Plot Data
load('ME2004_WorkData.mat')
integrand = F.*cos(theta);

figure
subplot(3,1,1)
plot(x,F,'bd','linewidth',2)
grid on; hold on
ylabel('F (N)','fontsize',14,'Interpreter','latex')

subplot(3,1,2)
plot(x,theta,'bd','linewidth',2)
grid on; hold on
ylabel('$\theta$ (rad)','fontsize',14,'Interpreter','latex')

subplot(3,1,3)
plot(x,integrand,'bd','linewidth',2)
grid on; hold on

xlabel('Position (m)','fontsize',14,'Interpreter','latex')
ylabel('$F\cos(\theta)$ (N)','fontsize',14,'Interpreter','latex')
sgtitle('Mechanical Work Data','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Integrate






% figure
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer



% Print results to Command Window
% T = table(n',W',err','VariableNames',{'Number of Segments','Work Estimate (J)','Percent Error'})
