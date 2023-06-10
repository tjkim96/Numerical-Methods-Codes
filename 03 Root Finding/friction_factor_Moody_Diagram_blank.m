%% ME 2004: Friction Factor in a Pipe -- the Moody Diagram
%
% The 'friction_factor.m' function is tested.
%
% Then the friction factor in a pipe is computed for the conditions shown in
% the famous Moody diagram.  These results are plotted to create our own
% Moody diagram.
%
% Inputs:   ReD = Reynold's number = um*D/viscosity
%           eD = roughness ratio = surafce roughness/diameter
%
% Output:   f = friction factor
%
% All variables are scalars and are dimensionless.
clear; clc; close all
format compact

%% Initial Test




%% Data






%% Compute f








%% Plot f vs ReD













%% Function
function f = friction_factor(ReD,eD)
% friction_factor: Computes the friction factor in a pipe using the Colebrook correlation.
%
% Syntax:   f = friction_factor(ReD,eD)
%
% Inputs:   ReD = Reynold's number = um*D/viscosity
%           eD = roughness ratio = surafce roughness/D
%
% Output:   f = friction factor
%
% All variables are scalars and are dimensionless.

% define Colebrook equation and initial guess



% Critical ReD for transition


% Determine f









end