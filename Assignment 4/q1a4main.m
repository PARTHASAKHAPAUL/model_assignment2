dx = 0.07;  % Spatial step size
dt = 0.1;   % Time step size
x = 0:dx:1; % Spatial grid
tmax = 1;   % Maximum simulation time

% Initial condition
u0 = zeros(size(x));
u0(x >= 0.6 & x <= 0.7) = 1; % Initially set as green signal

% Flux function
a = 0.1; % Slope of the flux function f(u) = au

% Initialize table data
tableData = zeros(length(x), tmax/dt + 1);

% Gudanov Method Simulation
t = 0;
for idt = 1:tmax/dt + 1
    % current density values in the table
    tableData(:, idt) = u0;
    
    % Check if the signal should be red or green based on time
    if t >= 0.5
        u0(x >= 0.2 & x <= 0.4) = 0; % Set as red signal
    end
    
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

fprintf('Table: Data obtained using Gudanov Method with alternating green and red signals.\n');
