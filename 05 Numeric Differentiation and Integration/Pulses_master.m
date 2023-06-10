%% ME 2004: Pulses
% In this script, we will investigate the behavior of a pulsed function.
clear; clc; close all; 

%% System Parameters
f1 = 10;
f2 = -5;

t1 = 1;
t2 = 2;
t3 = 3;

oldparam = sympref('HeavisideAtOrigin',1);          % Make H(t=0) = 1 instead of 0.5
% sympref('HeavisideAtOrigin',oldparam);            % Reset default heaviside behavior

%% Plot
f = @(t) f1.*(heaviside(t)-heaviside(t-t1)) + ...
    f2.*(heaviside(t-t1)-heaviside(t-t2));

I = @(t) (f1*t).*(heaviside(t)-heaviside(t-t1)) + ...
    (f1*t1 + f2*(t-t1)).*(heaviside(t-t1)-heaviside(t-t2)) + ...
    (f1*t1 + f2*(t2-t1)).*(heaviside(t-t2));

figure               
sgtitle('Pulsed Function','fontsize',14,'Interpreter','latex')

subplot(2,1,1)
fplot(f,[0 t3],'linewidth',2)
grid on
xlabel('t','fontsize',14,'Interpreter','latex')
ylabel('f(t)','fontsize',14,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')

subplot(2,1,2)
fplot(I,[0 t3],'linewidth',2)
grid on
ylim([0 10])
xlabel('t','fontsize',14,'Interpreter','latex')
ylabel('I(t)','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
