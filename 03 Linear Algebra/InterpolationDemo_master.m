%% ME 2004: Linear Interpolation Demo
% DESCRIPTION: In this demo, we'll explore linear interpolation 2 ways: 
% with Newton Interpolation (from the "08a: Linear Interpolation Review" 
% YouTube video) and with MATLAB's interp1 function. 
clear; clc; close all;

%% 1) Linear Interpolation Formula (Newton Interpolation)
% Recreate the dataset and results in the "08a: Linear Interpolation 
% Review"  video:

x = 0:3;
y = [2 4 5 8];

figure
plot(x,y,'bo-')
grid on; hold on
axis([-1 4 -1 9])
xlabel('x data')
ylabel('y data')
title('Linear Interpolation')

% We wanted to compute the interpolated value "fb" at a point "b". 
% We used b = 2.5 and got fb = 6.5. 
b = 2.5                         % Point of interest
a = 2                           % First surrounding point
c = 3                           % Second surrounding point

fa = y(x == a)                  % f(a)
fc = y(x == c)                  % f(c)

fb = fa + (fc-fa)/(c-a)*(b-a)   % f(b) using the interpolation formula 

% Sure enough, we get the same results as the video. Let's plot b and fb.
plot(b,fb,'rx')

%% 2) interp1
% Now let's try using the interp1 function. 
fb2 = interp1(x,y,b)
plot(b,fb2,'kv')
legend('Data','Formula','interp1','location','northwest')

% The results agree exactly. 
