function Parzen2D
    load("lab2_2.mat");
    
    NA = length(al);
    NB = length(bl);
    NC = length(cl);

    var = 400;
    Sigma = [var 0; 0 var];
    
    [finalOutputA, xA, yA] = parzen(al, 0.5, 400);
    [finalOutputB, xB, yB] = parzen(bl, 0.5, 400);
    [finalOutputC , xC, yC] = parzen(cl, 0.5, 400);
    

    figure
    hold on;    
    surf(xA, yA, finalOutputA,'FaceColor', 'blue');
    alpha(0.4)
    surf(xB, yB, finalOutputB, 'FaceColor', 'yellow');
    alpha(0.4)
    surf(xC, yC, finalOutputC, 'FaceColor', 'green');
    alpha(0.4)
    figure

    domainLength = ceil(max([xA xB xC]));
    rangeLength = ceil(max([yA yB yC]));
    
    boundaries = zeros(domainLength, rangeLength )
    for i = 1:rangeLength
        for j = 1:domainLength
            (i*domainLength + j)/(domainLength*rangeLength) % loading percentage
            id_xA = find(xA == j);
            id_yA = find(yA == i);
            
            id_xB = find(xB == j);
            id_yB = find(yB == i);
            
            id_xC = find(xC == j);
            id_yC = find(yC == i);
            
            if isempty(id_xA ) || isempty(id_yA)
                a_val = 0;
            else            
                a_val = finalOutputA(id_yA, id_xA);
            end
            
            if isempty(id_xB )|| isempty(id_yB)
                b_val = 0;
            else            
                b_val = finalOutputB(id_yB, id_xB);
            end
            
            if isempty(id_xC) || isempty(id_yC)
                c_val = 0;
            else            
                c_val = finalOutputC(id_yC, id_xC);
            end

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
