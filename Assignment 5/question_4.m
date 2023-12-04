
f = @(t,y) [4*y(1); -3*y(2)];  %for linearizing
figure
[ts, ys] = ode45(f,[0, 5], [10 , 5]);
plot(ts,ys);
grid on
title("Trajectory of Lotka Volterra without fishing taking (0,0) as equilibrium point");
xlabel('prey')
ylabel('predator')

figure
plot(ys(:,1),ys(:,2));
grid on
title("phase potrait of Lotka Volterra without fishing taking (0,0) as equilibrium point");
xlabel('prey')
ylabel('predator')



f = @(t,y) [-4*y(2); 3*y(1)];  %for linearizing
figure
[ts, ys] = ode45(f,[0, 5], [10 , 5]);
plot(ts,ys);
grid on
title("Trajectory of Lotka Volterra without fishing taking (2,2) as equilibrium point");
xlabel('prey')
ylabel('predator')

figure
plot(ys(:,1),ys(:,2));
grid on
title("phase potrait of Lotka Volterra without fishing taking (2,2) as equilibrium point");
xlabel('prey')
ylabel('predator')



f = @(t,y) [3.8*y(1); -3.2*y(2)];  %for linearizing
figure
[ts, ys] = ode45(f,[0, 5], [10 , 5]);
plot(ts,ys);
grid on
title("Trajectory of Lotka Volterra with fishing taking (0,0) as equilibrium point");
xlabel('prey')
ylabel('predator')

figure
plot(ys(:,1),ys(:,2));
grid on
title("phase potrait of Lotka Volterra with fishing taking (0,0) as equilibrium point");
xlabel('prey')
ylabel('predator')


f = @(t,y) [-4.267*y(2); 2.85*y(1)];  %for linearizing
figure 
[ts, ys] = ode45(f,[0, 5], [10, 5]);
plot(ts,ys);
grid on
title("Trajectory of Lotka Volterra with fishing taking (2.133,1.9) as equilibrium point");
xlabel('prey')
ylabel('predator')

figure
plot(ys(:,1),ys(:,2));
grid on
title("phase potrait of Lotka Volterra with fishing taking (2.133,1.9) as equilibrium point");
xlabel('prey')
ylabel('predator')