%% ME 2004: Reactor Concentrations
% DESCRIPTION: In this example, we will solve a linear system of equations involving coupled 
% reactors. Along the way, we will calculate the inverse and norm (both not by hand).
clear; clc; close all;

%% a) Solve via Inverse
A = [15 -3 -1;
    -3 18 -6;
    -4 -1 12];
b = 1e3*[4 1.5 2.4]';
Ainv = inv(A)
c = Ainv*b

%% b) Compare with Matt Labb's Answer
% Error and norms
c_ML = 100*[3 2.5 3]';          % Matt Labb's solution
err = c - c_ML;                 % Form error vector

err_1norm = norm(err,1)
err_2norm = norm(err,2)
err_inf = norm(err,inf)

%% c) Inducing a Change in Reactor 1
del_c1 = 10;
del_b3 = del_c1/Ainv(1,3)

% Check answer
b_new = b;
b_new(3) = b_new(3) + del_b3;
c_new = Ainv*b_new;

c_1_diff = c_new(1) - c(1)

%% d) Inducing a Change in Reactor 3
del_b1 = -500;
del_b2 = -250;

del_c3 = sum(Ainv(3,1:2)*[del_b1 del_b2]')

% Check answer
c_new = Ainv*(b + [del_b1 del_b2 0]');
c_3_diff = c(3) - c_new(3)
