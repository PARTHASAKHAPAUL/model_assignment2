% Parameters
dx = 0.1;  % Spatial step size (smaller step size for stability)
dt = 0.1;  % Time step size (satisfies CFL condition: a * dt / dx <= 1)
x = 0:dx:1; % Spatial grid
tmax = 0.5; % Maximum simulation time

% Initial condition (example: step function)
u0 = zeros(size(x));
u0(x >= 0.0 & x <= 0.5) = 0.1;

% Flux function
a = 2; % Slope of the flux function f(u) = au

% Initialize table data
tableData = zeros(length(x), tmax/dt + 1);

% Godunov Method Simulation
t = 0;
for idt = 1:tmax/dt + 1
    % Store current density values in the table
    tableData(:, idt) = u0;
    
    % Godunov method update
    unew = u0;
    for i = 2:length(x) - 1
        % Calculate numerical flux at cell boundaries (Godunov flux)
        flux_left = a * u0(i - 1);
        flux_right = a * u0(i);
        
        % Godunov update
        unew(i) = u0(i) - (dt / dx) * (flux_right - flux_left);
    end
    
    % Update time and solution
    t = t + dt;
    u0 = unew;
end

% Display the table
fprintf('Godunov Method\n');
fprintf('t\t');
fprintf('x%.1f\t', x);
fprintf('\n');

for idt = 1:tmax/dt + 1
    fprintf('%.1f\t', (idt - 1) * dt);
    fprintf('%.3f\t', tableData(:, idt));
    fprintf('\n');
end

fprintf('Table: Data obtained using Godunov Method when the signal is red.\n');
