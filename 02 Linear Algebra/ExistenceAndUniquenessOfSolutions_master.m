%% ME 2004: Existence/Uniqueness of Solutions
% DESCRIPTION: In this example, we will investigate the values of two variables to alter the number
% of solutions to a system of equations.
clear; clc; close all;

%% Set lambda and mu
part = 'a';

switch part
    case 'a'
        % No solution
        % To have no solutions, lambda = 5 and mu =/= 9
        lambda = 5;
        mu = 20;        % Can change this to anything but 9

    case 'b'
        % Unique solution
        % To have a unique solution, lambda =/= 5 (mu is completely free)
        lambda = 4;     % Can change this to anything but 5
        mu = 12;        % Can change this to anything

    case 'c'
        % Infinite solutions
        % To have infinite solutions, lambda = 5 and mu = 9
        lambda = 5;
        mu = 9;
end

fprintf('For \x3BB = %d and \x3BC = %d:\n',lambda,mu)
fprintf('------------------------------\n')

%% Check Existence of Solutions
% Form A and A_tilde (augmented matrix)
A = [2 3 5;
    7 3 -2;
    2 3 lambda];
b = [9 8 mu]';

A_tilde = [A b];

% Check ranks
rank_A = rank(A);
rank_A_tilde = rank(A_tilde);

fprintf('The rank of A       is: %d\n',rank_A)
fprintf('The rank of A_tilde is: %d\n',rank_A_tilde)

% Check consistency
is_consistent = rank_A == rank_A_tilde;

if is_consistent
    fprintf('rank(A) = rank(A_tilde), so the system is consistent.\n\n')
else
    fprintf('rank(A) =/= rank(A_tilde), so the system is inconsistent.\n\n')
end

%% Check Uniqueness of Solutions
[~,n] = size(A);        % Get number of columns in A
fprintf('There are %d columns in A.\n',n)

if is_consistent
    % Only consistent systems can have solutions
    if rank_A == n
        % Unique solution
        fprintf('rank(A) = n, so there is a unique solution.\n')
        sol = A\b;
        fprintf('The unique solution is: (x,y,z) = (%3.2f,%3.2f,%3.2f)\n',sol)
    else
        % Infinite solutions
        fprintf('rank(A) < n, so there are infinite solutions.\n')
    end

else
    % Inconsistent system
    fprintf('The system is inconsistent, so there are no solutions.\n')
end

%% Plot the Row+Column Interpretations
% Column Interpretation
c1 = A(:,1);    % Extract 1st column of A
c2 = A(:,2);    % Extract 2nd column of A
c3 = A(:,3);    % Extract 3rd column of A

figure
subplot(121)

quiver3(0,0,0,c1(1),c1(2),c1(3),0,'b','linewidth',1.5)  % Column 1
grid on; hold on
quiver3(0,0,0,c2(1),c2(2),c2(3),0,'r','linewidth',1.5)  % Column 2
quiver3(0,0,0,c3(1),c3(2),c3(3),0,'g','linewidth',1.5)  % Column 3
quiver3(0,0,0,b(1),b(2),b(3),0,'k','linewidth',1.5)     % b vector

title('Column Interpretation','Interpreter','latex')
legend('Column 1','Column 2','Column 3','b','location','northwest','interpreter','latex')
set(gca,'TickLabelInterpreter','latex')



% Row interpretation
% Set colors
bl = [0.3020 0.7451 0.9333];    % More visually palatable shade of blue
r = [0.8902 0.6039 0.6039];     % More visually palatable shade of red
g = [0.7059 0.9294 0.6235];     % More visually palatable shade of green


subplot(122)

[x,y] = meshgrid(-5:0.5:15);  
z1 = (9 - 2*x - 3*y)/5;         % Create plane stemming from the 1st row of A
mesh(x,y,z1,'FaceColor',bl,'EdgeColor',bl)
grid on; hold on

z2 = (7*x + 3*y - 8)/2;         % Create plane stemming from the 2nd row of A
mesh(x,y,z2,'FaceColor',r,'EdgeColor',r)

z3 = (mu - 2*x - 3*y)/lambda;   % Create plane stemming from the 3rd row of A
mesh(x,y,z3,'FaceColor',g,'EdgeColor',g)

title('Row Interpretation','Interpreter','latex')
xlabel('x','Interpreter','latex')
ylabel('y','Interpreter','latex')
zlabel('z','Interpreter','latex')
legend('Row 1','Row 2','Row 3','fontsize',12,'location','northwest','interpreter','latex')

% Also plot the unique solution (if there is a unique solution)
if (is_consistent && (rank_A == n))
    plot3(sol(1),sol(2),sol(3),'kp','markersize',20,'MarkerFaceColor','k')
    legend('Row 1','Row 2','Row 3','Solution',...
        'fontsize',12,'location','northwest','interpreter','latex')
end

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[98 67 1754 915])    % Will probably have to change this