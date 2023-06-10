%% ME 2004: Nonlinear Regression
% DESCRIPTION: In this example, we will curve fit some nonlinear data. We need to linearize the data
% before applying least-squares regression.
clear; clc; close all;

%% a) Linearization
% We can begin linearizing the equation by square-rooting both sides:
% sqrt(y) = (a + sqrt(x))/(b*sqrt(x))
% --> sqrt(y) = a/(b*sqrt(x)) + sqrt(x)/(b*sqrt(x))
% --> sqrt(y) = (a/b)*(1/sqrt(x)) + (1/b)
% 
% Therefore, a plot of sqrt(y) vs. (1/sqrt(x)) will yield a straight line.
% The slope of the straight line is (a/b) and the y-intercept is (1/b). 

%% b) Determine a and b
% Load and plot original data (do so even though it's not explicitly required in the problem!!!!!)
load('ME2004_NonlinearRegressionData.mat')

figure
subplot(2,1,1)
plot(x,y,'o','linewidth',1.5)
grid on; hold on

xlabel('x')
ylabel('y')
title('Original Data')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


% Compute and plot linearized data



% subplot(2,1,2)
% plot(xt,yt,'d','linewidth',1.5)
% grid on; hold on
% title('Linearized Data')

% Construct and plot curve fit 

% plot(fo)
% xlabel('x_{transformed}')
% ylabel('y_{transformed}')
% legend('Linearized Data','Curve Fit','location','southeast')

% Extract coefficients








% Now that we have a and b, let's see if we can decently fit the original data


% subplot(2,1,1)
% fplot(myFit,[min(x) max(x)])
% legend('Raw Data','Curve Fit')

% Our computed a and b seem to fit the data extremely well, so we have confidence in our answers. 

%% c) Predictions



% Append to plots
% plot(x_predict,y_predict,'mv','linewidth',1.5,'DisplayName','Predicted Points')
% 
% subplot(2,1,2)
% plot(1./sqrt(x_predict),sqrt(y_predict),'mv','linewidth',1.5,'DisplayName','Predicted Points')

% Our predictions line up perfectly with both the linearized and non-linearized curve fits. 
