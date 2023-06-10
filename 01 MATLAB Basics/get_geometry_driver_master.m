%% ME 2004: get_geometry() Driver File
% DESCRIPTION: In this script, we call the get_goemetry() function for a few simple test cases.
clear; clc; close all;

%% Case 1
% Set parameters
length = 10;
width = 20;

% Function call
fprintf('Case 1\n')
fprintf('------\n')
[perim,area] = get_geometry(length,width);

%% Case 2
% Use another pair of parameters
length = 3;
width = 3;

% Function call
fprintf('Case 2\n')
fprintf('------\n')
[~,area] = get_geometry(length,width);

%% Case 3
% The order in which you provide the inputs matters!
length = 1;
width = 5;

fprintf('Case 3\n')
fprintf('------\n')
[perim,area] = get_geometry(width,length);

%% Case 4
% You can also call the function using different variable names
length_of_rectangle = 1;
width_of_rectangle = 5;

fprintf('Case 4\n')
fprintf('------\n')
[perimeter_of_rectangle,area_of_rectangle] = get_geometry(length_of_rectangle,width_of_rectangle);
