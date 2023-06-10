%% ME 2004: Shear/Moment Diagrams
% In this script, we will apply the (Composite) Trapezoidal Rule to generate shear-moment diagrams,
% which you will use heavily in classes like Mechanics of Deformable Bodies and Mechanical Design.
clear; clc; close all; 

%% Shear Force, V(x)
V = @(x) 0.25*x.^2+5;
L = 12;                     % Beam length

figure
subplot(2,1,1)
fplot(V,[0 L],'linewidth',2)
grid on; hold on

xlabel('Beam Position (m)','fontsize',14,'Interpreter','latex')
ylabel('Shear Force (N)','fontsize',14,'Interpreter','latex')
sgtitle('Shear/Moment Diagram','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Compute Bending Moment, M(x)
% Parameters
M0 = 0;                     % Moment at start of beam
n = [1 2 4 12];             % Vector of segments 
M = 0*n;                    % Vector storing the moment at end of beam using the trapz() function
err = 0*n;                  % Vector storing the percent errors

% Compute moment using the integral() function
M_integral = integral(V,0,L)

% Write for loop to iterate through each value of n
for i=1:length(n)
    h = L/n(i);             % Compute step size
    x = 0:h:L;              % Generate x vector
    M(i) = trapz(x,V(x));   % Call trapz()

    % Compute percent error relative to integral()
    err(i) = 100*abs((M_integral-M(i))/M_integral);

    % Generate and plot Shear-Moment Diagram
    Mx = M0 + cumtrapz(x,V(x));

    subplot(2,1,2)
    plot(x,Mx,'h-','linewidth',2)
    grid on; hold on
end

xlabel('Beam Position (m)','fontsize',14,'Interpreter','latex')
ylabel('Bending Moment (Nm)','fontsize',14,'Interpreter','latex')
legend([repmat('n =',length(n),1) num2str(n')],'fontsize',12,'Interpreter','latex','location','northwest')
set(gca,'TickLabelInterpreter','latex')


% Print results to Command Window
T = table(n',M',err','VariableNames',{'Number of Segments','Moment Estimate (Nm)','Percent Error'})


% Plot percent error 
figure
plot(n,err,'kp-','linewidth',2)
grid on; hold on

xlim([0 L])
xlabel('Number of Trapezoids (ND)','fontsize',14,'Interpreter','latex')
ylabel('Percent Error (\%)','fontsize',14,'Interpreter','latex')
title('Accuracy of the Composite Trapezoidal Rule','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
