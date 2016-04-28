clear ;
close all;
clc;


data = load('sin.txt');
y = data(:,2);
m = length(y);
n = 3;
x = [data(:,1) data(:,1) ones(m,1)];


theta = [2;1;0];

X = [(x(:,1) * theta(1)) (x(:,2) * theta(2)) x(:,3) * theta(3)];

plot(x(:,1), y, 'rx', 'MarkerSize', 8);
%pause;

alpha = 0.1;
iterations = 1500;

J_interations = zeros(iterations,1);
theta_mat = zeros(m,n);
for i = 1:iterations
    cos_matrix = [cos(X(:,1)) cos(X(:,2)) ones(m,1)];
    theta_mat = x .* cos_matrix;
    j_mat = sin(X(:,1)) + sin(X(:,2)) + X(:,3) - y;
    theta = theta - alpha * ((j_mat)' * theta_mat)' / m;
    X = [(x(:,1) * theta(1)) (x(:,2) * theta(2)) x(:,3) * theta(3)];
    J_interations(i) = sum((sin(X(:,1)) + sin(X(:,2)) + theta(3) * ones(m,1) - y) .^2) / (2*m);
    %fprintf('%f \n',J_interations(i));
end
hold on;
plot(x(:,1),(sin(x(:,1) * theta(1)) + sin(x(:,2) * theta(2)) + theta(3)) ,'-');

fprintf('\nThe theta1 is %f \nThe theta2 is %f\nThe theta3 is %f\n\n',theta(1), theta(2), theta(3));
figure;
plot(linspace(1,iterations,iterations), J_interations(:,1), '-');

theta_1 = linspace(-4,10,100);
theta_2 = linspace(-4,10,100);
J_vals = zeros(length(theta_1), length(theta_2));
for i = 1:length(theta_1)
    for j = 1:length(theta_2)
        XX = [(x(:,1) * theta_1(i)) (x(:,2) * theta_2(j))];
        t = [theta_1(i);theta_2(j)];
        J_vals(i,j) = sum((sin(XX(:,1)) + sin(XX(:,2)) - y) .^2) / (2 * m);
    end
end
%pause;
figure;
surfc(theta_1, theta_2, J_vals);
colorbar;
xlabel('theta_1');
ylabel('theta_2');
%pause;
figure;
contour(theta_1, theta_2, J_vals);
xlabel('theta_1');
ylabel('theta_2');
colorbar;
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 6, 'LineWidth', 2);