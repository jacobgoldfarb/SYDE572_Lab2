function Parzen2D
    load("lab2_2.mat");
    
    NA = length(al);
    NB = length(bl);
    NC = length(cl);

    var = 400;
    Sigma = [var 0; 0 var];
    
    X = [al(:,1)' bl(:,1)' cl(:,1)'];
    Y = [al(:,2)' bl(:,2)' cl(:,2)'];
    minVal = min(min(X), min(Y));
    maxVal = max(max(X), max(Y));
    
    finalOutputA = zeros(maxVal, maxVal);
    finalOutputB = zeros(maxVal, maxVal);
    finalOutputC = zeros(maxVal, maxVal);

    pairs = nchoosek(minVal:1:maxVal, 2);
    pairs = [pairs; pairs(:,2) pairs(:,1); [minVal:1:maxVal; minVal:1:maxVal]'];
    outputA = zeros(1, length(pairs));
    outputB = zeros(1, length(pairs));
    outputC = zeros(1, length(pairs));
    
    for i = 1:100
        i/100 %loading percentage
        outA = mvnpdf(pairs, al(i), Sigma)';
        outB = mvnpdf(pairs, bl(i), Sigma)';
        outC = mvnpdf(pairs, cl(i), Sigma)';
        outputA = outputA + outA;
        outputB = outputB + outB;
        outputC = outputC + outC;
    end
    
    for i = 1:length(pairs)
        i/length(pairs) %loading percentage
        finalOutputA(pairs(i, 1), pairs(i, 2)) = outputA(i);
        finalOutputB(pairs(i, 1), pairs(i, 2)) = outputB(i);
        finalOutputC(pairs(i, 1), pairs(i, 2)) = outputC(i);
    end
    figure
    hold on;    
    surf(finalOutputA, 'FaceColor', 'blue');
    alpha(0.4)
    surf(finalOutputB, 'FaceColor', 'yellow');
    alpha(0.4)
    surf(finalOutputC, 'FaceColor', 'green');
    alpha(0.4)
    
    domainLength = length(finalOutputA);
    boundaries = zeros(domainLength, domainLength )
    for i = 1:domainLength 
        for j = 1:domainLength
            (i*domainLength + j)/(domainLength^2) % loading percentage
            a_val = finalOutputA(i, j);
            b_val = finalOutputB(i, j);
            c_val = finalOutputC(i, j);
           if a_val > b_val && a_val > c_val
               boundaries(i, j) = 1;
           elseif b_val > c_val && b_val > a_val
               boundaries(i, j) = 2;
           elseif c_val > b_val && c_val > a_val
               boundaries(i, j) = 3;
           end
        end
    end
    figure
    imagesc(boundaries)
    disp("Done")
end
