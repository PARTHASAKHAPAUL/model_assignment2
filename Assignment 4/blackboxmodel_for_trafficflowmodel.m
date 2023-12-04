% Generating random data
num_samples = 100; % Number of data points
density = rand(num_samples, 1) * 100; % Random density values between 0 and 100
velocity = rand(num_samples, 1) * 30; % Random velocity values between 0 and 30
flow_rate = density .* velocity; % Calculating flow rate (density times velocity)

% Combining into one matrix
X = [density, velocity]; %  (density and velocity) for prediction
y = flow_rate; % (flow rate) to be predicted

% Splitting the data into training and testing sets (80% training, 20% testing)
split_ratio = 0.8;
split_idx = round(split_ratio * num_samples);
X_train = X(1:split_idx, :);
y_train = y(1:split_idx);
X_test = X(split_idx+1:end, :);
y_test = y(split_idx+1:end);

% Trainning a linear regression model
mdl = fitlm(X_train, y_train);

% Predicting flow rate using the trained model
y_pred = predict(mdl, X_test);

mse = mean((y_test - y_pred).^2); % Mean Squared Error

% Display the mean squared error
fprintf('Mean Squared Error: %.4f\n', mse);
