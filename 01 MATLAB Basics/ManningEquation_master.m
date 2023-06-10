%% ME 2004: Manning's Equation
% DESCRIPTION: In this example, we will compute the velocity of water in an open channel for various
% parameter combinations. This will be done via clever use of element-wise and matrix
% multiplication.
clear; clc; close all;

%% a) S and H vectors
% First, we should define the other parameters
W = 1.5;                % Channel width [m]
n = 0.036;              % Channel roughness [ND]

% And now the vectors
H = [1:10]/10;          % Channel heights [m]
S = [12:3:18]/1000;     % Channel slopes [ND]

%% b) Compute V (in one statement)
% Need the transpose after the (sqrt(S)/n) term to make inner dimensions compatible for matrix
% multiplication
V = (sqrt(S)/n)'*((W*H)./(W + 2*H)).^(2/3);

%% c) Plot V vs. H
figure
plot(H,V,'^-','linewidth',1.5)
grid on

xlabel('Channel Height (m)')
ylabel('Flow Velocity (m/s)')
title('Figure 1: Effect of Slope on the Water Velocity in a Rectangular Channel')
legend(num2str(S'),'location','southeast')
