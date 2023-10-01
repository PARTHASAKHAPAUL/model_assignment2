r = [0.6,0.5,0.7,0.7,0.5,0.6,0.8,0.4,0.9,0.6,0.7,0.4,0.9,0.8,0.8,1,0.4,1,1,0.9];  %sample data for radius of cherries
%defining the percentage of data for training
percent_r = 0.8;
%calculating the number of samples for training and testing
%dividing the indices into training and test sets
trainInd_r = length(r) * percent_r;
testInd_r = length(r) - trainInd_r;
%finding the corresponding data items from the original dataset
trainData_r = r(1:trainInd_r);
testData_r = r(trainInd_r+1:end);

R = [2,1,1,3,4,5,2,1,3,5,2,2,2,5,4,6,7,6,5,3];    %sample data for radius of can
%defining the percentage of data for training
percent_R = 0.8;
%calculating the number of samples for training and testing
%dividing the indices into training and test sets
trainInd_R = length(R) * percent_R;
testInd_R = length(R) - trainInd_R;
%finding the corresponding data items from the original dataset
trainData_R = R(1:trainInd_R);
testData_R = R(trainInd_R+1:end);


h = [3,4,5,3,6,8,10,10,5,6,4,7,8,8,10,10,3,5,4,4];      %sample data for height of can
%defining the percentage of data for training
percent_h = 0.8;
%calculating the number of samples for training and testing
%dividing the indices into training and test sets
trainInd_h = length(h) * percent_h;
testInd_h = length(h) - trainInd_h;
%finding the corresponding data items from the original dataset
trainData_h = h(1:trainInd_h);
testData_h = h(trainInd_h+1:end);

N = [15,35,20,85,74,49,65,87,91,101,142,39,67,59,97,19,32,27,94,57]; %experimental data for number of cherries N

figure;
scatter3(trainData_R, trainData_r, trainData_h, 10, N(1:trainInd_r), 'filled');
colorbar;
xlabel('R');
ylabel('r');
zlabel('h');
