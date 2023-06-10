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
ReD = 10^-3
eD = 0.002
friction_factor(ReD,eD)

%% Data
eD = [0.05,0.04, 0.03, 0.02, 0.015, ...
    0.01, 0.008, 0.006, 0.004, 0.002, 0.001,...
    0.0008, 0.0006, 0.0004, 0.0002, 0.0001,...
    0.00005, 0.00001];
ReD = logspace(3,8,100);

%% Compute f
f = zeros(length(eD),length(ReD));

for i = 1:length(eD)
    for j = 1:length(ReD)
        f(i,j) = friction_factor(ReD(j),eD(i));
    end
end

%% Plot f vs ReD
loglog(ReD,f,'LineWidth',1.5)
grid on
ylabel('Friction Factor, f')
xlabel('Re_D = u_m D/\nu')
title('The Moody Diagram')

ylim([0.008,0.1])
legend(num2str(eD'),'location','eastoutside')
lgd = legend;
lgd.FontSize = 9;
lgd.Title.String = '\epsilon/D';


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
f_guess = @(ReD,eD) (1.8*log10(6.9/ReD + (eD/3.7).^1.11) ).^-2;
colebrook = @(f) -2*log10(eD/3.7 + 2.51/ReD./sqrt(f))- 1./sqrt(f);

% Critical ReD for transition
ReD_critical = 3000;        % Critical Reynolds Number

% Determine f
if ReD < ReD_critical
    % laminar flow
    f = 64/ReD;

else 
    % turbulent flow
    f0 = f_guess(ReD,eD);
    f = fzero(colebrook,f0);
end
end