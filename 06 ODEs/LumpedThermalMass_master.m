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

g = @(t) 0;             % Heat source [W/m^3]
hData = [0 10 25 75];   % Vector of heat transfer coefficients [W/m^2 K]
options = [];           % No extra ode45() accuracy needed
Th = zeros(length(hData),length(t));   % Preallocate matrix to store temps for all "h" cases


% Write for loop to iterate through each case of h
for i = 1:length(hData)
    Th(i,:) = LTM(T0,V,As,rho,c,Tinf,hData(i),g,t,options);
end

figure
plot(t,Th,'linewidth',2)
grid on; hold on

xlabel('Time (s)','fontsize',14,'Interpreter','latex')
ylabel('Temperature ($^{\circ}$C)','fontsize',14,'Interpreter','latex')
title('Effect of Heat Transfer Coefficient, $h$','fontsize',14,'Interpreter','latex')
legend([repmat('$h= $ ',[length(hData) 1]) num2str(hData')...
    repmat(' $\frac{W}{m^2 \cdot ^{\circ}C}$',[length(hData) 1])],'fontsize',14,'Interpreter','latex','location','east')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% e) Effect of constant heat source, g(t)=const
% Parameters 
h = 25;                 % Heat transfer coefficient [W/m^2 K]
gData = [0:3]*1e5;      % Vector of heat source strengths [W/m^3]
Tg = zeros(length(gData),length(t));   % Preallocate matrix to store temps for all "gData" cases


% Write for loop to iterate through each case of g(t)
for i = 1:length(gData)
    g = @(t) gData(i);  % Heat source [W/m^3]
    Tg(i,:) = LTM(T0,V,As,rho,c,Tinf,h,g,t,options);
end

figure
plot(t,Tg,'linewidth',2)
grid on; hold on

xlabel('Time (s)','fontsize',14,'Interpreter','latex')
ylabel('Temperature ($^{\circ}$C)','fontsize',14,'Interpreter','latex')
title('Effect of Constant Heat Source, $g(t)$','fontsize',14,'Interpreter','latex')
legend([repmat('$g(t)= $ ',[length(gData) 1]) num2str(gData'/1e5)...
    repmat('e5 $\frac{W}{m^3}$',[length(gData) 1])],'fontsize',14,'Interpreter','latex','location','northeast')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% f) Effect of pulsed heat source
% Parameters 
T0 = Tinf;              % New initial temperature [C]
gc = 4e7;               % Heat source strength [J/m^3]
dtData = [4 2 1]*1e2;   % Vector of pulse times [s]

tmax2 = 1500;           % New end time [s]
t = 0:dt:tmax2;         % New time vector [s]

Td = zeros(length(dtData),length(t));   % Preallocate matrix to store temps for all "dt" cases
options = odeset('RelTol',10^-9,'AbsTol',10^-9);    % Extra ode45() accuracy needed

figure
sgtitle('Effect of Pulsed Heat Source, $g(t)=f(\Delta t)$','fontsize',14,'Interpreter','latex')

% Write for loop to iterate through each case of g(t)
for i = 1:length(dtData)
    g = @(t) (gc/dtData(i))*(heaviside(t) - heaviside(t-dtData(i)));  % Heat source [W/m^3]
    Td(i,:) = LTM(T0,V,As,rho,c,Tinf,h,g,t,options);

    % Plot g(t)
    subplot(2,1,1)
    fplot(g,[0 tmax2],'linewidth',2)
    grid on; hold on
end

ylabel('Heat Source $\left( \frac{W}{m^3} \right)$','fontsize',14,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')

% Plot temperature response
subplot(2,1,2)
plot(t,Td,'linewidth',2)
grid on; hold on
xlabel('Time (s)','fontsize',14,'Interpreter','latex')
ylabel('Temperature ($^{\circ}$C)','fontsize',14,'Interpreter','latex')

legend([repmat('$\Delta t= $ ',[length(dtData) 1]) num2str(dtData')...
    repmat('s',[length(dtData) 1])],'fontsize',14,'Interpreter','latex','location','northeast')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


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


dTdt = @(t,T) (-h*As*(T-Tinf) + V*g(t))/(rho*c*V);
[~,T] = ode45(dTdt,t,T0,options);
end
