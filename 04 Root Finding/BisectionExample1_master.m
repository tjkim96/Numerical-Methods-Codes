%% ME 2004: Bisection Example 1
% DESCRIPTION: In this example, we will use the grapical and bisection method to solve a simple root
% finding problem. In this problem, the bisection method is carried out mainly by hand. 
clear; clc; close all;

%% Generate Plot
f = @(x) log(x.^2) - 0.7;
x_true = 1.41907;

iter = 1;
xl = 0.5;
xu = 2;
xr = (xl+xu)/2;
xr_old = NaN;

vals = f([xl xu xr]);
ea = 100*abs((xr-xr_old)/xr);
et = abs(x_true-xr);
T = array2table(round([xr vals ea et],4),'VariableNames',{'xr','f(xl)','f(xu)','f(xr)','ea','et'})

figure
fplot(f,[xl xu],'linewidth',2)
grid on; hold on
yline(0,'r--','linewidth',2)
plot([xl xu xr],vals,'ko','linewidth',3)

xlabel('x (ND)','fontsize',14,'Interpreter','latex')
ylabel('f(x) (ND)','fontsize',14,'Interpreter','latex')
title(['Bisection Example Plot: Iteration ',num2str(iter)],'fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
