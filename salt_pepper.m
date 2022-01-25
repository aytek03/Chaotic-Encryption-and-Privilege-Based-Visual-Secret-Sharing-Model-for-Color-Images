function [ dif2 , P2 ] = salt_pepper( img )


%clear all; variable gidiyor. DÝKKAT
%clc; SADECE COMMAND WÝNDOW GÝDÝYOR


% con1 - dif1 - con2 - dif2 = 2 round

%img = imread('lena_gray_256.tif');
%img = rgb2gray(img);% png. uzantýlý dosya için. 3 boyutludan 2 boyuta çevirme
%img = im2bw(img);
%img = double(img); % resim uint8se, double a çeviriyo. daha rahat iþlem yapabilmek için


%[E_img_1, D_img_1] = salt_pepper(share1);
%[E_img_2, D_img_2] = salt_pepper(share2);
%[E_img_3, D_img_3] = salt_pepper(share3);
%[E_img_4, D_img_4] = salt_pepper(share4);
%[E_img_5, D_img_5] = salt_pepper(share5);
%[E_img_6, D_img_6] = salt_pepper(share6);


% %RED
% [E_img_1_r, D_img_1_r] = salt_pepper(share1_r);
% [E_img_2_r, D_img_2_r] = salt_pepper(share2_r);
% [E_img_3_r, D_img_3_r] = salt_pepper(share3_r);
% [E_img_4_r, D_img_4_r] = salt_pepper(share4_r);
% [E_img_5_r, D_img_5_r] = salt_pepper(share5_r);
% [E_img_6_r, D_img_6_r] = salt_pepper(share6_r);
% 
% 
% %GREEN
% 
% [E_img_1_g, D_img_1_g] = salt_pepper(share1_g);
% [E_img_2_g, D_img_2_g] = salt_pepper(share2_g);
% [E_img_3_g, D_img_3_g] = salt_pepper(share3_g);
% [E_img_4_g, D_img_4_g] = salt_pepper(share4_g);
% [E_img_5_g, D_img_5_g] = salt_pepper(share5_g);
% [E_img_6_g, D_img_6_g] = salt_pepper(share6_g);
% 
% 
% %BLUE
% [E_img_1_b, D_img_1_b] = salt_pepper(share1_b);
% [E_img_2_b, D_img_2_b] = salt_pepper(share2_b);
% [E_img_3_b, D_img_3_b] = salt_pepper(share3_b);
% [E_img_4_b, D_img_4_b] = salt_pepper(share4_b);
% [E_img_5_b, D_img_5_b] = salt_pepper(share5_b);
% [E_img_6_b, D_img_6_b] = salt_pepper(share6_b);

Key  = algorithm1( ); %kaotik matris için ilk deðerler üretiliyor


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

%ATTACKLAR BURADA. ATTACKLAR ÞÝFRELÝ METNE UYGULANACAK.


dif2 = uint8(dif2); %çözmeye baþlýyoruz. Ýþlemler tersten.
dif2 = imnoise(dif2, 'salt & pepper',0.01);

%dif2 = double(dif2);
con2  = diffusionn( dif2 , S2, 'decrypt'); %diffusion2
      
dif1  = ImageShuffling( con2, S2,'decrypt'); %confusion2
        
        
con1  = diffusionn( dif1, S1, 'decrypt'); %diffusion1
      
img_sur_2  = ImageShuffling( con1 , S1,'decrypt'); %confusion1 %artýk çözüldü

%img_sur_2 ile img_sur eþit olmasýný bekliyoruz

P2 = img_sur_2(2:end-1,2:end-1); % eklenen satýr ve sütunlar siliniyor. double tipinde

D_img = double(P2);  %þifresi çözülmüþ resim - DECRYPTED IMAGE

%çözümler


% shares = share1 | share2 | share3 | share4 | share5 | share6;
% pepper_noise = D_img_1 | D_img_2 | D_img_3 | D_img_4 | D_img_5 | D_img_6;
% 
% psnr_Value = PSNR(shares, pepper_noise);
% ssim_index(shares, pepper_noise);
% figure,imshow(shares), figure,imshow(pepper_noise);


%figure,
%subplot(234),imshow(E_img),subplot(235),imshow(D_img,[]),subplot(236),imhist(D_img);

%1. resim ana resim, 2. resim hist, 3.resim þifreli, 4. resim hist., 5. resim
%çözülmüþ hali.


%figure,
%subplot(231),imshow(img,[]),subplot(232),imhist(img),subplot(233),imshow(E_img),subplot(234),imhist(E_img),subplot(235),imshow(D_img);



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