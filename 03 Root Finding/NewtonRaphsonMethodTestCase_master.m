%% ME 2004: Newton-Raphson Method Test Case
% DESCRIPTION: In this example, we will use the grapical and Newton-Raphson Method to solve a 
% simple root finding problem. In this problem, the Newton-Raphson Method is executed by 2 custom 
% MATLAB functions.
clear; clc; close all;

%% Test Function
% Parameters
f = @(x) sin(x.^2)-x.*cos(x)-2;
df = @(x) 2*x.*cos(x.^2)+x.*sin(x)-cos(x);
x0 = 1;
es = 1e-3;
maxit = [];

% Plot
figure
subplot(2,1,1)
fplot(f,[0 10],'linewidth',2)
grid on; hold on
yline(0,'r--','linewidth',2)

xlabel('x (ND)','fontsize',14,'Interpreter','latex')
ylabel('f(x) (ND)','fontsize',14,'Interpreter','latex')
title('Newton-Raphson Method Example Plot','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Call the Custom Newton-Raphson Functions
[root1,fx1,ea1,iter1] = NewtonRaphson_xtol(f,df,x0,es,maxit);
fprintf('Using the NewtonRaphson_xtol function:\n')
fprintf('----------------------------------\n')
fprintf('The value of the root is:                              xr=%9.9f\n',root1)
fprintf('The value of the function evaluated at the root is: f(xr)=%9.9f\n',fx1)
fprintf('The percent relative error is:                         ea=%9.9f\n',ea1)
fprintf('The number of iterations it took is:                      %d\n\n',iter1)


[root2,fx2,iter2] = NewtonRaphson_ftol(f,df,x0,es,maxit);
fprintf('Using the NewtonRaphson_ftol function:\n')
fprintf('----------------------------------\n')
fprintf('The value of the root is:                              xr=%9.9f\n',root2)
fprintf('The value of the function evaluated at the root is: f(xr)=%9.9f\n',fx2)
fprintf('The number of iterations it took is:                      %d\n\n',iter2)


% Plot results
subplot(2,1,2)
fplot(f,[0.999*min([root1 root2]) 1.001*max([root1 root2])],'linewidth',2,'HandleVisibility','off')
grid on; hold on
yline(0,'r--','linewidth',2,'HandleVisibility','off')

plot(root1,fx1,'kd','linewidth',2)  % Plot bisection_xtol results
plot(root2,fx2,'ks','linewidth',2)  % Plot bisection_ftol results

xlabel('x (ND)','fontsize',14,'Interpreter','latex')
ylabel('f(x) (ND)','fontsize',14,'Interpreter','latex')
title('Zooming In On The Roots','fontsize',14,'Interpreter','latex')
legend('$NR\_xtol$','$NR\_ftol$','fontsize',14,'Interpreter','latex','location','northwest')

set(gca,'TickLabelInterpreter','latex')
