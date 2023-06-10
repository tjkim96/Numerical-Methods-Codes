%% ME 2004: Traffic Network
% DESCRIPTION: In this example, we will solve a linear system of equations involving a traffic
% network. Interestingly, the system is underdetermined.
clear; clc; close all;

%% b) Number of Vehicles Exiting Grape St W
% Vehicles entering the network
GrapeE_in = 80;
GrapeW_in = 50;
Pear_in = 65;
Orange_in = 40;
total_in = GrapeE_in + GrapeW_in + Pear_in + Orange_in;

% Vehicles exiting the network
GrapeE_out = 30;
Pear_out = 70;
Apple_out = 55;
Orange_out = 75;
total_out = GrapeE_out + Pear_out + Apple_out + Orange_out;

% Apply "conservation of cars" (analogue of KCL)
GrapeW_out = total_in-total_out;

fprintf('There are %d vehicles exiting Grape St. W.\n',GrapeW_out)

%% d) Solve Linear System
A = [1      -1      0       0       0       0       0;
    0       1       0       1       -1      0       0;
    0       0       0       0       1       0       -1;
    0       0       0       0       0       -1      1;
    0       0       1       1       0       -1      0;
    1       0       -1      0       0       0       0];
b = [10 5 -10 30 50 -15]';
reduced = rref([A b])           % Can't use inv() or \ operators because A is non-square


%% Graphical Interpretation
[i4,i7] = meshgrid(0:25,30:80);         % Make 2D grid coordinates (necessary for a 3D plot)
colors = winter(3);                     % Set color scheme for the plots

figure
for k=1:3
    ii = -i4 + i7 + reduced(k,end);     % Form the i1-i3 equations
    ii(ii<0) = NaN;                     % Filter out any negative currents

    surf(i4,i7,ii,'EdgeColor',colors(k,:),'FaceColor',colors(k,:))
    grid on; hold on
end

xlabel('$i_4$ (Vehicles)','fontsize',14,'Interpreter','latex')
ylabel('$i_7$ (Vehicles)','fontsize',14,'Interpreter','latex')
legend('$i_1$','$i_2$','$i_3$','fontsize',14,'Location','northeast','Interpreter','latex')
title("Some of Fruit Village's Traffic Flows",'fontsize',14,'Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% Graphical Interpretation (if you want to include i5 and i6)
% [i4,i7] = meshgrid(0:25,30:80);         % Make 2D grid coordinates (necessary for a 3D plot)
% colors = winter(6);                     % Set color scheme for the plots
% 
% figure
% for k=[1:3 5:6]
%     ii = -i4*reduced(k,4) + i7 + reduced(k,end);     % Form the equations
%     ii(ii<0) = NaN;                     % Filter out any negative currents
% 
%     surf(i4,i7,ii,'EdgeColor',colors(k,:),'FaceColor',colors(k,:))
%     grid on; hold on
% end
% 
% xlabel('$i_4$ (Vehicles)','fontsize',14,'Interpreter','latex')
% ylabel('$i_7$ (Vehicles)','fontsize',14,'Interpreter','latex')
% legend('$i_1$','$i_2$','$i_3$','$i_5$','$i_6$','fontsize',14,'Location','northeast','Interpreter','latex')
% title("Some of Fruit Village's Traffic Flows",'fontsize',14,'Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
