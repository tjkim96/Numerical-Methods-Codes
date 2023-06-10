function [perim,area] = get_geometry(length,width)
% get_geometry: Computes the perimeter and area of a rectangle given its length and width.
% 
% Inputs:
%   length: rectangle's length [m] (scalar)
%   width:  rectangle's width [m] (scalar)
% 
% Outputs:
%   perim:  rectangle's perimeter [m] (scalar)
%   area:   rectangle's area [m^2] (scalar)

% Print the given dimensions
fprintf('You entered a length of %4.4f m and a width of %4.4f m.\n',length,width)

% Calculate perimeter
perim = 2*length + 2*width;
fprintf('The perimeter of the rectangle is %4.4f m\n',perim)

% Calculate area
area = length*width;
fprintf('The area of the rectangle is %4.4f m^2\n\n',area)
end