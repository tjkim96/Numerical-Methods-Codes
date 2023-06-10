%% ME 2004: Wheatstone Bridge
% DESCRIPTION: In this example, we will solve a linear system of equations involving a Wheatstone
% Bridge.
clear; clc; close all;

%% a) Cause-Effect Diagram

%% b) Function
% See end of script

%% c) Currents for Various Cases
% Resistances
R_case1 = 1000*ones(1,5);
R_case2 = R_case1;
R_case3 = 1000*[1 5 2 10 5];

R = [R_case1;
    R_case2;
    R_case3];

% Voltages
V_case1 = 0;
V_case2 = 100;
V_case3 = V_case2;

V = [V_case1 V_case2 V_case3]';


% Preallocate matrix to store currents for all 3 cases
currents = zeros(length(V),6);

for j=1:length(V)
    % Compute currents for each case, then convert to mA
    currents(j,:) = 1000*WheatstoneBridgeFunction(V(j),R(j,:))';
    % The transpose converts the WheatstoneBridgeFunction's output column vector to a row vector 
    % so it can be suitably stored in the currents matrix...but it works without it, too!
end

% Print a table of results
T = array2table(currents','VariableNames',{'Case 1','Case 2','Case 3'},...
    'RowNames',{'i1','i2','i3','i4','i5','i6'})


%% d) Effect of Applied Voltage on Currents
% Set parameters
V_d = linspace(0,500,2500);
R_d = R_case3;

I_max = 0.08*1000;  % Set max allowable current (converted to mA)  

% Preallocate matrix to store currents for all cases of V
currents_d = zeros(length(V_d),6);

for k=1:length(V_d)
    % Compute currents for each case, then convert to mA
    currents_d(k,:) = 1000*WheatstoneBridgeFunction(V_d(k),R_d);
    % No transpose added here to show that you don't need it because row/col vectors are indexed the
    % same (since they each only have 1 dimension). But you should add it for correctness
end

% Plot results (this part includes some extraneous plot prettification)
figure
plot(V_d,currents_d,'linewidth',1.5)
grid on; hold on
yline(I_max,'k--','Max Allowable Current','linewidth',2,...
    'LabelHorizontalAlignment','left','FontSize',12,'Interpreter','latex')

xlabel('Voltage (V)','FontSize',12,'Interpreter','latex')
ylabel('Currents (mA)','FontSize',12,'Interpreter','latex')
title('Figure 1: Voltage Parameter Study','FontSize',14,'Interpreter','latex')
legend([repmat('$i_',6,1) num2str([1:6]') repmat('$',6,1)],...
    'FontSize',12,'location','northwest','Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])       % Will probably need to change this on your computer


% Max allowable voltage
V_max = max(V_d(currents_d(:,6) <= I_max));
fprintf('For I_max = %6.3f mA, the max allowable voltage is %6.3f V\n\n',I_max,V_max)


%% e) Effect of R1 on Currents
% Set parameters
V_e = 100;

R1_e = [0:1000]';
R_e = [R1_e repmat(R_case3(2:end),length(R1_e),1)]; % Create matrix of R's for all the R1 cases

I2_min = 0.005*1000;    % Set max allowable current (converted to mA) 

% Preallocate matrix to store currents for all cases of R1
currents_e = zeros(length(R_e),6);

for m=1:length(R_e)
    % Compute currents for each case, then convert to mA
    currents_e(m,:) = 1000*WheatstoneBridgeFunction(V_e,R_e(m,:))';
    % No transpose added here to show that you don't need it because row/col vectors are indexed the
    % same (since they each only have 1 dimension). But it's added for correctness
end

% Plot results (this part includes some extraneous plot prettification)
figure
plot(R1_e,currents_e,'linewidth',1.5)
grid on; hold on
yline(I2_min,'k--','Min Allowable $i_3$','linewidth',2,...
    'FontSize',12,'Interpreter','latex')

xlabel('$R_1$ ($\Omega$)','FontSize',12,'Interpreter','latex')
ylabel('Currents (mA)','FontSize',12,'Interpreter','latex')
title('Figure 2: Resistor 1 Parameter Study','FontSize',14,'Interpreter','latex')
legend([repmat('$i_',6,1) num2str([1:6]') repmat('$',6,1)],...
    'FontSize',12,'location','northeast','Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])       % Will probably need to change this on your computer


% Max allowable R1
R1_max = max(R1_e(currents_e(:,3) >= I2_min));
fprintf('For I2_min = %3.1f mA, the max allowable R1 is %6.3f \x3A9\n\n',I2_min,R1_max)


%% Function
function I = WheatstoneBridgeFunction(V,R)
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
A = [0      R(2)    0       R(4)    0       0;
    R(1)    -R(2)   R(3)    0       0       0;
    0       0       -R(3)   -R(4)   R(5)    0;
    1       1       0       0       0       -1;
    0       1       1       -1      0       0;
    1       0       -1      0       -1      0];
b = [V zeros(1,5)]';
I = A\b; 
end