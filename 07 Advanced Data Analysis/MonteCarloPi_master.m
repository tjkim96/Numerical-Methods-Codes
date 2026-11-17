%% Monte Carlo Estimation of Pi
% DESCRIPTION: In this example, we will estimate the value of pi by randomly sampling points in a
% square and counting how many of them land inside the circle enclosed by the square.
clear; clc; close all;

rng(1)      % Seed the random number generator so the results are repeatable

%% a) Sample Points and Estimate Pi
N = 1000;                           % Number of random points

x = 2*rand(N,1) - 1;                % x-coordinates, between -1 and 1
y = 2*rand(N,1) - 1;                % y-coordinates, between -1 and 1

inside = x.^2 + y.^2 <= 1;          % True for points on or inside the circle
num_inside = sum(inside)            % Number of points on or inside the circle

ratio = num_inside/N                % Fraction of points inside the circle
area_square = 4;                    % Area of the square [ND]
pi_est = ratio*area_square          % Estimate of pi

%% b) Plot the Points
figure
plot(x(~inside),y(~inside),'r.','markersize',10)
grid on; hold on
plot(x(inside),y(inside),'b.','markersize',10)

theta = linspace(0,2*pi,500);
plot(cos(theta),sin(theta),'k','linewidth',2)       % Outline of the circle
plot([-1 1 1 -1 -1],[-1 -1 1 1 -1],'k--','linewidth',2)   % Outline of the square
axis equal

xlabel('$x$','fontsize',14,'Interpreter','latex')
ylabel('$y$','fontsize',14,'Interpreter','latex')
title(sprintf('$N$ = %d, $\\pi \\approx$ %.4f',N,pi_est),'fontsize',14,'Interpreter','latex')
legend('Outside circle','Inside circle','fontsize',14,'Location','eastoutside','Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% c) Estimate Pi for Different N
N_vec = [100 1000 10000];                       % Number of points for each case
pi_est_vec = zeros(size(N_vec));                % Estimates of pi for each case
pct_error_vec = zeros(size(N_vec));             % Percent errors for each case

for i = 1:length(N_vec)
    pi_est_vec(i) = estimate_pi(N_vec(i),true);                 % Estimate pi and plot the points
    pct_error_vec(i) = abs(pi_est_vec(i) - pi)/pi*100;          % Percent error relative to true pi
end

fprintf('%-8s %-12s %-12s\n','N','Estimate','Error (%)');
fprintf('%-8d %-12.4f %-12.3f\n',[N_vec; pi_est_vec; pct_error_vec]);

%% d) Effect of N on the Error
N_vec = 10.^(2:6);                              % Number of points for each case
num_trials = 100;                               % Number of repeated estimates for each case
mean_error = zeros(size(N_vec));                % Mean percent error for each case

for i = 1:length(N_vec)
    error_trials = zeros(1,num_trials);
    for j = 1:num_trials
        error_trials(j) = abs(estimate_pi(N_vec(i)) - pi)/pi*100;
    end
    mean_error(i) = mean(error_trials);
end

figure
loglog(N_vec,mean_error,'bo-','linewidth',2)
grid on; hold on

% Reference line with a slope of -1/2, starting at the first point
ref_line = mean_error(1)*sqrt(N_vec(1))./sqrt(N_vec);
loglog(N_vec,ref_line,'k--','linewidth',2)

xlabel('Number of Points, $N$','fontsize',14,'Interpreter','latex')
ylabel('Mean Percent Error (\%)','fontsize',14,'Interpreter','latex')
title('Error of the Monte Carlo Estimate','fontsize',14,'Interpreter','latex')
legend('Mean of 100 trials','Slope of $-1/2$','fontsize',14,'Location','southwest','Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

% Slope of the results on the log-log plot
coefs = polyfit(log10(N_vec),log10(mean_error),1);
slope = coefs(1)

% The slope is very close to -1/2, so the error shrinks like 1/sqrt(N).

%% Function
function pi_est = estimate_pi(N,plot_flag)
% estimate_pi: Estimate pi by randomly sampling points in a square.
% Syntax:      pi_est = estimate_pi(N,plot_flag)
%
% Inputs:
%   N:                  Number of random points [ND] (scalar)
%   plot_flag:          Plot the points if true, default is false [ND] (logical)
%
% Output:
%   pi_est:             Estimate of pi [ND] (scalar)

if nargin < 2
    plot_flag = false;
end

x = 2*rand(N,1) - 1;
y = 2*rand(N,1) - 1;
inside = x.^2 + y.^2 <= 1;

area_square = 4;
pi_est = sum(inside)/N*area_square;

if plot_flag
    figure
    plot(x(~inside),y(~inside),'r.','markersize',10)
    grid on; hold on
    plot(x(inside),y(inside),'b.','markersize',10)
    theta = linspace(0,2*pi,500);
    plot(cos(theta),sin(theta),'k','linewidth',2)
    plot([-1 1 1 -1 -1],[-1 -1 1 1 -1],'k--','linewidth',2)
    axis equal
    xlabel('$x$','fontsize',14,'Interpreter','latex')
    ylabel('$y$','fontsize',14,'Interpreter','latex')
    title(sprintf('$N$ = %d, $\\pi \\approx$ %.4f',N,pi_est),'fontsize',14,'Interpreter','latex')
    legend('Outside circle','Inside circle','fontsize',14,'Location','eastoutside','Interpreter','latex')
    set(gca,'TickLabelInterpreter','latex')
    set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer
end

end
