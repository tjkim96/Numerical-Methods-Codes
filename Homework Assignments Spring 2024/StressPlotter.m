function [] = StressPlotter(x, y, stresses, xi, yi, stress)
% INPUT:
%   x:          x-coordinate [m] (vector)
%   y:          y-coordinate [m] (vector)
%   stresses:   stresses at (x,y) [MPa] (matrix)
%   xi:         x-coordinate for interpolation [m] (scalar)
%   yi:         y-coordinate for interpolation [m] (scalar)
%   stress:     stress at xi, yi
% OUTPUT:
%   none

% plot the 3D data
figure
[X,Y] = meshgrid(x,y);              % create a 3D xy mesh
surf(X,Y,stresses)                  % plot stresses
hold on

% label the axes
xlabel('x (m)')
ylabel('y (m)')
zlabel('Stresses (MPa)')
title('Stresses On A Concrete Slab')

% plot the interpolated point
plot3(xi, yi, stress, 'r.', 'markersize', 25) % plot interpolated values
legend('Data','Interpolation','location','northwest')

end