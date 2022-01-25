function [  ] = RGB_Channel( img )

%img = imread('sti\lena_color_256.tif'); % Read image

img = imread('sti\color.tiff'); % Read image
red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel
a = zeros(size(img, 1), size(img, 2));
just_red = cat(3, red, a, a);
just_green = cat(3, a, green, a);
just_blue = cat(3, a, a, blue);
back_to_original_img = cat(3, red, green, blue);
figure, imshow(img), %title('Original image')
figure, imshow(just_red),% title('Red channel')
figure, imshow(just_green), %title('Green channel')
 figure, imshow(just_blue), % title('Blue channel')
% figure, imshow(back_to_original_img), title('Back to original image')


end

