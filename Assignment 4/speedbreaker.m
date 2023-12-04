dx = 0.07;  % Spatial step size
dt = 0.1;   % Time step size
x = 0:dx:1; % Spatial grid
tmax = 1.5; % Maximum simulation time (extended for three signal phases)

% Initial condition (example: step function)
u0 = zeros(size(x));
u0(x >= 0.6 & x <= 0.7) = 1; % Initially set as green signal

% Flux function
a = 0.1; % Slope of the flux function f(u) = au

% Speed breaker parameters
speed_breaker_start = 0.3; % Position where speed breaker starts
speed_breaker_end = 0.4;   % Position where speed breaker ends
speed_breaker_factor = 0.5; % Factor by which speed is reduced in the speed breaker region

% Initialize table data
tableData = zeros(length(x), tmax/dt + 1);

% Godunov Method Simulation
t = 0;
for idt = 1:tmax/dt + 1
    % current density values in the table
    tableData(:, idt) = u0;
    
    % Check if the signal should be red or green based on time
    if t >= 0.5 && t < 1.0
        % Set as red signal
        u0(x >= 0.2 & x <= 0.3) = 1; % Speed breaker before red signal
        u0(x >= 0.4 & x <= 0.5) = 1; % Speed breaker after red signal
    else
        % Set as green signal
        u0(x >= 0.2 & x <= 0.5) = 0; % No speed breaker during green signal
    end
    
    % Apply speed breaker effect
    speed_breaker_mask = x >= speed_breaker_start & x <= speed_breaker_end;
    u0(speed_breaker_mask) = u0(speed_breaker_mask) * speed_breaker_factor;
    
    % Gudanov method
    unew = u0;
    for i = 2:length(x) - 1
        % Calculate numerical flux at boundaries (Gudanov flux)
        flux_left = a * u0(i - 1);
        flux_right = a * u0(i);
        
        % Gudanov updation
        unew(i) = u0(i) - (dt / dx) * (flux_right - flux_left);
    end
    
    % Updating time and solution
    t = t + dt;
    u0 = unew;
end

% Displaying the table
fprintf('Gudanov Method\n');
fprintf('t\t');
fprintf('x%.3f\t', x);
fprintf('\n');

for idt = 1:tmax/dt + 1
    fprintf('%.1f\t', (idt - 1) * dt);
    fprintf('%.3f\t', tableData(:, idt));
    fprintf('\n');
end

fprintf('Table: Data obtained using Gudanov Method with speed breaker before and after signals.\n');
