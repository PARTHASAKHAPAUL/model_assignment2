%define the parameters for the Lotka-Volterra model with fishing
a=4;
b=2;
c=1.5;
d=3;

%the modified Lotka-Volterra equations with fishing as a function
f = @(t,y) [y(1)*(a-b*y(2)-0.2); y(2)*(-d+c*y(1)-0.2)];  %since delta is given as 0.2

%solving the system of ODEs using ode45 for the given initial values
[ts, ys] = ode45(f,[0, 5], [10 , 5]); %for the initial value and time interval [0,5]
%plotting the trajectories of prey and predator
plot(ts, ys)

title("Lotka Voltera with fishing");
xlabel('prey')
ylabel('predator')