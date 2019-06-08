function [img]=img_threshold(img, min,max) 

[xlen, ylen] = size(img);
for i = 1:xlen
    for j = 1:ylen
        
        if(img(i,j) < min || img(i,j) > max)
            img(i,j) = 0;
        end
        
    end
end