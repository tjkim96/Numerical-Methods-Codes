%% ME 2004: Mechanical Work
% In this script, we will apply the (Composite) Trapezoidal Rule to integrate some data related to
% mechanical work.
clear; clc; close all; 

%% Load/Plot Data
load('ME2004_WorkData.mat')
integrand = F.*cos(theta);

figure
subplot(3,1,1)
plot(x,F,'bd','linewidth',2)
grid on; hold on
ylabel('F (N)','fontsize',14,'Interpreter','latex')

subplot(3,1,2)
plot(x,theta,'bd','linewidth',2)
grid on; hold on
ylabel('$\theta$ (rad)','fontsize',14,'Interpreter','latex')

subplot(3,1,3)
plot(x,integrand,'bd','linewidth',2)
grid on; hold on

xlabel('Position (m)','fontsize',14,'Interpreter','latex')
ylabel('$F\cos(\theta)$ (N)','fontsize',14,'Interpreter','latex')
sgtitle('Mechanical Work Data','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Integrate
x = sort([x 2.5 12.5]);
integrand = [integrand(1) 3.9007 integrand(2:3) 11.394 integrand(4:end)];
n = [1 2 4 8];
% n = [1 2 3 6];

W_true = 129.52;            % True Work value
W = 0*n;                    % Vector storing the Work estimates
err = 0*n;                  % Vector storing the percent errors

figure
set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

for k=1:length(n)
    % Parse x and integrands vectors
    h = (length(x)-1)/n(k);
    xData = x(1:h:end);
    yData = integrand(1:h:end);

    % Plot data
    nexttile            % Creates new subplot in current figure 
    plot(x,integrand,'bd','linewidth',2)
    grid on; hold on
    xlabel('Position (m)','fontsize',14,'Interpreter','latex')
    ylabel('$F\cos(\theta)$ (N)','fontsize',14,'Interpreter','latex')
    title(['n=' num2str(n(k)) ' Segments'],'fontsize',14,'Interpreter','latex')
    set(gca,'TickLabelInterpreter','latex')

    % Plot graphical depiction of trapezoids
    patch([xData xData(end) xData(1)],[yData xData(1) xData(1)],'cyan','FaceAlpha',0.3)
    stem(xData,yData,'kd:')       % Used to delineate each trapezoid

    % Compute area
    W(k) = trapz(xData,yData);
    
    % Compute percent error
    err(k) = 100*abs((W_true-W(k))/W_true);
end

% Print results to Command Window
T = table(n',W',err','VariableNames',{'Number of Segments','Work Estimate (J)','Percent Error'})
