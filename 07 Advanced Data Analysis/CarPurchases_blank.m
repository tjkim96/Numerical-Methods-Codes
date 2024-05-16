%% Binary Logistic Regression on Car Purchases (Blank)
% DESCRIPTION: In this script, we will import, clean, explore, and perform
% binary logistic regression on a dataset related to whether individuals
% purchased vehicles. 
clear; clc; close all

%% Load and Process Data





%% Descriptive Statistics
% % Parsing the numeric data
% columns_to_extract = [2 3];
% numeric_data = table2array(data(:,columns_to_extract));
% 
% % Obtain statistics
% stats = [min(numeric_data)' max(numeric_data)' median(numeric_data)' ...
%     mean(numeric_data)' std(numeric_data)'];       
% 
% % Format results
% array2table(stats,'VariableNames',{'Min','Max','Median','Mean','Standard Deviation'},...
%     'RowNames',{'Age (years)','Annual Salary ($)'})

%% Exploratory Plots
% Separate the data by gender




% Age histogram (separated by purchase decision)






% ylim([0 90])
% xlabel('Age')
% ylabel('Count')
% title('Age Distribution (Male)')
% 
% subplot(2,2,2)
% histogram(dataF.Age(dataF.Purchased == 1),bin_edges_age)
% grid on; hold on
% histogram(dataF.Age(dataF.Purchased == 0),bin_edges_age)
% ylim([0 90])
% xlabel('Age')
% ylabel('Count')
% title('Age Distribution (Female)')
% legend('Purchased','Did Not Purchase','location','northeast')
% set(gcf,'position',[1225 340 805 675])


% Annual salary histogram (separated by purchase decision)





% xlabel('Annual Salary ($1000)')
% ylabel('Count')
% title('Annual Salary Distribution (Male)')
% 
% 
% subplot(2,2,4)
% histogram(dataF.AnnualSalary(dataF.Purchased == 1),bin_edges_salary)
% grid on; hold on
% histogram(dataF.AnnualSalary(dataF.Purchased == 0),bin_edges_salary)
% xlabel('Annual Salary ($1000)')
% ylabel('Count')
% title('Annual Salary Distribution (Female)')
% legend('Purchased','Did Not Purchase','location','northeast')



% Scatterplot




% xlabel('Annual Salary ($1000)')
% ylabel('Age')
% legend('Male, No Purchase','Male, Purchased','Female, No Purchase','Female, Purchased',...
%     'location','southeast')
% set(gcf,'position',[1225 340 805 675])



% Pearson Correlation Coefficients


% figure
% hm_labels = {'Age','Annual Salary','Purchased'};
% heatmap(hm_labels,hm_labels,rhos,'Colormap',winter);
% set(gcf,'position',[1225 340 805 675])


%% Binomial Logistic Regression Model
% Split the data into training and testing sets
% 30 percent of the data is randomly selected via a holdout method for testing the model 




% Build model





% Prediction


% Evaluate the model's performance via a Confusion Matrix



% figure
% matrix_labels = {'0','1'};
% confusionchart(C,matrix_labels)
% xlabel('Predicted');
% ylabel('True'); 

% Compute the accuracy of the regression model
%   Accuracy = (TP+TN)/(TP+TN+FP+FN)
%   where: TP = True positive; FP = False positive; TN = True negative; FN = False negative

