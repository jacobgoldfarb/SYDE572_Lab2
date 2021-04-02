close all;
load("lab2_2.mat");
figure
hold on;

% Part 1
MAP3(al', bl', cl',...
    mean(al), mean(bl), mean(cl),...
    cov(al), cov(bl), cov(cl),...
    length(al), length(bl), length(cl))  
scatter(at(:,1), at(:,2), 'x')
scatter(bt(:,1), bt(:,2), '*')
scatter(ct(:,1), ct(:,2))
legend('Class A', 'Class B', 'Class C',  'AutoUpdate', 'off')

% Part 2
Parzen2D()
hold on;
scatter(al(:,1), al(:,2), 'x')
scatter(bl(:,1), bl(:,2), '*')
scatter(cl(:,1), cl(:,2))
legend('Class A', 'Class B', 'Class C',  'AutoUpdate', 'off')
