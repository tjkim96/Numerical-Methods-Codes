%% ME 2004: Lumped Thermal Mass
% In this script, we will analyze the transient response of a lumped thermal mass over time. We will 
% solve the first-order ODE numerically using ode45().
clear; clc; close all;

%% a) Cause-Effect
% Done by hand

%% b) Steady-State Temperature and Phase Portrait/Anticipated Solution
% Done by hand

%% c) Function
% See end of script

%% d) Effect of heat transfer coefficient, h
% Parameters
V = 10^(-6);            % Volume [m^3]
As = 10^(-4);           % Surface area [m^2]
rho = 1000;             % Density [kg/m^3]
c = 500;                % Specific heat [J/kg C]
Tinf = 25;              % Fluid temperature [C]
T0 = 400;               % Initial temperature [C]

dt = 1;                 % Simulation time step size [s]
tmax = 4000;            % Maximum simulation time [s]
t = 0:dt:tmax;          % ode45() time vector [s]







% Write for loop to iterate through each case of h


% figure
% plot(t,Th,'linewidth',2)
% grid on; hold on
% 
% xlabel('Time (s)','fontsize',14,'Interpreter','latex')
% ylabel('Temperature ($^{\circ}$C)','fontsize',14,'Interpreter','latex')
% title('Effect of Heat Transfer Coefficient, $h$','fontsize',14,'Interpreter','latex')
% legend([repmat('$h= $ ',[length(hData) 1]) num2str(hData')...
%     repmat(' $\frac{W}{m^2 \cdot ^{\circ}C}$',[length(hData) 1])],'fontsize',14,'Interpreter','latex','location','east')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% e) Effect of constant heat source, g(t)=const
% Parameters 





% Write for loop to iterate through each case of g(t)


% figure
% plot(t,Tg,'linewidth',2)
% grid on; hold on
% 
% xlabel('Time (s)','fontsize',14,'Interpreter','latex')
% ylabel('Temperature ($^{\circ}$C)','fontsize',14,'Interpreter','latex')
% title('Effect of Constant Heat Source, $g(t)$','fontsize',14,'Interpreter','latex')
% legend([repmat('$g(t)= $ ',[length(gData) 1]) num2str(gData'/1e5)...
%     repmat('e5 $\frac{W}{m^3}$',[length(gData) 1])],'fontsize',14,'Interpreter','latex','location','northeast')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% f) Effect of pulsed heat source
% Parameters 










% figure
% sgtitle('Effect of Pulsed Heat Source, $g(t)=f(\Delta t)$','fontsize',14,'Interpreter','latex')

% Write for loop to iterate through each case of g(t)


% ylabel('Heat Source $\left( \frac{W}{m^3} \right)$','fontsize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')

% Plot temperature response
% subplot(2,1,2)
% plot(t,Td,'linewidth',2)
% grid on; hold on
% xlabel('Time (s)','fontsize',14,'Interpreter','latex')
% ylabel('Temperature ($^{\circ}$C)','fontsize',14,'Interpreter','latex')
% 
% legend([repmat('$\Delta t= $ ',[length(dtData) 1]) num2str(dtData')...
%     repmat('s',[length(dtData) 1])],'fontsize',14,'Interpreter','latex','location','northeast')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% Function
function T = LTM(T0,V,As,rho,c,Tinf,h,g,t,options)
% LTM:  Calculates the transient response of lumped capacity thermal mass. 
% Syntax: T = LTM(T0,V,As,rho,c,Tinf,h,g,t,options)
%           
% Inputs: 
%   T0:     Initial temperature [C] (scalar)
%   V:      Volume [m^3] (scalar)
%   As:     Surface area [m^2] (scalar)
%   rho:    Density [kg/m^3] (scalar)
%   c:      Specific heat [J/kg C] (scalar)
%   Tinf:   Fluid temperature [C] (scalar)
%   h:      Heat transfer coefficient [W/m^2 K] (scalar)
%   g:      Heat source [W/m^3] (anonymous function)
%   t:      ode45() time vector [s] (vector))
%   options:ode45() accuracy options [ND] (struct)
% 
% Output:   
%   T:      Temperature solution vector [C] (vector)




end
