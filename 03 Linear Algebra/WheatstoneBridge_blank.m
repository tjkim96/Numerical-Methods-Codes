%% ME 2004: Wheatstone Bridge
% DESCRIPTION: In this example, we will solve a linear system of equations involving a Wheatstone
% Bridge.
clear; clc; close all;

%% a) Cause-Effect Diagram

%% b) Function
% See end of script

%% c) Currents for Various Cases



























% Print a table of results
% T = array2table(currents','VariableNames',{'Case 1','Case 2','Case 3'},...
%     'RowNames',{'i1','i2','i3','i4','i5','i6'})


%% d) Effect of Applied Voltage on Currents




 











% Plot results (this part includes some extraneous plot prettification)
% figure
% plot(V_d,currents_d,'linewidth',1.5)
% grid on; hold on
% yline(I_max,'k--','Max Allowable Current','linewidth',2,...
%     'LabelHorizontalAlignment','left','FontSize',12,'Interpreter','latex')
% 
% xlabel('Voltage (V)','FontSize',12,'Interpreter','latex')
% ylabel('Currents (mA)','FontSize',12,'Interpreter','latex')
% title('Figure 1: Voltage Parameter Study','FontSize',14,'Interpreter','latex')
% legend([repmat('$i_',6,1) num2str([1:6]') repmat('$',6,1)],...
%     'FontSize',12,'location','northwest','Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])       % Will probably need to change this on your computer


% Max allowable voltage

% fprintf('For I_max = %6.3f mA, the max allowable voltage is %6.3f V\n\n',I_max,V_max)


%% e) Effect of R1 on Currents
% Set parameters

















% Plot results (this part includes some extraneous plot prettification)
% figure
% plot(R1_e,currents_e,'linewidth',1.5)
% grid on; hold on
% yline(I2_min,'k--','Min Allowable $i_3$','linewidth',2,...
%     'FontSize',12,'Interpreter','latex')
% 
% xlabel('$R_1$ ($\Omega$)','FontSize',12,'Interpreter','latex')
% ylabel('Currents (mA)','FontSize',12,'Interpreter','latex')
% title('Figure 2: Resistor 1 Parameter Study','FontSize',14,'Interpreter','latex')
% legend([repmat('$i_',6,1) num2str([1:6]') repmat('$',6,1)],...
%     'FontSize',12,'location','northeast','Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])       % Will probably need to change this on your computer


% Max allowable R1

% fprintf('For I2_min = %3.1f mA, the max allowable R1 is %6.3f \x3A9\n\n',I2_min,R1_max)


%% Function

% WheatstoneBridgeFunction: Computes currents in an electrical circuit (Wheatstone Bridge) with an 
% applied voltage and 5 resistors. 
% 
% Syntax: I = WheatstoneBridgeCircuit(V,R)
%           
% Input:    V =   applied voltage (V) [scalar]
%           R =   five resistance values, in order from R1-R5 (ohm) [vector]    
%           
% Output:   I =   six currents, in order from i1-i6 (A) [vector]

% Form matrices and solve via backslash








