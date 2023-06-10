%% ME 2004: Critical Channel Depth
% DESCRIPTION: In this example, we will use the grapical and bisection method to solve a root
% finding problem related to the critical channel depth of a trapzeoidal duct.
clear; clc; close all;

%% Graphical Method
g = 9.81;                           % Acceleration due to gravity [m/s^2]
Q = 20;                             % Volumetric flowrate [m^3/s]
f = @(y) 1 - (Q^2*(3+y))./(g*(y.^2/2+3*y).^3);

xl = 0.5;
xu = 2.5;

figure
fplot(f,[xl xu],'linewidth',2)
grid on; hold on
yline(0,'r--','linewidth',2)

xlabel('y (m)','fontsize',14,'Interpreter','latex')
ylabel('f(y) (ND)','fontsize',14,'Interpreter','latex')
title('Critical Channel Depth (One Parameter Set)','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Bisection Method
es = 1;         % Desired percent relative error
maxit = 15;     % Max allowable number of iterations
[y,fy,ea,iter] = bisection_xtol(f,xl,xu,es,maxit)

%% Q Parameter Study
Q_vec = Q:2.5:2*Q;
y_vec = 0*Q_vec;

figure
grid on; hold on

xlabel('y (m)','fontsize',14,'Interpreter','latex')
ylabel('f(y) (ND)','fontsize',14,'Interpreter','latex')
title('Critical Channel Depth (Q Parameter Study)','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

for i=1:length(Q_vec)
    f = @(Q,y) 1 - (Q^2*(3+y))./(g*(y.^2/2+3*y).^3);
    fplot(@(y) f(Q_vec(i),y),[xl xu],'linewidth',2)

    y_vec(i) = bisection_xtol(@(y) f(Q_vec(i),y),xl,xu,es,maxit);
end
legend(num2str(Q_vec'),'fontsize',14,'Interpreter','latex','location','southeast')


% Plot y vs Q
figure
plot(Q_vec,y_vec,'bd','LineWidth',2)
grid on; hold on

xlabel('Q $\left( \frac{m^3}{s} \right)$','fontsize',14,'Interpreter','latex')
ylabel('y (m)','fontsize',14,'Interpreter','latex')
title('Critical Channel Depth Parameter Study','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
