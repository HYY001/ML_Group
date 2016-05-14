clear ; close all ;clc

%% SETUP THE PARAMETERS
input_layer_size = 400;
num_labels = 10;

%% LOADING AND VISUALIZING DATA

fprintf('Loading and Visualizing Data ...\n');

load('ex3data1.mat');
m = size(X,1);

rand_indices = randperm(m);
sel = X(rand_indices(1:100),:);

displayData(sel);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% VECTORIZE LOGISTIC REGRESSION

fprintf('\nTraining One-vs-All Logistic Regression...\n')

lambda = 0.1;
[all_theta] = oneVsAll(X,y,num_labels,lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% PREDICT FOR ONE-VS-ALL
pred = predictOneVsAll(all_theta,X);
fprintf('\nTraining Set Accuracy: %f\n',mean(double(pred == y))*100);
