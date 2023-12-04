%question_3
a=4;
b=2;
c=1.5;
d=3;

%phase potrait without fishing
figure
f = @(t,y) [y(1)*(a-b*y(2)); y(2)*(-d+c*y(1))];
hold on
for y0=0:5:15
[ts, ys] = ode45(f,[5, 10], [y0/2, y0]);
plot(ys(:,1), ys(:,2))
end
hold off
title("Phase potrait without fishing");
xlabel('prey')
ylabel('predator')


%phase potrait with fishing
figure
f = @(t,y) [y(1)*(a-b*y(2)-0.2); y(2)*(-d+c*y(1)-0.2)];
hold on
for y0=0:5:15
[ts, ys] = ode45(f,[5, 10], [y0/2, y0]);
plot(ys(:,1), ys(:,2))
end
hold off
title("Phase potrait with fishing");
xlabel('prey')
ylabel('predator')