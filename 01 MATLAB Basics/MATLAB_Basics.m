%% ME 2004: MATLAB Basics
clear; clc; close all;

%% Part 1) Review of Creating Vectors 
% For the colon operator, we need to specify a start point, the increment
% size, and the end point:



% We can create an identical vector using the "linspace" command:


% You have multiple ways to construct vectors. Pick whichever method you
% like!

%% Part 2) Constructing Matrices
% You can think of a matrix as a series of vectors concatenated (stacked)
% with each other. For example, consider the following matrix:

    






% What about breaking up matrices into constituent vectors? 






%% Part 3) Extracting Elements From Vectors/Matrices
% To pull a single element from a vector, use index notation:



            

% To pull a single element from a matrix, we need two indices (one for the
% row and one for the column):


        

% More colon operator uses:



       

% Even more clever uses for the colon operator:


  

% Indexing proficiency will help you tremendously in this class. 

%% Part 4) Plotting
% Define the time vector:


% Define the sin and cos vectors:




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
