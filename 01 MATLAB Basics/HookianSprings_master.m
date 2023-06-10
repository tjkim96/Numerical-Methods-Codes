%% ME 2004: Hookian Springs
% DESCRIPTION: In this example, we will use the built-in min() and max() functions on a short 
% dataset involving Hookian springs.
clear; clc; close all;

%% a) Create F and x vectors
F = [15 17 19 13 20 18];                % Applied forces [N]
x = [34 45 35 28 26 31]/100;            % Measured displacements [m]

%% b) Compute k and U vectors via dot notation
% I decided to unsuppress k and U since they're short and won't occupy much page real estate,
% but printing to the Command Window isn't required. 

k = F./x                                % Spring stiffnesses [N/m]
U = (k.*(x.^2))/2                       % Spring potential energies [J]

%% c) Use the min()/max() functions to compute the min/max U and locations (read the documentation!)
[U_min,U_min_location] = min(U);
[U_max,U_max_location] = max(U);

%% d) Print results to Command Window
fprintf('Spring %d has the minimum potential energy. U_min = %.2f J \n',U_min_location,U_min)
fprintf('Spring %d has the maximum potential energy. U_max = %.2f J \n\n',U_max_location,U_max)
