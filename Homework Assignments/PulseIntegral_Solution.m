%% ME 2004: Pulse Integral (Solution) 
clear; clc; close all; 

%% Plot Pulse Integral
% Parameters
t1 = 2;             % Time at which pulse function turns on
n = -1:3;           % Exponent values
dt = 10.^(-n);      % Vector of dt values

figure
for i=1:length(dt)
    F = @(t) ((t-t1)/dt(i)).*(heaviside(t-t1)-heaviside(t-(t1+dt(i)))) + heaviside(t-(t1+dt(i)));
    fplot(F,[0 20],'linewidth',2)
    grid on; hold on
end

xlabel('t (s)','fontsize',14,'Interpreter','latex');
ylabel('$F_{1}$(t) (ND)','fontsize',14,'Interpreter','latex')
title('Pulse Integral','fontsize',14,'Interpreter','latex')
legend([repmat('$\Delta t$ =',length(dt),1) num2str(dt')],'fontsize',12,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')

% The figure makes it apparent that as dt --> 0, F(t) = H(t-t1).
% This matches our analytical analysis.
