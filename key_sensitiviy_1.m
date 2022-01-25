function [dif2] = key_sensitiviy_1( img ) %img = share1,2,3,4,5....

%ÞÝFRELENECEK RESÝM GELECEK


% con1 - dif1 - con2 - dif2 = 2 round
% FOR BINAY - GRAY LEVEL

% [E_img_1] = key_sensitiviy_1( share1 );
% [E_img_2] = key_sensitiviy_1( share2 );
% [E_img_3] = key_sensitiviy_1( share3 );
% [E_img_4] = key_sensitiviy_1( share4 );
% [E_img_5] = key_sensitiviy_1( share5 );
% [E_img_6] = key_sensitiviy_1( share6 );


% %RED
%  [E_img_1_r] = key_sensitiviy_1( share1_r );
%  [E_img_2_r] = key_sensitiviy_1( share2_r );
%  [E_img_3_r] = key_sensitiviy_1( share3_r );
%  [E_img_4_r] = key_sensitiviy_1( share4_r );
%  [E_img_5_r] = key_sensitiviy_1( share5_r );
%  [E_img_6_r] = key_sensitiviy_1( share6_r );
% 
%  
% %GREEN
%  
%  
%  [E_img_1_g] = key_sensitiviy_1( share1_g );
%  [E_img_2_g] = key_sensitiviy_1( share2_g );
%  [E_img_3_g] = key_sensitiviy_1( share3_g );
%  [E_img_4_g] = key_sensitiviy_1( share4_g );
%  [E_img_5_g] = key_sensitiviy_1( share5_g );
%  [E_img_6_g] = key_sensitiviy_1( share6_g );
% 
%  
% %BLUE
%  [E_img_1_b] = key_sensitiviy_1( share1_b );
%  [E_img_2_b] = key_sensitiviy_1( share1_b );
%  [E_img_3_b] = key_sensitiviy_1( share1_b );
%  [E_img_4_b] = key_sensitiviy_1( share1_b );
%  [E_img_5_b] = key_sensitiviy_1( share1_b );
%  [E_img_6_b] = key_sensitiviy_1( share1_b );


K= 'AFE16E25A23D9D178D059526D0B5C63471429DB435794F8A359004B490'; %paperdaki rakam (hex)
%K= 'AFE16E25A23D9D178D059526D0B5C63471429DB435794F8A359004B491';  % Key sensitivity analysis için
%K= 'AFE16E25A23D9D178D059526D0B5C63471429DB435794F8A359004B492';

Key  = changing_secret_key(K); %kaotik matris için ilk deðerler üretiliyor


[ S1 , S2 ] = Chaotic_Matrix( Key , img );

img_sur  = surrounding(img); %rastgele çerçeveleme iþlemi

%%round 1
con1  = ImageShuffling(img_sur, S1, 'encrypt'); %confusion1

dif1  = diffusionn( con1, S1, 'encrypt' ); %diffusion1


%%round 2

con2  = ImageShuffling(dif1, S2,'encrypt'); %confusion2

dif2  = diffusionn( con2, S2, 'encrypt' ); %diffusion2 artýk þifrelendi


E_img = uint8(dif2); %þifreli resim - ENCRYPTED IMAGE

%figure,imshow(E_img); %þifreli resim göster

%figure,
%subplot(221),imshow(img,[]),subplot(222),imhist(img),subplot(223),imshow(E_img),subplot(224),imhist(E_img);


dif2 = double(dif2); %çözmeye baþlýyoruz. Ýþlemler tersten.

end

% imshow(img,[]) double
% imshow(img) uint8