% Simulation parameters
lambda = 2;         % Arrival rate for the Poisson process
t_max = 10;         % Maximum simulation time
% Initializing
t = 0;
S = 0;  % Initial state for a Poisson process is typically 0
% Simulation Loop
while t < t_max
    % Generate exponential random variable for the holding time
    hold_time = exprnd(1/lambda);

    % Update time
    t = t + hold_time;

    % If time exceeds the maximum, exit the loop
    if t > t_max
        break;
    end

    % State transition for a Poisson process
    S = S + 1;
    % Display the event time and current state
    fprintf('Event at time %.4f, current state: %d\n', t, S);
end
