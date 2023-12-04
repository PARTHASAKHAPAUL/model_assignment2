
dx = 0.07;  % Spatial step size
dt = 0.1;  % Time step size
x = 0:dx:1; % for grid
tmax = 0.5; % Maximum simulation time

% Initial condition (example: step function)
%u0 = zeros(size(x));
%u0(x <= 0.5 ) = 1;
u0 = zeros(size(x));
u0(x >= 0.6 & x <= 0.7) = 1;

% Flux function
a = 0.1; % Slope of the flux function f(u) = au

% Initialize table data
tableData = zeros(length(x), tmax/dt + 1);

% Gudanov Method Simulation
t = 0;
for idt = 1:tmax/dt + 1
    % current density values in the table
    tableData(:, idt) = u0;
    
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

fprintf('Table: Data obtained using Gudanov Method when the signal is green \n');
