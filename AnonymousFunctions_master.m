%% ME 2004: Anonymous Functions
% DESCRIPTION: In this example, we will create and plot some anonymous functions.
clear; clc; close all;

%% 1) Single Argument
% Write an anonymous function which evaluates the parabola y = x^2 + x + 5 at a given x-location:
y = @(x) x.^2+x+5;

x_val = 10;
y_val = y(x_val)   % Preferred (the output is stored in the y_val variable)

% Plot the parabola from x=-2 to x=2:
fplot(y,[-2 2],'linewidth',8)

grid on; hold on
xlabel('x')
ylabel('y')
title('My Parabola!')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% 2) Multiple Arguments
% Write an anonymous function which evaluates the parabola y = a*x^2 + b*x + c at a given x-location:
yy = @(a,b,c,x) a*x.^2 + b*x + c;

a = 1;
b = 1;
c = 5;
yy_val = yy(a,b,c,x_val)

% Plot the parabola from x=-2 to x=2 (on the same figure):
fplot(@(x) yy(a,b,c,x),[-2 2],'linewidth',3)

legend('Single-Argument Anonymous Function','Multi-Argument Anonymous Function',...
    'location','northwest')

%% 3) Vector of Outputs
% Write an anonymous function which converts a given speed from km/h to both m/s and mph:
convert_speed = @(v) [v*(5/18) v*0.62137]; 
my_speeds = convert_speed(80)

% Technically there's only one output, but the output is a 2-element vector.
% The first element is the speed in m/s; the second element is the speed in mph.
% Even though the equation is simple, it's stylistically better to write a user-defined function.
