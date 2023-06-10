%% ME 2004: Newton-Raphson Example 1
% DESCRIPTION: In this example, we will use the grapical and Newton-Raphson method to solve a 
% simple root finding problem. In this problem, the NR method is carried out mainly by hand. 
clear; clc; close all;

%% Generate Plot
f = @(x) x.^3-6*x.^2+11*x-6.1;      % Function
df = @(x) 3*x.^2-12*x+11;           % Derivative of function

iter = 3;
xr_old = 3.0687;                       % Initial guess
xr = xr_old - f(xr_old)/df(xr_old)  % Updated guess
ea = 100*abs((xr-xr_old)/xr);       % Percent relative error 

T = array2table(round([xr ea],4),'VariableNames',{'xr','ea'})

figure
fplot(f,[0 5],'linewidth',2)
grid on; hold on
yline(0,'r--','linewidth',2)
plot(xr_old,f(xr_old),'ko','linewidth',3)
fplot(@(x) df(xr_old)*(x-xr_old)+f(xr_old),'g','linewidth',2)
plot(xr,0,'kh','linewidth',3)

xlim(xr*[0.9 1.1])
xlabel('x (ND)','fontsize',14,'Interpreter','latex')
ylabel('f(x) (ND)','fontsize',14,'Interpreter','latex')
title(['Newton-Raphson Example Plot: Iteration ',num2str(iter)],'fontsize',14,'Interpreter','latex')
legend('$f(x)$','','$x_{r,old}$','Tangent Line','$x_r$',...
    'fontsize',14,'Location','northwest','Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
