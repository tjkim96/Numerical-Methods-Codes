%% ME 2004: MATLAB Basics
clear; clc; close all;

%% Part 1) Review of Creating Vectors 
% For the colon operator, we need to specify a start point, the increment
% size, and the end point:
A_colon = 0:2:10 
A_colon2 = 0:3:17       % Why is the last number 15 instead of 17?

% We can create an identical vector using the "linspace" command:
A_linspace = linspace(0,10,6)

% You have multiple ways to construct vectors. Pick whichever method you
% like!

%% Part 2) Constructing Matrices
% You can think of a matrix as a series of vectors concatenated (stacked)
% with each other. For example, consider the following matrix:
matrix1 = magic(3)      % Create a 3x3 magic square
    
vec1 = [8 1 6];         % Split matrix1 into rows
vec2 = [3 5 7];
vec3 = [4 9 2];

matrix2 = [vec1;        % Rebuild matrix1 using vertically stacked row vectors
    vec2;
    vec3]

% What about breaking up matrices into constituent vectors? 
row1 = matrix1(1,:)
row2 = matrix1(2,:)
row3 = matrix1(3,:)

%% Part 3) Extracting Elements From Vectors/Matrices
% To pull a single element from a vector, use index notation:
v = 1:3:20
v(3)                    % Element in the 3rd position of the vector
% v(0)                    % Uncomment this line to see what happens!

% To pull a single element from a matrix, we need two indices (one for the
% row and one for the column):
m = magic(5)            % Create a 5x5 magic square
m(2,5)                  % Pull element in the 2nd row, 5th column of m

% More colon operator uses:
v(2:6)                  % Extract a range of elements from a vector
m(1:3,5)                % Extract a range of elements from rows of a matrix
m(1,2:4)                % Extract a range of elements from columns of a matrix

% Even more clever uses for the colon operator:
v2 = v(1:2:end-1)       % Extract every other element, ending at the penultimate entry
v3 = v([5:7 1:4])       % Swaps elements 1-4 with 5-7
v4 = v(end:-1:1)        % Reverses vector
v(2:4) = [0 -1 -2]      % Replaces elements 2-4 with the vector on the RHS

% Indexing proficiency will help you tremendously in this class. 

%% Part 4) Plotting
% Define the time vector:
t = 0:0.1:3*pi;         

% Define the sin and cos vectors:
sine = sin(t);
cosine = cos(t);

% Uncomment the following lines to plot:
% figure
% plot(t,sine,'gv')
% hold on
% grid on
% plot(t,cosine,'m--')
% xticks([0 pi 2*pi 3*pi])
% xticklabels({'0','\pi','2\pi','3\pi'})
% 
% % Every plot also needs descriptors:
% xlabel('Time (s)')
% ylabel('Response (m)')
% title('Response Versus Time')
% legend('sin','cos')

% Also be sure to read the documentation on subplots!
