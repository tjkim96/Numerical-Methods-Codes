%% ME 2004: Lateral Acceleration of a Vehicle
% DESCRIPTION: This example demonstrates the use of MATLAB functions. We
% will calculate the lateral acceleration of a vehicle negotiating a turn
% for various speeds and curve radii via a function. We then use logical
% indexing to see which cases produce uncomfortable lateral accelerations. 
clear; clc; close all;

%% System Parameters





%% Computing lateral accelerations using the 'latAccel' function
% Call the 'latAccel' function


% Plot the accelerations as a function of velocity:
% plot(velocities,accels,'b.-') % Don't plot discrete data as a line
% xlabel('Velocity (m/s)')
% ylabel('Lateral Acceleration (g)')
% title('Lateral Acceleration vs. Velocity')
% yline(0.6,'r--','Comfort Threshold',...
%     'LabelHorizontalAlignment','left','HandleVisibility','off'); 

% The graph is parabolic, which makes sense since a is proportional to v^2.
% Note: yline only works for MATLAB R2018b and later. 
% 'HandleVisibility','off' ensures this line won't appear on the legend we
% insert later. This is known as a "name-value pair" (read MATLAB
% documentation to learn more).

%% Finding a range of v's from a desired acceleration range (vectorized)
% Use logical indexing to retrieve indices of accelerations within our
% specified range (0.1g < a < 0.2g):


% This returns the locations in the accels vector which satisfy the range.
% What are the actual acceleration values?


% Find the corresponding speeds:


% Plot these velocities/accelerations using black diamonds:



%% Finding a range of v's from a desired acceleration range (for loop)
% Repeat the above scenario using decision and repetition structures
% (for, if, etc.) instead of vectorization. Loop through each computed 
% lateral accelerations and check if each individual value is within 0.1g 
% and 0.2g.








% Plot these velocities/accelerations using magenta squares:


% Finally, add a legend in the upper left corner:


%% latAccel function
function a = latAccel(v,R,g)
% latAccel: Computes lateral accelerations of a vehicle (modeled as a point
% mass) given a range of velocities and a single (constant) curve radius.
% 
% Inputs:
% v: Range of velocities [m/s] (vector)
% R: Curve radius [m] (scalar)
% g: Gravitational acceleration [m/s^2] (scalar)
% 
% Output:
% a: Lateral accelerations [m/s^2] (vector)

% Use dot notation to vectorize the function:

end
