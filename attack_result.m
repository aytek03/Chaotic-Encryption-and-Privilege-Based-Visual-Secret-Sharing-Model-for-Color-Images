function [ attack_image_color ] = attack_result(  D_img_1_r , D_img_2_r , D_img_3_r , D_img_4_r , D_img_5_r , D_img_6_r,D_img_1_g , D_img_2_g , D_img_3_g , D_img_4_g , D_img_5_g , D_img_6_g ,D_img_1_b , D_img_2_b , D_img_3_b , D_img_4_b , D_img_5_b , D_img_6_b )

%ATTACK SONUCUNDA ÇÖZÜLEN RESMİ GÖSTERİYOR

attack_result_r = D_img_1_r | D_img_2_r | D_img_3_r | D_img_4_r | D_img_5_r | D_img_6_r;
attack_result_g = D_img_1_g | D_img_2_g | D_img_3_g | D_img_4_g | D_img_5_g | D_img_6_g;
attack_result_b = D_img_1_b | D_img_2_b | D_img_3_b | D_img_4_b | D_img_5_b | D_img_6_b;
% 
% D_img_1_r , D_img_2_r , D_img_3_r , D_img_4_r , D_img_5_r , D_img_6_r,D_img_1_g , D_img_2_g , D_img_3_g , D_img_4_g , D_img_5_g , D_img_6_g ,D_img_1_b , D_img_2_b , D_img_3_b , D_img_4_b , D_img_5_b , D_img_6_b

figure,imshow(attack_result_r), 
figure,imshow(attack_result_g), 
figure,imshow(attack_result_b);
% 
attack_image_color(:,:,1) = attack_result_r;
attack_image_color(:,:,2) = attack_result_g;
attack_image_color(:,:,3) = attack_result_b;
%
attack_image_color = uint8 (attack_image_color);

for i=1:256
     for j=1:256
         for s=1:3
            if attack_image_color(i,j,s)== 1 %orjinali 1
                attack_image_color(i,j,s) = 255;
            end
        end
     end
end

figure,imshow(attack_image_color);
attack_image_color = double (attack_image_color);
end