%% ME 2004: Anonymous Functions
% DESCRIPTION: In this example, we will create and plot some anonymous functions.
clear; clc; close all;

%% 1) Single Argument
% Write an anonymous function which evaluates the parabola y = x^2 + x + 5 at a given x-location:





% Plot the parabola from x=-2 to x=2:


% grid on; hold on
% xlabel('x')
% ylabel('y')
% title('My Parabola!')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% 2) Multiple Arguments
% Write an anonymous function which evaluates the parabola y = a*x^2 + b*x + c at a given x-location:







% Plot the parabola from x=-2 to x=2 (on the same figure):


% legend('Single-Argument Anonymous Function','Multi-Argument Anonymous Function',...
%     'location','northwest')

%% 3) Vector of Outputs
% Write an anonymous function which converts a given speed from km/h to both m/s and mph:



% Technically there's only one output, but the output is a 2-element vector.
% The first element is the speed in m/s; the second element is the speed in mph.
% Even though the equation is simple, it's stylistically better to write a user-defined function.
