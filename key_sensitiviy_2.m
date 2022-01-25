function [P2] = key_sensitiviy_2( dif2 ,img )

%ÞÝFRESÝ ÇÖZÜLECEK RESÝM GELECEK

% [D_img_1] = key_sensitiviy_2( E_img_1, share1 );
% [D_img_2] = key_sensitiviy_2( E_img_2, share2 );
% [D_img_3] = key_sensitiviy_2( E_img_3, share3 );
% [D_img_4] = key_sensitiviy_2( E_img_4, share4 );
% [D_img_5] = key_sensitiviy_2( E_img_5, share5 );
% [D_img_6] = key_sensitiviy_2( E_img_6, share6 );


% %RED

%  [D_img_1_r] = key_sensitiviy_2( E_img_1_r, share1_r );
%  [D_img_2_r] = key_sensitiviy_2( E_img_2_r, share2_r );
%  [D_img_3_r] = key_sensitiviy_2( E_img_3_r, share3_r );
%  [D_img_4_r] = key_sensitiviy_2( E_img_4_r, share4_r );
%  [D_img_5_r] = key_sensitiviy_2( E_img_5_r, share5_r );
%  [D_img_6_r] = key_sensitiviy_2( E_img_6_r, share6_r );
% 
%  
% %GREEN
%  
%  
%  [D_img_1_g] = key_sensitiviy_2( E_img_1_g, share1_g );
%  [D_img_2_g] = key_sensitiviy_2( E_img_2_g, share2_g );
%  [D_img_3_g] = key_sensitiviy_2( E_img_3_g, share3_g );
%  [D_img_4_g] = key_sensitiviy_2( E_img_4_g, share4_g );
%  [D_img_5_g] = key_sensitiviy_2( E_img_5_g, share5_g );
%  [D_img_6_g] = key_sensitiviy_2( E_img_6_g, share6_g );
% 
%  
% BLUE
%  [D_img_1_b] = key_sensitiviy_2( E_img_1_b, share1_b );
%  [D_img_2_b] = key_sensitiviy_2( E_img_2_b, share2_b );
%  [D_img_3_b] = key_sensitiviy_2( E_img_3_b, share3_b );
%  [D_img_4_b] = key_sensitiviy_2( E_img_4_b, share4_b );
%  [D_img_5_b] = key_sensitiviy_2( E_img_5_b, share5_b );
%  [D_img_6_b] = key_sensitiviy_2( E_img_6_b, share6_b );




%K= 'AFE16E25A23D9D178D059526D0B5C63471429DB435794F8A359004B490'; %paperdaki rakam (hex)
K= 'AFE16E25A23D9D178D059526D0B5C63471429DB435794F8A359004B491';  % Key sensitivity analysis için
%K= 'AFE16E25A23D9D178D059526D0B5C63471429DB435794F8A359004B492';

Key  = changing_secret_key(K); %kaotik matris için ilk deðerler üretiliyor


[ S1 , S2 ] = Chaotic_Matrix( Key , img );


dif2 = double(dif2); %çözmeye baþlýyoruz. Ýþlemler tersten.


con2  = diffusionn( dif2 , S2, 'decrypt'); %diffusion2
      
dif1  = ImageShuffling( con2, S2,'decrypt'); %confusion2
        
        
con1  = diffusionn( dif1, S1, 'decrypt'); %diffusion1
      
img_sur_2  = ImageShuffling( con1 , S1,'decrypt'); %confusion1 %artýk çözüldü

%img_sur_2 ile img_sur eþit olmasýný bekliyoruz

P2 = img_sur_2(2:end-1,2:end-1); % eklenen satýr ve sütunlar siliniyor. double tipinde

D_img = uint8(P2);

%figure,
%subplot(234),imshow(E_img),subplot(235),imshow(D_img,[]),subplot(236),imhist(D_img);

%1. resim ana resim, 2. resim hist, 3.resim þifreli, 4. resim hist., 5. resim
%çözülmüþ hali.


% figure,
% subplot(231),imshow(img,[]),subplot(232),imhist(img),subplot(233),imshow(dif2),subplot(234),imhist(dif2),subplot(235),imshow(D_img,[]);

%shares = share1 | share2 | share3 | share4 | share5 | share6;
%different_key = D_img_1 | D_img_2 | D_img_3 | D_img_4 | D_img_5 | D_img_6;
% 
%psnr_Value = PSNR(shares, different_key);

% figure,imshow(shares), figure,imshow(different_key,[]);



