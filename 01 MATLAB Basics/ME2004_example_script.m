%% ME 2004: Example Script
% DESCRIPTION: This simple script demonstrates some basic MATLAB operations and features.
clear       % Removes all existing variables in the Workspace
clc         % Wipes the Command Window
close all   % Closes all currently open figure windows

%% You can partition your script file into sections by issuing double percent signs (%%)
% A regular comment is denoted by a single percent sign.
% Comments are ignored by MATLAB when the code runs. 
% Comments are used to document your code. Use them extensively!
% This is a really long comment. I've enabled code/text wrapping in my settings, so this comment
% will be automatically wrapped to the next line whenever I reach the max character limit (which I
% believe is 80 or 100 characters. I don't remember at the time of writing.)

% You can also write a block comment (multi-line comment) by issuing %{ and %}.

%{ 
this
is
a
block
comment!
%}

%% Do some basic math
x = 5       % There is no semicolon, so the result of this line will be printed to the Command Window
y = 10;     % The semicolon at the end suppresses the output of the line
 
z = x + y;

% Print some text using the disp() function
% Soon, we'll learn a fancier way to print stuff to the Command Window!
disp('Hello World!')
