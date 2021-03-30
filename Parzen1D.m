function Parzen1D(stdev)
    load("lab2_1.mat");
    
    x = 0:0.01:10;
    mu = 5;
    var = 1;
    stdev_gauss = sqrt(var);
    y1 = normpdf(x, mu, stdev_gauss);
    lambda = 1;
    exponent = bsxfun(@times, lambda, x);
    y2 = lambda*exp(-exponent);
    
    dist1 = zeros(1,length(x));
    for i = 1:length(a)
        y3 = normpdf(x, a(i), stdev);
        dist1 = dist1 + (y3/length(b));
    end
    dist2 = zeros(1,length(x));
    for i = 1:length(b)
        y4 = normpdf(x, b(i), stdev);
        dist2 = dist2 + (y4/length(b));
    end
    
    plot(x,y1);
    hold on;
    plot(x, y2);
    plot(x, dist1);
    plot(x, dist2);
    legend('True Gaussan','True Exponential', 'Estimated Gaussian', 'Estimated Exponential');
    title('Parzen Estimates vs True PDF');
    xlabel('x');
    ylabel('p(x)');
    axis([0 10 0 1]);
    grid on;
    hold off;
end