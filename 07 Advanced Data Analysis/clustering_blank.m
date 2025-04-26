%% MLB Clustering Analysis (Blank)
% DESCRIPTION: This script explores k-means clustering using a dataset 
% containing the number of home runs and wins for each of the 30 Major 
% League Baseball teams in the 2024 season. 
clear; clc; close all

% Data sources:
% https://www.baseball-reference.com/leagues/MLB-standings.shtml
% https://baseballsavant.mlb.com/statcast_search?hfPT=&hfAB=home%5C.%5C.run%7C&hfGT=R%7C&hfPR=&hfZ=&hfStadium=&hfBBL=&hfNewZones=&hfPull=&hfC=&hfSea=2024%7C&hfSit=&player_type=batter&hfOuts=&hfOpponent=&pitcher_throws=&batter_stands=&hfSA=&game_date_gt=&game_date_lt=&hfMo=&hfTeam=&home_road=&hfRO=&position=&hfInfield=&hfOutfield=&hfInn=&hfBBT=&hfFlag=&metric_1=&group_by=team&min_pitches=0&min_results=0&min_pas=0&sort_col=pitches&player_event_sort=api_p_release_speed&sort_order=desc&chk_stats_velocity=on#results

%% Load and Process Data



%% Exploratory Data Analysis
% Summary statistics




% HR Histogram (separated by league)






% xlabel('Number of Home Runs','fontsize',14)
% ylabel('Frequency','fontsize',14)
% title('Home Runs Histogram','fontsize',16)
% legend('National League','American League','location','northwest','fontsize',14)
% set(gcf,'position',[1225 340 805 675])


% Wins Histogram (separated by league)





% xlabel('Number of Wins','fontsize',14)
% ylabel('Frequency','fontsize',14)
% title('Wins Histogram','fontsize',16)


% Scatterplot


% grid on; hold on
% xlabel('Number of Home Runs','fontsize',14)
% ylabel('Number of Wins','fontsize',14)
% title('Figure 3: Grouped Scatterplot','fontsize',16)
% set(gcf,'position',[1225 340 805 675])


% Pearson Correlation Coefficient



%% K-Means Clustering






% Perform K-means for different cluster counts






% Plot the Elbow Method


% grid on
% xlabel('Number of Clusters')
% ylabel('WCSS')
% title('Elbow Method for Optimal k')
% set(gcf,'position',[400 340 805 675])


%% Cluster Plot Subfunction
function fig = plotClusters(X,idx,ctrds,k)
% This function makes a new figure and plots each cluster (separated by
% color) and the silhouette plot.
% 
% Inputs:
%   X:      data (matrix)
%   idx:    cluster assignments (vector)
%   ctrds:  centroid locations (matrix)
%   k:      number of clusters (scalar)
% 
% Outputs:
%   fig:    figure handle

fig = figure;
clrs = colormap(turbo(k));  % Make colormap

% Plot the clusters
subplot(2,1,1)
for i=1:k
    scatter(X(idx==i,1),X(idx==i,2),75,clrs(i,:),'filled',...
        'DisplayName',['Cluster ' num2str(i)])
    grid on; hold on
end

% Plot the centroids
plot(ctrds(:,1),ctrds(:,2),'kx',...
    'MarkerSize',15,'LineWidth',3,'DisplayName','Centroids') 

xlabel('Number of Home Runs','fontsize',14)
ylabel('Number of Wins','fontsize',14)
title(['Clusters and Centroids, k=' num2str(k)],'fontsize',16)
legend('location','eastoutside','fontsize',14)
set(fig,'position',[1225 340 805 675])

% Silhouette plots
subplot(2,1,2)
silhouette(X,idx)
grid on; hold on
xline(0.6,'r--','LineWidth',3)  % In this example, a silhouette score of >0.6 is "good"
end
