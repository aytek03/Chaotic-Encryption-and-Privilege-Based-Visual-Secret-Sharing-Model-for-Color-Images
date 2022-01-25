function [toplam] = chi_square(encrypted,plain)

for i = 1:256
toplam=0;
toplam = toplam + (encrypted(i)-plain(i))^2/(plain(i));
end

end

% [E_img_1, D_img_1] = main2(share1);
% [E_img_2, D_img_2] = main2(share2);
% [E_img_3, D_img_3] = main2(share3);
% [E_img_4, D_img_4] = main2(share4);
% [E_img_5, D_img_5] = main2(share5);
% [E_img_6, D_img_6] = main2(share6);
% 
% E_img_1 = uint8(E_img_1);
% E_img_2 = uint8(E_img_2);
% E_img_3 = uint8(E_img_3);
% E_img_4 = uint8(E_img_4);
% E_img_5 = uint8(E_img_5);
% E_img_6 = uint8(E_img_6);
% 
% 
% a1=imhist(E_img_1);
% a2=imhist(E_img_2);
% a3=imhist(E_img_3);
% a4=imhist(E_img_4);
% a5=imhist(E_img_5);
% a6=imhist(E_img_6);
% imghist = imhist(img);
% 
% imghist = uint8(imghist);
% a1 = uint8(a1);
% a2 = uint8(a2);
% a3 = uint8(a3);
% a4 = uint8(a4);
% a5 = uint8(a5);
% a6 = uint8(a6);
% 
% [toplam1] = chi_square(a1,imghist);
% [toplam2] = chi_square(a2,imghist);
% [toplam3] = chi_square(a3,imghist);
% [toplam4] = chi_square(a4,imghist);
% [toplam5] = chi_square(a5,imghist);
% [toplam6] = chi_square(a6,imghist);
% 
% toplam = (toplam1 + toplam2 + toplam3 + toplam4 + toplam5 + toplam6)/6;
