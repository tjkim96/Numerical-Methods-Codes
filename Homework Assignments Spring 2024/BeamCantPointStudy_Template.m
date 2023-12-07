%% ME 2004: Deflection of a Cantilevered Beam Template
clear; clc; close all;

%% 1) Specify the System Parameters
E = 2*10^7;         % Young's Modulus [psi]
I = 0.163;          % Moment of inertia [in^4]
L = 12;             % Beam length [in]
W = 750;            % Point load magnitude [lb]
x = 0:0.01:L;       % Distance along beam [in]

%% 2) Call the 'BeamCantPoint' function to create a plot with a = 3 in




% Your code goes here




%% 3) Call the 'BeamCantPoint' function to create a single graph for a = 0 to L with increments of 2 in



% Your code goes here



%% 4) Analysis



% Write answers to analysis questions as MATLAB comments 
% or print to the Command Window via fprintf()/disp()





%% BeamCantPoint Function
function y = BeamCantPoint(E,I,a,W,x)
% BeamCantPoint
%   Generates a plot of deflection (y) vs position (x) for a cantilever
%   beam with an applied point load at location "a" along the beam.
% 
% Usage: BeamCantPoint(E,I,a,W,x)
%           
% Inputs: E = Young's Modulus [psi] (scalar)
%         I = moment of inertia [in^4] (scalar)
%         a = location of point load [in] (scalar)
%         W = point load magnitude [lbf] (scalar)
%         x = distance along the beam [in] (vector)
%
% Output: y = beam displacement as a function of x [in] (vector)
%         Also includes a plot of y vs. x





% Your code goes here





end