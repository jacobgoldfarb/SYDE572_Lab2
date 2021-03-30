close all;
load("lab2_2.mat");
figure
hold on;

% Part 1
MAP3(al', bl', cl',...
    mean(al), mean(bl), mean(cl),...
    cov(al), cov(bl), cov(cl),...
    length(al), length(bl), length(cl))  
scatter(al(:,1), al(:,2), 'x')
scatter(bl(:,1), bl(:,2), '*')
scatter(cl(:,1), cl(:,2))

% Part 2
Parzen2D()

