%define the parameters for the Lotka-Volterra model
a = 4;
b = 2;
c = 1.5;
d = 3;

%Phase portrait without fishing
figure
%define the Lotka-Volterra equations as a function
f = @(t, y) [y(1)*(a - b*y(2)); y(2)*(-d + c*y(1))];

%solving the system of ODEs using ode45 for the given initial values
[ts, ys] = ode45(f, [0 , 5], [10 , 5]);
%plotting the phase portrait
plot(ys(:, 1), ys(:, 2))

title("Phase Portrait without Fishing");
xlabel('Prey Population');
ylabel('Predator Population');


%phase portrait with fishing
figure
%define the modified Lotka-Volterra equations with fishing as a function
f = @(t, y) [y(1)*(a - b*y(2) - 0.2); y(2)*(-d + c*y(1) - 0.2)]; %since delta is given as 0.2

%solving the system of ODEs using ode45 for the given initial values
[ts, ys] = ode45(f, [5, 10], [10 ; 5]);
%plotting the phase portrait
plot(ys(:, 1), ys(:, 2))

title("Phase Portrait with Fishing");
xlabel('Prey Population');
ylabel('Predator Population');
