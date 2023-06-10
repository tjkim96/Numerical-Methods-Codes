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
























%% d) Parameter Study on Applied External Force







% figure
% plot(P_1y_vec,truss_forces,'linewidth',2)
% grid on
% 
% xlabel('Applied External Force at Node 1 (N)','fontsize',14,'Interpreter','latex')
% ylabel('Truss Forces (N)','fontsize',14,'Interpreter','latex')
% legend('$F_1$','$F_2$','$F_3$','$H_2$','$V_2$','$V_3$',...
%     'fontsize',14,'Location','northwest','Interpreter','latex')
% title('Study of Internal and Reaction Forces in a Truss','fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% e) Change in Internal/Reaction Forces




















