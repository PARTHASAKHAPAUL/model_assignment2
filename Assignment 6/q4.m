% Loading the dataset
data = readtable('iris_training_1.csv');

%extracting features and labels from the dataset
features = data(:, 1:end-1);
labels = data(:, end);

%to train a decision tree using fitctree
tree = fitctree(features, labels);

%displaying the trained decision tree graphically
view(tree, 'Mode', 'graph');

%an example prediction for a new data point (iris flower)
example = [1.4, 0.2]; %an example of petal length and petal width

% Using the trained decision tree to predict the class of the example
prediction = predict(tree, example);
disp(['Predicted class: ', num2str(prediction)]);
