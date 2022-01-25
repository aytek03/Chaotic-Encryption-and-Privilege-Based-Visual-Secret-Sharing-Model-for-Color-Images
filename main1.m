function [ share1, share2, share3, share4, share5, share6 ] = main1()

A = c0(6);
B = c1(6);

img = imread('sti\lena_gray_256.tif');

%img = imread('sti\barbara.png');

%img = imread('sti\boat.tiff');

%img = imread('sti\elaine.tiff');

%img = imread('sti\building.png');

%img = imread('sti\peppers_256.tif');

%img = imread('sti\cameraman_256.tif');
%img = rgb2gray(img);

[ share1, share2, share3, share4, share5, share6 ] = dispatching(img, A, B, 6);

% shares12 = xor (share1,share2);
% share123 = xor (shares12,share3);
% share1234 = xor (sahre123,share4);
% share12345 = xor (share1234,share5);
% share123456 = xor (share12345,share6);


shares = share1 | share2| share3| share4| share5| share6 ;

%figure,imshow(share123456);
%figure,imshow(shares);

 share12 = share6 | share5;
 share123 = share6 | share5 | share4;
 share1234 = share6 | share5 | share4 | share3;
 share1245 = share6 | share5 | share3 | share2;
 share12345 = share6 | share5 | share4 | share3 | share2;
 share123456 = share1 | share2 | share3 | share4 | share5 | share6;
 

 figure,imshow(share12);
 figure,imshow(share123);
 figure,imshow(share1234);
 figure,imshow(share1245);
 figure,imshow(share12345);
 figure,imshow(share123456);

end

% share1_s_p = imnoise(share1, 'salt & pepper', 0.02);
% share2_s_p = imnoise(share2, 'salt & pepper', 0.02);
% share3_s_p = imnoise(share3, 'salt & pepper', 0.02);
% share4_s_p = imnoise(share4, 'salt & pepper', 0.02);
% share5_s_p = imnoise(share5, 'salt & pepper', 0.02);
% share6_s_p = imnoise(share6, 'salt & pepper', 0.02);
% 
% pepper_noise = share1_p_n | share2_p_n | share3_p_n | share4_p_n | share5_p_n | share6_p_n;
% 
% shares = share1 | share2 | share3 | share4 | share5 | share6;
% pepper_noise = D_img_1 | D_img_2 | D_img_3 | D_img_4 | D_img_5 | D_img_6;
% 
% figure,imshow(shares), figure,imshow(pepper_noise);