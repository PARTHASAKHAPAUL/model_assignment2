% Loading the test dataset
test_data = readtable('iris_test_1.csv');

%extracting features and actual labels from the test dataset
test_features = test_data(:, 1:end-1);
actual = table2array(test_data(:, end));

%predict using the previously trained decision tree
predicted = predict(tree, test_features);

%converting categorical labels to numerical values for comparison
actual_num = double(actual);
pred_num = double(predicted);

%computing accuracy by comparing predicted and actual numbers
accuracy = sum(pred_num == actual_num) / numel(actual_num);

%displaying the classifier accuracy as a percentage
disp(['Classifier Accuracy: ', num2str(accuracy * 100), '%']);
