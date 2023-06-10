%% ME 2004: Numerical Differentiation, Step Size Exploration
% In this script, we will numerically differentiate a simple function via 3 schemes (forward,
% backward, and central difference) to understand each scheme's numerical and graphical 
% interpretations. 
clear; clc; close all; 

%% a) Analytical Derivative



% figure
% sgtitle('Numerically Differentiating y=sin(x)','fontsize',14,'Interpreter','latex')
% subplot(2,2,1)
% fplot(y,[0 pi],'k')
% grid on; hold on
% fplot(dydx,[0 pi])
% 
% xlabel('x','fontsize',14,'Interpreter','latex')
% ylabel('y','fontsize',14,'Interpreter','latex')
% title('(a,b) Analytical+Numerical Differentiation of a Function','Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[923 82 984 851])   % Will probably need to change this on your computer

%% b) Numeric Derivatives




% Compute/plot forward difference

% fprintf('Forward difference at x=%2.2f with a step size of dx=%2.2f = %4.4f \n',x,dx,FD)
% plot([x x+dx],[y(x) y(x+dx)],'bp-','linewidth',2,'markersize',7)

% Compute/plot backward difference

% fprintf('Backward difference at x=%2.2f with a step size of dx=%2.2f = %4.4f \n',x,dx,BD)
% plot([x-dx x],[y(x-dx) y(x)],'mp-','linewidth',2,'markersize',7)

% Compute/plot central difference

% fprintf('Central difference at x=%2.2f with a step size of dx=%2.2f = %4.4f \n',x,dx,CD)
% plot([x-dx x+dx],[y(x-dx) y(x+dx)],'cp-','linewidth',2,'markersize',7)
% 
% legend('y(x)','$\frac{dy}{dx}$','Forward Difference @ x=2','Backwards Difference @ x=2',...
%     'Central Difference @ x=2',...
%     'interpreter','latex','location','southwest','FontSize',10)

%% c) Variable Step Size





% Pre-set the subplot
% subplot(2,2,2)
% fplot(y,[0.5 pi],'k')
% grid on; hold on
% 
% xlabel('x','fontsize',14,'Interpreter','latex')
% ylabel('y','fontsize',14,'Interpreter','latex')
% title(['(c) ' scheme ' Difference at x=2, Variable Step Size'],'Interpreter','latex')
% legend('y','location','southwest','Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')


% Write a for loop to iterate through each step size. The for loop will have a switch statement to
% determine which type of derivative (Forward, Central, or Backward) to compute/plot.
































% Compute and plot percent error of chosen method


% subplot(2,2,[3 4])
% plot(dx_vec,pcError,'bh:','linewidth',2)
% grid on
% 
% xlabel('Step Size $\Delta{x}$','fontsize',14,'Interpreter','latex')
% ylabel('Percent Error','fontsize',14,'Interpreter','latex')
% title(['(c) ' scheme ' Difference at x=2, Variable Step Size Error'],'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')
