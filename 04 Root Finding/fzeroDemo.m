%% ME 2004: fzero Demo
% DESCRIPTION: In this demo, we experiment with fzero using the Manning
% Equation. 

clear; clc; close all

%% System Parameters and fzero
Q = 5;          % Flow [m^3/s]
S = 2e-4;       % Slope [m/m]
B = 20;         % Width [m]
n = 0.03;       % Roughness coefficient [ND]


% Plot the function:

% grid on
% xlabel('Depth (m)')
% ylabel('f(x)')
% title('Finding a Suitable x_0')

% Select a suitable x0 and call fzero:



% Check the accuracy of the root:


%% Testing some other x0
% What happens if we try an x0 that isn't "reasonably close" to the actual
% root?



% As you can see, we got an error because we chose our starting point too
% far away from the actual root. Of course, there's no way we can intuit a
% reasonably close root upon glancing at the equation, which is yet another
% reason why we should plot the function at the start. 
