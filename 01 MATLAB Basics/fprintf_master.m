%% ME 2004: Printing With The fprintf() Function
% DESCRIPTION: This script experiments with MATLAB's fprintf() statement. 
clear; clc; close all;

%% Printing Characters and Strings
% Pure character vectors and strings
fprintf('Hello World \n')
fprintf("Hello\tagain\n\n")

% Using a variable
name = 'Matt Labb';
fprintf('My name is:\t %s \n',name)

% Using multiple variables
first_language = 'English';
second_language = 'French';
fprintf('I can speak both %s and %s!\n',first_language,second_language)

% Order matters!
male = 'Jim';
female = 'Pam';
fprintf("In the TV show 'The Office', %s becomes %s's wife\n",female,male)

%% Printing Numbers
% Pure numbers
fprintf('There are 8 slices of pizza.\n')

% Using variables and floating-point numbers
num_slices_start = 8;
num_eaten = 4.5;
num_remaining = num_slices_start - num_eaten;
fprintf('There were originally %d slices of pizza.\n',num_slices_start)
fprintf('I ate %06.1f slices.\n',num_eaten)

% Printing the percent character
percent_remaining = 100*(num_remaining/num_slices_start);
fprintf('%0.3f%% of the pizza remains.\n\n',percent_remaining)

%% Getting Fancy
fruit_1 = 'APPLE';
fruit_2 = 'orange';
fruit_3 = 'Mango';
fruit_4 = 'cherry!';

fruit_1_eaten = 3*ones(1,3);
fruit_2_eaten = 2:-1:0;
fruit_3_eaten = [0 0 1.5];
fruit_4_eaten = [0.1 0 5];

total_fruit_eaten = [fruit_1_eaten; fruit_2_eaten; fruit_3_eaten; fruit_4_eaten];

fprintf('Amount of Fruit Eaten From January-March (lbs)\n')
fprintf('----------------------------------------------\n')
fprintf('%s\t\t%s\t\t%s\t\t%s\n',fruit_1,fruit_2,fruit_3,fruit_4)
fprintf('%1.1f\t\t\t%d\t\t\t%8.5f\t%2.2f\n',total_fruit_eaten)
