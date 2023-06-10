%% ME 2004: Population Study
% DESCRIPTION: In this example, we will solve a root finding problem about population growth via 
% the graphical method and also the built-in fzero() function. 
clear; clc; close all;

%% Shrinking or Growing?
% The Pc equation contains a decaying exponential term, so the city population shrinks over time.
% The Ps equation also has a decaying exponential term, but it's in the denominator of the fraction
% so it really acts like a growth term.

%% Create Population Plot
% Parameters
Pc_max = 80e3;      % [people]
kc = 0.05;          % [1/year]
Pc_min = 110e3;     % [people]
Ps_max = 320e3;     % [people]
P0 = 10e3;          % [people]
ks = 0.09;          % [1/year]

% Plot both populations



% figure
% fplot(Pc,'b','linewidth',2)
% grid on; hold on
% fplot(Ps,'r','linewidth',2)
% 
% xlim([0 100])
% xlabel('Time (years)','fontsize',14,'Interpreter','latex')
% ylabel('Population (people)','fontsize',14,'Interpreter','latex')
% title('Figure 1: City and Suburb Population Plots','fontsize',14,'Interpreter','latex')
% legend('City','Suburb','fontsize',14,'Location','northwest','Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer

%% When Suburbs Are 20% Larger Than The City
% Generate plot


% figure
% fplot(P,'k','linewidth',2)
% grid on; hold on
% yline(0,'m--','linewidth',2)
% 
% xlim([0 100])
% xlabel('Time (years)','fontsize',14,'Interpreter','latex')
% ylabel('Population Ratio (ND)','fontsize',14,'Interpreter','latex')
% title('Figure 2: (Suburb/City) Population Plot','fontsize',14,'Interpreter','latex')
% legend('$\left( \frac{P_s}{P_c} \right)=1.2$','fontsize',14,'Location','northwest','Interpreter','latex')
% 
% set(gca,'TickLabelInterpreter','latex')
% set(gcf,'Position',[988 196 881 714])   % Will probably need to change this on your computer


% Solve using fzero()



% Print to Command Window and append to original population plot



%% When Suburbs Are X% Larger Than The City (Parameter Study)
























%% Max Value of X
% From pulling the values of Ps(t) and Pc(t) at a very large t from Figure 1:



% ...Or, the more elegant (analytical) method:
% The limit of Pc(t) as t-->infinity = P_c,min
% The limit of Ps(t) as t-->infinity = P_s,max
% 
% Therefore, the max possible X value is:


%% Function
function [Pc_t,Ps_t] = printStuff(t_root,X,Pc,Ps,mrk)
Ps_t = Ps(t_root);
Pc_t = Pc(t_root);

fprintf('When t=%6.3f years, Ps=%3.2f*Pc\n',t_root,X)
fprintf('At this time, Ps=%5.3e people\n',Ps_t)
fprintf('and           Pc=%5.3e people\n\n',Pc_t)

% Append to original population plot
figure(1)
plot(t_root,Pc_t,'marker',mrk,'color',[0.4940 0.1840 0.5560],'linewidth',2,...
    'DisplayName',['$\left( \frac{P_s}{P_c} \right)=$',num2str(X)])
plot(t_root,Ps_t,'marker',mrk,'color',[0.4940 0.1840 0.5560],'linewidth',2,'HandleVisibility','off')
line([t_root t_root],[Pc_t Ps_t],'color',[0.4940 0.1840 0.5560],'linewidth',2,'HandleVisibility','off')
end
