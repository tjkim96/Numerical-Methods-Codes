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
% To linearize an equation in the form y=p*exp(q), take natural log of both sides
%   --> log(y) = q*x + log(q)
%   --> xt = x; yt = log(y); a1 = q, a0 = log(p)            (log() = ln() in MATLAB syntax)


% Compute and plot linearized data
xt = t;
yt = log(VR);

subplot(2,1,2)
plot(xt,yt,'d','linewidth',2)
grid on; hold on
title('RC Circuit (Linearized Data)','fontsize',14,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')

% Construct and plot curve fit 
[fo,gof] = fit(xt,yt,'poly1');
plot(fo)
xlabel('$t_{transformed}$ (s)','fontsize',16,'Interpreter','latex')
ylabel('$V_{R,transformed}$ (V)','fontsize',16,'Interpreter','latex')
legend('Linearized Data','Curve Fit','fontsize',14,'Interpreter','latex')

% Extract coefficients
coefs = coeffvalues(fo);            % Extract curve fit coefficients
a1 = coefs(1);
a0 = coefs(2);

q = a1;                             % Get "q" parameter
p = exp(a0);                        % Get "p" parameter

V = p                               % Get battery voltage [V]
C = -1/(R*a1)                       % Get capacitance [F]
R2 = gof.rsquare                    % Display the R^2 value. It's very close to 1, which is "good"


% Now that we have the curve fit coefficients, let's see if we can decently fit the original data
myVR = @(t) V*exp(-t/(R*C));        % You can also do myVR = @(t) p*exp(q*t)

subplot(2,1,1)
fplot(myVR,[min(t) max(t)])
legend('Raw Data','Curve Fit','fontsize',14,'Interpreter','latex')

% Our computed a0/a1 seem to fit the data extremely well, so we have confidence in our answers. 

%% c) Predictions
t_predict = [2.5 27];
VR_predict = myVR(t_predict)

% Append to nonlinear plot
plot(t_predict,VR_predict,'mv','linewidth',1.5,'DisplayName','Predicted Points')

% Append to linear plot
subplot(2,1,2)
plot(t_predict,log(VR_predict),'mv','linewidth',1.5,'DisplayName','Predicted Points')

% Our predictions line up perfectly with both the linearized and non-linearized curve fits. 
