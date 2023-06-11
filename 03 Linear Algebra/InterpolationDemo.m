%% ME 2004: Linear Interpolation Demo
% DESCRIPTION: In this demo, we'll explore linear interpolation 2 ways: 
% with Newton Interpolation (from the "08a: Linear Interpolation Review" 
% YouTube video) and with MATLAB's interp1 function. 
clear; clc; close all;

%% 1) Linear Interpolation Formula (Newton Interpolation)
% Recreate the dataset and results in the "08a: Linear Interpolation 
% Review"  video:




% figure
% plot(x,y,'bo-')
% grid on; hold on
% axis([-1 4 -1 9])
% xlabel('x data')
% ylabel('y data')
% title('Linear Interpolation')

% We wanted to compute the interpolated value "fb" at a point "b". 
% We used b = 2.5 and got fb = 6.5. 









% Sure enough, we get the same results as the video. Let's plot b and fb.


%% 2) interp1
% Now let's try using the interp1 function. 


% legend('Data','Formula','interp1','location','northwest')

% The results agree exactly. 
