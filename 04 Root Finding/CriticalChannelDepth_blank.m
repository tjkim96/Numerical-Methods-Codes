%% ME 2004: Critical Channel Depth
% DESCRIPTION: In this example, we will use the grapical and bisection method to solve a root
% finding problem related to the critical channel depth of a trapzeoidal duct.
clear; clc; close all;

%% Graphical Method







% figure
% fplot(f,[xl xu],'linewidth',2)
% grid on; hold on
% yline(0,'r--','linewidth',2)
% 
% xlabel('y (m)','fontsize',14,'Interpreter','latex')
% ylabel('f(y) (ND)','fontsize',14,'Interpreter','latex')
% title('Critical Channel Depth (One Parameter Set)','fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Bisection Method




%% Q Parameter Study



% figure
% grid on; hold on
% 
% xlabel('y (m)','fontsize',14,'Interpreter','latex')
% ylabel('f(y) (ND)','fontsize',14,'Interpreter','latex')
% title('Critical Channel Depth (Q Parameter Study)','fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer







% legend(num2str(Q_vec'),'fontsize',14,'Interpreter','latex','location','southeast')


% Plot y vs Q
% figure
% plot(Q_vec,y_vec,'bd','LineWidth',2)
% grid on; hold on
% 
% xlabel('Q $\left( \frac{m^3}{s} \right)$','fontsize',14,'Interpreter','latex')
% ylabel('y (m)','fontsize',14,'Interpreter','latex')
% title('Critical Channel Depth Parameter Study','fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
