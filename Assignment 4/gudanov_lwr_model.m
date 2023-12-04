% Parameters
dx = 0.1;  % Spatial step size
dt = 0.1;  % Time step size
x = 0:dx:1; % Spatial grid
tmax = 1.0; % Maximum simulation time

% Initial condition
u0 = zeros(size(x));
u0(x >= 0.6 & x <= 0.7) = 1; % Initial density

% Initialize table data
tableData = zeros(length(x), tmax/dt + 1);

% Godunov Method
t = 0;
for idt = 1:tmax/dt + 1
    %current density
    tableData(:, idt) = u0;
    
    % Godunov method
    unew = u0;
    for i = 2:length(x) - 1
        % flux using LWR model
        flux_left = u0(i - 1);
        flux_right = u0(i);
        
        % Godunov
        unew(i) = u0(i) - (dt / dx) * (flux_right - flux_left);
    end
    
    % Update time and solution
    t = t + dt;
    u0 = unew;
end

% Display the table
fprintf('Gudanov Method for LWR Model\n');
fprintf('t\t');
fprintf('x%.3f\t', x);
fprintf('\n');

for idt = 1:tmax/dt + 1
    fprintf('%.1f\t', (idt - 1) * dt);
    fprintf('%.3f\t', tableData(:, idt));
    fprintf('\n');
end

fprintf('Table: Data obtained using Gudanov Method for the LWR model.\n');
