function [ share1_r, share2_r , share3_r , share4_r , share5_r , share6_r, share1_g, share2_g, share3_g , share4_g , share5_g , share6_g, share1_b, share2_b , share3_b , share4_b , share5_b , share6_b ] = main3()
%for COLORING IMAGE

A = c0(6);
B = c1(6);

%img = imread('sti\color.tiff'); %ORJÝNAL DENEME RESMÝ
%img = imread('sti\house_color.tiff');
%img = imread('sti\jetplane_color.tiff');
%img = imread('sti\peppers_color.jpg');
img = imread('sti\lena_color_256.tif');

[W, H ,X] = size (img); % 3 boyutlu için
 
 my_rgb = img;
 Red = my_rgb(:,:,1);
 Green = my_rgb(:,:,2);
 Blue = my_rgb(:,:,3);
 

figure,imshow(Red),figure,imshow(Green),figure,imshow(Blue); 
 
[ share1_r, share2_r, share3_r, share4_r, share5_r, share6_r ] = main3_red(A, B, 6,Red);
[ share1_g, share2_g, share3_g, share4_g, share5_g, share6_g ] = main3_green(A, B, 6,Green);
[ share1_b, share2_b, share3_b, share4_b, share5_b, share6_b ] = main3_blue(A, B, 6,Blue);


% [ share1_r, share2_r, share3_r, share4_r, share5_r, share6_r ] = main3_color();
% [ share1_g, share2_g, share3_g, share4_g, share5_g, share6_g ] = main3_color();
% [ share1_b, share2_b, share3_b, share4_b, share5_b, share6_b ] = main3_color();


% shares_r = share1_r | share2_r | share3_r | share4_r | share5_r | share6_r;
% shares_g = share1_g | share2_g | share3_g | share4_g | share5_g | share6_g;
% shares_b = share1_b | share2_b | share3_b | share4_b | share5_b | share6_b;

%figure,imshow(shares_r),figure,imshow(shares_g),figure,imshow(shares_b);

share_r = share1_r | share2_r | share3_r | share4_r | share5_r | share6_r;
share_g = share1_g | share2_g | share3_g | share4_g | share5_g | share6_g;
share_b = share1_b | share2_b | share3_b | share4_b | share5_b | share6_b;

figure,imshow(share_r), figure,imshow(share_g), figure,imshow(share_b);

total_share(:,:,1) = share_r;
total_share(:,:,2) = share_g;
total_share(:,:,3) = share_b;

total_share = uint8 (total_share);


for i=1:W
    for j=1:H
        for s=1:X
            if total_share(i,j,s)== 1 %orjinali 1
                total_share(i,j,s) = 255;
            end
        end
    end
end
figure,imshow(total_share);
end