%SHARES
%figure,subplot(231),imshow(share1,[]),subplot(232),imshow(share2,[]),subplot(233),imshow(share3,[]),subplot(234),imshow(share4,[]),subplot(235),imshow(share5,[]),subplot(236),imshow(share6,[]);
%figure,subplot(231),histogram(share1),subplot(232),histogram(share2),subplot(233),histogram(share3),subplot(234),histogram(share4),subplot(235),histogram(share5),subplot(236),histogram(share6);
%figure,subplot(231),imhist(share1),subplot(232),imhist(share2),subplot(233),imhist(share3),subplot(234),imhist(share4),subplot(235),imhist(share5),subplot(236),imhist(share6);

% E_img_1 = uint8(E_img_1);
% E_img_2 = uint8(E_img_2);
% E_img_3 = uint8(E_img_3);
% E_img_4 = uint8(E_img_4);
% E_img_5 = uint8(E_img_5);
% E_img_6 = uint8(E_img_6);

%ÞÝFRELÝ
%figure,subplot(231),imshow(E_img_1),subplot(232),imshow(E_img_2),subplot(233),imshow(E_img_3),subplot(234),imshow(E_img_4),subplot(235),imshow(E_img_5),subplot(236),imshow(E_img_6);
%figure,subplot(231),imshow(E_img_1,[]),subplot(232),imshow(E_img_2,[]),subplot(233),imshow(E_img_3,[]),subplot(234),imshow(E_img_4,[]),subplot(235),imshow(E_img_5,[]),subplot(236),imshow(E_img_6,[]);
%figure,subplot(231),histogram(E_img_1),subplot(232),histogram(E_img_2),subplot(233),histogram(E_img_3),subplot(234),histogram(E_img_4),subplot(235),histogram(E_img_5),subplot(236),histogram(E_img_6);
%figure,subplot(231),imhist(E_img_1),subplot(232),imhist(E_img_2),subplot(233),imhist(E_img_3),subplot(234),imhist(E_img_4),subplot(235),imhist(E_img_5),subplot(236),imhist(E_img_6);

% D_img_1 = double(D_img_1);
% D_img_2 = double(D_img_2);
% D_img_3 = double(D_img_3);
% D_img_4 = double(D_img_4);
% D_img_5 = double(D_img_5);
% D_img_6 = double(D_img_6);


%ÇÖZÜLMÜÞ
%figure,subplot(231),imshow(D_img_1),subplot(232),imshow(D_img_2),subplot(233),imshow(D_img_3),subplot(234),imshow(D_img_4),subplot(235),imshow(D_img_5),subplot(236),imshow(D_img_6);
%figure,subplot(231),histogram(D_img_1),subplot(232),histogram(D_img_2),subplot(233),histogram(D_img_3),subplot(234),histogram(D_img_4),subplot(235),histogram(D_img_5),subplot(236),histogram(D_img_6);
%figure,subplot(231),imhist(D_img_1),subplot(232),imhist(D_img_2),subplot(233),imhist(D_img_3),subplot(234),imhist(D_img_4),subplot(235),imhist(D_img_5),subplot(236),imhist(D_img_6);


%HEPSÝ BÝR ARADA

%figure,
%subplot(231),imshow(share1,[]),subplot(232),imshow(E_img_1),subplot(233),imhist(E_img_1),subplot(234),imshow(D_img_1),subplot(235),imhist(D_img_1);

%figure,
%subplot(231),imshow(share2,[]),subplot(232),imshow(E_img_2),subplot(233),imhist(E_img_2),subplot(234),imshow(D_img_2),subplot(235),imhist(D_img_2);

%figure,
%subplot(231),imshow(share3,[]),subplot(232),imshow(E_img_3),subplot(233),imhist(E_img_3),subplot(234),imshow(D_img_3),subplot(235),imhist(D_img_3);

%figure,
%subplot(231),imshow(share4,[]),subplot(232),imshow(E_img_4),subplot(233),imhist(E_img_4),subplot(234),imshow(D_img_4),subplot(235),imhist(D_img_4);

%figure,
%subplot(231),imshow(share5,[]),subplot(232),imshow(E_img_5),subplot(233),imhist(E_img_5),subplot(234),imshow(D_img_5),subplot(235),imhist(D_img_5);

%figure,
%subplot(231),imshow(share6,[]),subplot(232),imshow(E_img_6),subplot(233),imhist(E_img_6),subplot(234),imshow(D_img_6),subplot(235),imhist(D_img_6);

end

% imshow(img,[]) double
% imshow(img) uint8