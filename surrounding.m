function [ img_sur ] = surrounding( img )

% SURROUNDING

%P = imread('lena_gray_256.tif');
%P = rgb2gray(P);

%P = [1 2 ; 3 4];

[M,N] = size(img);

RI = round (255*rand(2,(N+2)));
CI = round (255*rand(M,2));

img_sur = zeros(M+2,N+2);

img_sur(2:M+1,2:N+1) = img;

img_sur(1,:) = RI(1,:); 
img_sur(M+2,:) = RI(2,:);

img_sur(2:M+1,1) = CI(:,1); 
img_sur(2:M+1,N+2) = CI(:,2);

end