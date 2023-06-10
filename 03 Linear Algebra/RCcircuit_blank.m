%% ME 2004: RC Circuit
% DESCRIPTION: In this example, we will curve fit some data pertaining to a RC circuit. The data
% needs to be transformed (linearized) because it is inherently nonlinear. 
clear; clc; close all;

%% a) Load and Plot Data
load('ME2004_RCData.mat')

figure
subplot(2,1,1)
plot(t,VR,'bs','linewidth',2)
grid on; hold on

xlabel('Time (s)','fontsize',14,'Interpreter','latex')
ylabel('Resistor Voltage, $V_R$ (V)','fontsize',14,'Interpreter','latex')
title('RC Circuit (Raw Data)','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% b) Obtain Regression Coefficients and R^2
% Compute and plot linearized data



% subplot(2,1,2)
% plot(xt,yt,'d','linewidth',2)
% grid on; hold on
% title('RC Circuit (Linearized Data)','fontsize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')

% Construct and plot curve fit 

% plot(fo)
% xlabel('$t_{transformed}$ (s)','fontsize',16,'Interpreter','latex')
% ylabel('$V_{R,transformed}$ (V)','fontsize',16,'Interpreter','latex')
% legend('Linearized Data','Curve Fit','fontsize',14,'Interpreter','latex')

% Extract coefficients












% Now that we have the curve fit coefficients, let's see if we can decently fit the original data


% subplot(2,1,1)
% fplot(myVR,[min(t) max(t)])
% legend('Raw Data','Curve Fit','fontsize',14,'Interpreter','latex')

% Our computed a0/a1 seem to fit the data extremely well, so we have confidence in our answers. 

%% c) Predictions



% Append to nonlinear plot
% plot(t_predict,VR_predict,'mv','linewidth',1.5,'DisplayName','Predicted Points')

% Append to linear plot
% subplot(2,1,2)
% plot(t_predict,log(VR_predict),'mv','linewidth',1.5,'DisplayName','Predicted Points')

% Our predictions line up perfectly with both the linearized and non-linearized curve fits. 
