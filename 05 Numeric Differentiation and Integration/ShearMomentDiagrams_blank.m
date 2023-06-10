%% ME 2004: Shear/Moment Diagrams
% In this script, we will apply the (Composite) Trapezoidal Rule to generate shear-moment diagrams,
% which you will use heavily in classes like Mechanics of Deformable Bodies and Mechanical Design.
clear; clc; close all; 

%% Shear Force, V(x)
V = @(x) 0.25*x.^2+5;
L = 12;                     % Beam length

figure
subplot(2,1,1)
fplot(V,[0 L],'linewidth',2)
grid on; hold on

xlabel('Beam Position (m)','fontsize',14,'Interpreter','latex')
ylabel('Shear Force (N)','fontsize',14,'Interpreter','latex')
sgtitle('Shear/Moment Diagram','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Compute Bending Moment, M(x)
% Parameters





% Compute moment using the integral() function


% Write for loop to iterate through each value of n


% xlabel('Beam Position (m)','fontsize',14,'Interpreter','latex')
% ylabel('Bending Moment (Nm)','fontsize',14,'Interpreter','latex')
% legend([repmat('n =',length(n),1) num2str(n')],'fontsize',12,'Interpreter','latex','location','northwest')
% set(gca,'TickLabelInterpreter','latex')


% Print results to Command Window
% T = table(n',M',err','VariableNames',{'Number of Segments','Moment Estimate (Nm)','Percent Error'})


% Plot percent error 
% figure
% plot(n,err,'kp-','linewidth',2)
% grid on; hold on
% 
% xlim([0 L])
% xlabel('Number of Trapezoids (ND)','fontsize',14,'Interpreter','latex')
% ylabel('Percent Error (\%)','fontsize',14,'Interpreter','latex')
% title('Accuracy of the Composite Trapezoidal Rule','fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
