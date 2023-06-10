%% ME 2004: Animal Metabolism
% DESCRIPTION: In this example, we will curve fit some data pertaining to the metabolisms of various
% animals. The twist: we don't immediately know what type of curve fit to apply. 
clear; clc; close all;

%% Load/Sort Data


% Sort data (in ascending order)



%% Plot to Determine Type of Fit
% Experiment with different types of plots!

% Plot original data
% figure
% plot(m_sorted,w_sorted,'bs','linewidth',2)
% grid on; hold on
% 
% xlabel('Mass (kg)','fontsize',14,'Interpreter','latex')
% ylabel('Metabolism (W)','fontsize',14,'Interpreter','latex')
% title('Metabolisms of Various Animals (Raw Data)','fontsize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


%% Obtain Regression Coefficients and R^2
% It appears the data conform to a power law. To fit the data, we have 2 options:
%   1) Directly use the 'fit' function with the appropriate model name ("direct method")
%   2) Linearize the data and apply linear regression to the transformed data ("linearization")
% We've extensively covered (2), but let's do both methods just to compare!

%% Direct Method
% Construct and plot curve fit


% plot(fo1)
% xlabel('Mass (kg)','fontsize',14,'Interpreter','latex')
% ylabel('Metabolism (W)','fontsize',14,'Interpreter','latex')
% title('Metabolisms of Various Animals (Raw Data)','fontsize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')

% Extract coefficients






%Prediction



% Append to plot
% plot(m_predict,w_predict_1,'mv','LineWidth',1.5)
% legend('Raw Data','Curve Fit (Direct)','Predicted Point (Direct)','location','northwest','fontsize',14,'Interpreter','latex')

%% Linearization
% Construct and plot curve fit 




% figure(2)
% plot(fo2,xt,yt)

% Extract coefficients






% figure(1)
% fplot(M2,[min(m_sorted) max(m_sorted)])


% Prediction


% Append to plot
% plot(m_predict,w_predict_2,'m^','linewidth',1.5,'DisplayName','Predicted Point (Linearized)')
% legend('Raw Data','Curve Fit (Direct)','Predicted Point (Direct)',...
%     'Curve Fit (Linearized)','Predicted Point (Linearized)',...
%     'location','southeast','Interpreter','latex')

%% Direct vs. Linearized Comparison




% T = table(pcErr,'VariableNames',{'Percent Error Relative to Direct Fit'},...
%     'RowNames',{'p','q','w_predict'})

% q and w_predict are fairly similar across both methods, but there's a somewhat generous deviation
% in the "p" parameter between the fits. 
