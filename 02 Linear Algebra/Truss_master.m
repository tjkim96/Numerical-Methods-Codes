%% ME 2004: Truss
% DESCRIPTION: In this example, we will solve a linear system of equations involving a simple truss
% in static equilibrium. We will derive the equations governing the truss from scratch, then solve
% the system and do some post-analysis using the matrix inverse.
clear; clc; close all;

%% a) Cause-Effect Diagram
% Forcing Functions:        Externally applied forces (such as the -2000N force at Node 1) 
% System Parameters:        Truss's geometry (angles) and assumed directions of the forces
% Responses:                Internal forces (F1,F2,F3) and reaction forces (H2,V2,V3)

%% c) Solve via Matrix Inverse
% Angles
th1 = 30;       
th2 = 60;       

% Externally applied forces
P_1x = 0;
P_1y = -2000;
P_2x = 0;
P_2y = 0;
P_3x = 0;
P_3y = 0;

% Create A, x, and b
A = [sind(th2)      0       -sind(th1)  0   0   0;
    cosd(th2)       0       cosd(th1)   0   0   0;
    -cosd(th1)      -1      0           -1  0   0;
    -sind(th1)      0       0           0   -1  0;
    0               1       cosd(th2)   0   0   0;
    0               0       -sind(th2)  0   0   -1];
b = [P_1x P_1y P_2x P_2y P_3x P_3y]';

AInv = inv(A)
F = AInv*b

%% d) Parameter Study on Applied External Force
P_1y_vec = 0:-P_1y;                                   % Upwards forces applied to Node 2

applied_forces = zeros(length(b),length(P_1y_vec));   % Preallocate matrix storing collection of b vectors
applied_forces(2,:) = P_1y_vec;                       % Replace entire 2nd row w/ the V1 vector

truss_forces = AInv*applied_forces;

figure
plot(P_1y_vec,truss_forces,'linewidth',2)
grid on

xlabel('Applied External Force at Node 1 (N)','fontsize',14,'Interpreter','latex')
ylabel('Truss Forces (N)','fontsize',14,'Interpreter','latex')
legend('$F_1$','$F_2$','$F_3$','$H_2$','$V_2$','$V_3$',...
    'fontsize',14,'Location','northwest','Interpreter','latex')
title('Study of Internal and Reaction Forces in a Truss','fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% e) Change in Internal/Reaction Forces
% Changes in the forces
dP_1x = 0;
dP_1y = P_1y;                                   % Vertical force at Node 1 is doubled, so it changes by the original amount
dP_2x = 0;
dP_2y = 0;
dP_3x = -1000;                                  % Horizontally applied force at Node 3
dP_3y = 0;

dP = [dP_1x dP_1y dP_2x dP_2y dP_3x dP_3y]';    % Vector of the change in forces applied to the truss
dF = AInv*dP                                    % Solve for the change in the internal/reaction Forces


% Check that the total force = original force + change in force
F_new = F + dF;                                 % Total force = original + change

b_tot = [P_1x 2*P_1y P_2x P_2y dP_3x P_3y]';    % Generate b vector as if all the loads were applied at once
F_tot = AInv*b_tot;                             % Solve the system Ax=b

err = F_new - F_tot;                            % Generate error vector
err_norm = norm(err,inf)                        % Compute worst-case norm of error vector
