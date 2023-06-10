%% ME 2004: ODE Fixed Points (Root Finding)
% DESCRIPTION: In this example, we will use the grapical and Newton-Raphson method to solve a 
% root finding problem related to the fixed point of a differential equation. In this problem, the 
% NR method is carried out via a custom function. 
clear; clc; close all;

%% Generate Plot



% figure
% fplot(dxdt,[-5 5],'linewidth',2)
% grid on; hold on
% yline(0,'r--','linewidth',2)
% 
% xlabel('x (ND)','fontsize',14,'Interpreter','latex')
% ylabel('$\frac{dx}{dt}$ (ND)','fontsize',14,'Interpreter','latex')
% title('Fixed Points of an ODE','fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Locate All Roots





% fprintf('The root is:                       x_root=%9.9f\n',x_root)
% fprintf('dx/dt evaluated at the root is:          =%9.9f\n',fx)
% fprintf('Percent relative error:                ea=%9.9f\n',ea)
% fprintf('Number of iterations:                     %d\n\n',iter)
