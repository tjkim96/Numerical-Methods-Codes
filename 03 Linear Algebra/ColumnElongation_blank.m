%% ME 2004: Column Elongation
% DESCRIPTION: In this example, we will solve a linear system of equations involving three beams.
% Make sure you have the ME2004_BarParameters.mat file in your Working Directory!
clear; clc; close all;

%% a) Arrange equations in matrix form

%% b) Function
% See end of script

%% c) Testing Function















%% d) Plot Results
% figure
% 
% subplot(2,1,1)
% plot(d,F,'.-')
% grid on
% ylabel('Force (N)','FontSize',12,'Interpreter','latex')
% legend('$F_{AB}$','$F_{CD}$','$F_{GF}$','FontSize',12,'Interpreter','latex')
% title('Column Forces','FontSize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')
% 
% subplot(2,1,2)
% plot(d,delta,'.-')
% grid on; hold on
% xlabel('Distance of Applied Force from Leftmost End of Bar (m)','FontSize',12,'Interpreter','latex')
% ylabel('Deflection (m)','FontSize',12,'Interpreter','latex')
% title('Column Deflections','FontSize',14,'Interpreter','latex')
% set(gca,'TickLabelInterpreter','latex')


% set(gcf,'Position',[988 196 881 714])       % Will probably need to change this on your computer

%% e) Safety Standard

% yline(deltaMax,'k--','linewidth',2);    % Append horizontal line at deltaMax to the plot
% legend('$\delta_{AB}$','$\delta_{CD}$','$\delta_{GF}$','$\delta_{max}$',...
%     'FontSize',12,'Interpreter','latex','location','southeast')

% It's clear that the standard isn't always met. So over what d is the standard met?



% fprintf('The safety standard is only met when %d <= d <= %d m\n',min(d_allow),max(d_allow))
% This can be confirmed by inspecting the plot 

%% e) Comments
% F_AB starts positive and becomes negative as d increases. F_CD and F_GF are the opposite. This
% means that the direction of the force opposes the direction it was assumed to point. 
% A similar trend occurs in the deflection since deflection is proportional to the force. 
% Note how F and delta both reverse directions as soon as they cross the x-axis. 
% 
% The safety standard is met only when 7 <= d <= 42 m. To remedy this, we could:
%   - Decrease the applied force, F
%   - Use a material with a higher stiffness, E
%   - Increase each column's cross-sectional area, A
% 
% Neither of the 3 may be feasible due to budget constraints, material constraints, etc., but these 
% are viable options according to our mathematical model.

%% Function

% forceDeflection: Computes the forces and deflections on a simply supported bridge. 
% 
% Inputs:
% P: Force applied to bar [N] (scalar)
% d: Distance force is applied [m] (scalar)
% L: Column lengths [m] (vector). L(1) = L_AB, L(2) = L_CD, L(3) = L_GF.
% E: Modulus of Elasticity [Pa] (scalar)
% A: Cross-sectional area [m^2] (scalar)
% 
% Outputs:
% F: Vector of column forces [N] (vector). F(1) = F_AB, F(2) = F_CD, F(3) = F_GF.
% delta: Vector of deflections [m] (vector). delta(1) = delta_AB, delta(2) = delta_CD, delta(3) = delta_GF.












