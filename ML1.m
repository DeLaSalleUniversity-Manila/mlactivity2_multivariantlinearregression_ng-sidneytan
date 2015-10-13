x = load('ex2x.dat');
y = load('ex2y.dat');
plot(x(:,1),y,'o');
plot(x(:,2),y,'o');
x = [ones(50,1),x];

%preprocessing

sigma = std(x);
mu = mean(x);
x(:,2) = (x(:,2) - mu(2))./ sigma(2);
x(:,3) = (x(:,3) - mu(3))./ sigma(3);
plot(x(:,2),y,'o');
plot(x(:,3),y,'o');


%cost J

alpha = 0.8;
j = zeros(50,1);
theta = zeros(size(x(1,:)))';
for num = 1:50
j(num) = (0.5 * 50) * (x * theta - y)' * (x * theta - y);
theta = theta - (alpha / 50) * x' *(x * theta - y);
end
figure;
plot(0:49,j(1:50),'-');
xlabel('Number of iterations');
ylabel('Cost j');
