function [ decrypted_image_color ] = color_result( D_img_1_r , D_img_2_r , D_img_3_r , D_img_4_r , D_img_5_r , D_img_6_r , D_img_1_g , D_img_2_g , D_img_3_g , D_img_4_g , D_img_5_g , D_img_6_g , D_img_1_b , D_img_2_b , D_img_3_b , D_img_4_b , D_img_5_b , D_img_6_b )


decrypted_image_r = D_img_1_r | D_img_2_r | D_img_3_r | D_img_4_r | D_img_5_r | D_img_6_r;
decrypted_image_g = D_img_1_g | D_img_2_g | D_img_3_g | D_img_4_g | D_img_5_g | D_img_6_g;
decrypted_image_b = D_img_1_b | D_img_2_b | D_img_3_b | D_img_4_b | D_img_5_b | D_img_6_b;

figure,imshow(decrypted_image_r), figure,imshow(decrypted_image_g), figure,imshow(decrypted_image_b);

decrypted_image_color(:,:,1) = decrypted_image_r;
decrypted_image_color(:,:,2) = decrypted_image_g;
decrypted_image_color(:,:,3) = decrypted_image_b;

decrypted_image_color = uint8 (decrypted_image_color);

[W, H ,P] = size (decrypted_image_color); % 3 boyutlu için

for i=1:W
    for j=1:H
        for s=1:P
            if decrypted_image_color(i,j,s)== 1 %orjinali 1
                decrypted_image_color(i,j,s) = 255;
            end
        end
    end
end
figure,imshow(decrypted_image_color);
end