%% ME 2004: Polynomial Regression
% DESCRIPTION: In this example, we will curve fit some nonlinear data to a polynomial.
% We will use the "direct method", i.e., changing the fitType argument of the fit() function.
clear; clc; close all;

%% Load/Plot Data
load('ME2004_PolynomialData.mat')

figure
plot(x,y,'bs','linewidth',2)
grid on; hold on

%% Obtain Regression Coefficients and R^2
[fo,gof] = fit(x',y','sin1');      

plot(fo)
xlabel('x (ND)','fontsize',14,'Interpreter','latex')
ylabel('y (ND)','fontsize',14,'Interpreter','latex')
title('Polynomial Regression Example','fontsize',14,'Interpreter','latex')
legend('Raw Data','Fitted Polynomial','location','northwest','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

% Extract coefficients
coefs = coeffvalues(fo)             % Extract curve fit coefficients
R2 = gof.rsquare                    % Display the R^2 value. It's very close to 1, which is "good"
