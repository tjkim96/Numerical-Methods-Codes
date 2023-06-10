%% ME 2004: Numerical Differentiation, Step Size Exploration
% In this script, we will numerically differentiate a simple function via 3 schemes (forward,
% backward, and central difference) to understand each scheme's numerical and graphical 
% interpretations. 
clear; clc; close all; 

%% a) Analytical Derivative
y = @(x) sin(x);
dydx = @(x) cos(x);

figure
sgtitle('Numerically Differentiating y=sin(x)','fontsize',14,'Interpreter','latex')
subplot(2,2,1)
fplot(y,[0 pi],'k')
grid on; hold on
fplot(dydx,[0 pi])

xlabel('x','fontsize',14,'Interpreter','latex')
ylabel('y','fontsize',14,'Interpreter','latex')
title('(a,b) Analytical+Numerical Differentiation of a Function','Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[923 82 984 851])   % Will probably need to change this on your computer

%% b) Numeric Derivatives
x = 2;
dx = 0.75;
dydx_analytical = dydx(x);      % Scalar storing the analytical derivative at the x-point

% Compute/plot forward difference
FD = (y(x+dx)-y(x))/dx;
fprintf('Forward difference at x=%2.2f with a step size of dx=%2.2f = %4.4f \n',x,dx,FD)
plot([x x+dx],[y(x) y(x+dx)],'bp-','linewidth',2,'markersize',7)

% Compute/plot backward difference
BD = (y(x)-y(x-dx))/dx;
fprintf('Backward difference at x=%2.2f with a step size of dx=%2.2f = %4.4f \n',x,dx,BD)
plot([x-dx x],[y(x-dx) y(x)],'mp-','linewidth',2,'markersize',7)

% Compute/plot central difference
CD = (y(x+dx)-y(x-dx))/(2*dx);
fprintf('Central difference at x=%2.2f with a step size of dx=%2.2f = %4.4f \n',x,dx,CD)
plot([x-dx x+dx],[y(x-dx) y(x+dx)],'cp-','linewidth',2,'markersize',7)

legend('y(x)','$\frac{dy}{dx}$','Forward Difference @ x=2','Backwards Difference @ x=2',...
    'Central Difference @ x=2',...
    'interpreter','latex','location','southwest','FontSize',10)

%% c) Variable Step Size
dx_vec = 0.1:0.1:1;             % Vector of step sizes
dydx_vec = 0*dx_vec;            % Vector storing the dy/dx estimates
colors = turbo(length(dx_vec)); % Set color scheme for plot
scheme = 'Backward';            % Desired differentiation scheme 

% Pre-set the subplot
subplot(2,2,2)
fplot(y,[0.5 pi],'k')
grid on; hold on

xlabel('x','fontsize',14,'Interpreter','latex')
ylabel('y','fontsize',14,'Interpreter','latex')
title(['(c) ' scheme ' Difference at x=2, Variable Step Size'],'Interpreter','latex')
legend('y','location','southwest','Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')


% Write a for loop to iterate through each step size. The for loop will have a switch statement to
% determine which type of derivative (Forward, Central, or Backward) to compute/plot.
for i=1:length(dx_vec)
    switch scheme
        case 'Forward'
            % Plot forward difference
            plot([x x+dx_vec(i)],[y(x) y(x+dx_vec(i))],...
                's-','linewidth',2,'markersize',7,'color',colors(i,:),...
                'DisplayName',['$\Delta{x}=$' num2str(dx_vec(i))])

            % Compute forward difference
            dydx_vec(i) = (y(x+dx_vec(i))-y(x))/(dx_vec(i));

        case 'Central'
            % Plot central difference
            plot([x-dx_vec(i) x+dx_vec(i)],[y(x-dx_vec(i)) y(x+dx_vec(i))],...
                's-','linewidth',2,'markersize',7,'color',colors(i,:),...
                'DisplayName',['$\Delta{x}=$' num2str(dx_vec(i))])
            
            % Compute central difference
            dydx_vec(i) = (y(x+dx_vec(i))-y(x-dx_vec(i)))/(2*dx_vec(i));

        case 'Backward'
            % Plot backward difference
            plot([x x-dx_vec(i)],[y(x) y(x-dx_vec(i))],...
                's-','linewidth',2,'markersize',7,'color',colors(i,:),...
                'DisplayName',['$\Delta{x}=$' num2str(dx_vec(i))])

            % Compute backward difference
            dydx_vec(i) = (y(x)-y(x-dx_vec(i)))/(dx_vec(i));
    end
end


% Compute and plot percent error of chosen method
pcError = 100*abs((dydx_vec-dydx_analytical)/dydx_analytical);

subplot(2,2,[3 4])
plot(dx_vec,pcError,'bh:','linewidth',2)
grid on

xlabel('Step Size $\Delta{x}$','fontsize',14,'Interpreter','latex')
ylabel('Percent Error','fontsize',14,'Interpreter','latex')
title(['(c) ' scheme ' Difference at x=2, Variable Step Size Error'],'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
