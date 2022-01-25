 function [result1, result2, result3] = correlation(img,n)

%img = imread('sti\lena_gray_256.tif');

img=double(img);


img_value = double(zeros(n, 1));
img_value_hor = double(zeros(n, 1));
img_value_ver = double(zeros(n, 1));
img_value_dia = double(zeros(n, 1));

[W, H] = size (img);


for i = 1: n
    
    row = randi([1 W],1,1);
    column = randi([1 H],1,1);
    
    img_value(i) = img(row,column);

    random1 = randi([-1 1],1,1);
    random2 = randi([-1 1],1,1);
    random3 = randi([-1 1],1,1);


        if (random1==0)
             random1 = randi([-1 1],1,1);
        end  
        
        if (random2==0)
            random2 = randi([-1 1],1,1);
        end
        
        if (random3==0)
           random3 = randi([-1 1],1,1);
        end
        
        
        if (row== 1) && (column ==1)
        
        img_value_hor(i) = img(row,column+1);
        img_value_ver(i) = img(row+1,column); 
        img_value_dia(i) = img(row+1,column+1);
        
        elseif (row == 1) && (column ==H)
        
        img_value_hor(i) = img(row,column-1);
        img_value_ver(i) = img(row+1,column); 
        img_value_dia(i) = img(row+1,column-1);
        
        elseif (row == W) && (column ==1)
        
        img_value_hor(i) = img(row,column+1);
        img_value_ver(i) = img(row-1,column); 
        img_value_dia(i) = img(row-1,column+1);
        
        elseif (row == W) && (column ==H)
        
        img_value_hor(i) = img(row,column-1);
        img_value_ver(i) = img(row-1,column); 
        img_value_dia(i) = img(row-1,column-1);
        
        elseif (row == 1)
        
        img_value_hor(i) = img(row,column+random1);
        img_value_ver(i) = img(row+1,column); 
        img_value_dia(i) = img(row+1,column+random3); 

        elseif (row == W)
        
        img_value_hor(i) = img(row,column+random1);
        img_value_ver(i) = img(row-1,column); 
        img_value_dia(i) = img(row-1,column+random3); 

         elseif (column == 1)
        
        img_value_hor(i) = img(row,column+1);
        img_value_ver(i) = img(row+random2,column); 
        img_value_dia(i) = img(row+random3,column+1);
        
        elseif (column == W)
        
        img_value_hor(i) = img(row,column-1);
        img_value_ver(i) = img(row+random2,column); 
        img_value_dia(i) = img(row+random3,column-1); 
        
        else
        
        img_value_hor(i) = img(row,column+random1);
        img_value_ver(i) = img(row+random2,column); 
        img_value_dia(i) = img(row+random3,column+random3);
        
        end

img_value = double(img_value);
img_value_hor = double(img_value_hor);
img_value_ver = double(img_value_ver); 
img_value_dia = double(img_value_dia);

result1 = corrcoef(img_value,img_value_hor);
result2 = corrcoef(img_value,img_value_ver);
result3 = corrcoef(img_value,img_value_dia);


end

end