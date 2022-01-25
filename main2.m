function [dif2 , P2 ] = main2(img) %share'ler gelecek

%clear all; variable gidiyor. DÝKKAT
%clc; SADECE COMMAND WÝNDOW GÝDÝYOR


% con1 - dif1 - con2 - dif2 = 2 round

%img = imread('lena.png');
%img = rgb2gray(img);% png. uzantýlý dosya için. 3 boyutludan 2 boyuta çevirme
%img = im2bw(img);
%img = double(img); % resim uint8se, double a çeviriyo. daha rahat iþlem yapabilmek için

%img = imread('sti\lena_gray_256.tif');

%FOR BINARY AND GRAY LEVEL IMAGE

%[E_img_1, D_img_1] = main2(share1);
%[E_img_2, D_img_2] = main2(share2);
%[E_img_3, D_img_3] = main2(share3);
%[E_img_4, D_img_4] = main2(share4);
%[E_img_5, D_img_5] = main2(share5);
%[E_img_6, D_img_6] = main2(share6);

%FOR COLOR IMAGE

%RED

%[E_img_1_r, D_img_1_r] = main2(share1_r);
%[E_img_2_r, D_img_2_r] = main2(share2_r);
%[E_img_3_r, D_img_3_r] = main2(share3_r);
%[E_img_4_r, D_img_4_r] = main2(share4_r);
%[E_img_5_r, D_img_5_r] = main2(share5_r);
%[E_img_6_r, D_img_6_r] = main2(share6_r);


%GREEN

%[E_img_1_g, D_img_1_g] = main2(share1_g);
%[E_img_2_g, D_img_2_g] = main2(share2_g);
%[E_img_3_g, D_img_3_g] = main2(share3_g);
%[E_img_4_g, D_img_4_g] = main2(share4_g);
%[E_img_5_g, D_img_5_g] = main2(share5_g);
%[E_img_6_g, D_img_6_g] = main2(share6_g);


%BLUE
%[E_img_1_b, D_img_1_b] = main2(share1_b);
%[E_img_2_b, D_img_2_b] = main2(share2_b);
%[E_img_3_b, D_img_3_b] = main2(share3_b);
%[E_img_4_b, D_img_4_b] = main2(share4_b);
%[E_img_5_b, D_img_5_b] = main2(share5_b);
%[E_img_6_b, D_img_6_b] = main2(share6_b);


[Key, B]  = algorithm1( ); %kaotik matris için ilk deðerler üretiliyor


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


con2  = diffusionn( dif2 , S2, 'decrypt'); %diffusion2
      
dif1  = ImageShuffling( con2, S2,'decrypt'); %confusion2
        
        
con1  = diffusionn( dif1, S1, 'decrypt'); %diffusion1
      
img_sur_2  = ImageShuffling( con1 , S1,'decrypt'); %confusion1 %artýk çözüldü

%img_sur_2 ile img_sur eþit olmasýný bekliyoruz

P2 = img_sur_2(2:end-1,2:end-1); % eklenen satýr ve sütunlar siliniyor. double tipinde

D_img = uint8(P2);  %þifresi çözülmüþ resim - DECRYPTED IMAGE

%figure,
%subplot(234),imshow(E_img),subplot(235),imshow(D_img,[]),subplot(236),imhist(D_img);

%1. resim ana resim, 2. resim hist, 3.resim þifreli, 4. resim hist., 5. resim
%çözülmüþ hali.


% figure,
% subplot(231),imshow(img,[]),subplot(232),imhist(img),subplot(233),imshow(E_img),subplot(234),imhist(E_img),subplot(235),imshow(D_img,[]);

%TITLE DAHÝL GRÝ TONLU
%figure,
%subplot(231),imshow(img,[]),title('a'),subplot(232),imhist(img),title('b'),subplot(233),imshow(E_img,[]),title('c'),subplot(234),imhist(E_img),title('d'),subplot(235),imshow(D_img,[]),title('e');

%TITLE DAHIL RENKLÝ GÖRÜNTÜ
%figure,
%subplot(241),imshow(img,[]),title('a'),subplot(242),imhist(Red),title('b'),subplot(243),imhist(Blue),title('c'),subplot(244),imhist(Green),title('d'),subplot(245),imshow(total_share,[]),title('e'),subplot(246),histogram(D_img_r),title('f'),subplot(247),histogram(D_img_g),title('g'),histogram(248),imhist(D_img_b),title('h');

% for i=1:W
%     for j=1:H
%         for s=1:X
%             if total_share(i,j,s)== 1 %orjinali 1
%                 total_share(i,j,s) = 255;
%             end
%         end
%     end
% end
% figure,imshow(total_share);

% shares = share1 | share2 | share3 | share4 | share5 | share6;
% decrypted_image = D_img_1 | D_img_2 | D_img_3 | D_img_4 | D_img_5 | D_img_6;
% 
% psnr_Value = PSNR(shares, decrypted_image);
% figure,imshow(shares), figure,imshow(decrypted_image);


% decrypted_image_r = D_img_1_r | D_img_2_r | D_img_3_r | D_img_4_r | D_img_5_r | D_img_6_r;
% decrypted_image_g = D_img_1_g | D_img_2_g | D_img_3_g | D_img_4_g | D_img_5_g | D_img_6_g;
% decrypted_image_b = D_img_1_b | D_img_2_b | D_img_3_b | D_img_4_b | D_img_5_b | D_img_6_b;
% 
% figure,imshow(decrypted_image_r), figure,imshow(decrypted_image_g), figure,imshow(decrypted_image_b);
% 
% decrypted_image_color(:,:,1) = decrypted_image_r;
% decrypted_image_color(:,:,2) = decrypted_image_g;
% decrypted_image_color(:,:,3) = decrypted_image_b;
%
% decrypted_image_color = uint8 (decrypted_image_color);

% for i=1:256
%     for j=1:256
%         for s=1:3
%             if decrypted_image_color(i,j,s)== 1 %orjinali 1
%                 decrypted_image_color(i,j,s) = 255;
%             end
%         end
%     end
% end
% figure,imshow(decrypted_image_color);
% end
%

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
%subplot(231),imshow(share1,[]),subplot(232),histogram(share1),subplot(233),imshow(E_img_1,[]),subplot(234),histogram(E_img_1),subplot(235),imshow(D_img_1);

%figure,
%subplot(231),imshow(share2,[]),subplot(232),histogram(share2),subplot(233),imshow(E_img_2,[]),subplot(234),histogram(E_img_2),subplot(235),imshow(D_img_2);

%figure,
%subplot(231),imshow(share3,[]),subplot(232),histogram(share3),subplot(233),imshow(E_img_3,[]),subplot(234),histogram(E_img_3),subplot(235),imshow(D_img_3);

%figure,
%subplot(231),imshow(share4,[]),subplot(232),histogram(share4),subplot(233),imshow(E_img_4,[]),subplot(234),histogram(E_img_4),subplot(235),imshow(D_img_4);

%figure,
%subplot(231),imshow(share5,[]),subplot(232),histogram(share5),subplot(233),imshow(E_img_5,[]),subplot(234),histogram(E_img_5),subplot(235),imshow(D_img_5);

%figure,
%subplot(231),imshow(share6,[]),subplot(232),histogram(share6),subplot(233),imshow(E_img_6,[]),subplot(234),histogram(E_img_6),subplot(235),imshow(D_img_6);



% RGB için 6 adet þifreli payýn görüntüsü 
%figure,subplot(231),imshow(E_img_1_r,[]),title('Share 1'),subplot(232),imshow(E_img_2_r,[]),title('Share 2'),subplot(233),imshow(E_img_3_r,[]),title('Share 3'),subplot(234),imshow(E_img_4_r,[]),title('Share 4'),subplot(235),imshow(E_img_5_r,[]),title('Share 5'),subplot(236),imshow(E_img_6_r,[]),title('Share 6');
%figure,subplot(231),imshow(E_img_1_g,[]),title('Share 1'),subplot(232),imshow(E_img_2_g,[]),title('Share 2'),subplot(233),imshow(E_img_3_g,[]),title('Share 3'),subplot(234),imshow(E_img_4_g,[]),title('Share 4'),subplot(235),imshow(E_img_5_g,[]),title('Share 5'),subplot(236),imshow(E_img_6_g,[]),title('Share 6');
%figure,subplot(231),imshow(E_img_1_b,[]),title('Share 1'),subplot(232),imshow(E_img_2_b,[]),title('Share 2'),subplot(233),imshow(E_img_3_b,[]),title('Share 3'),subplot(234),imshow(E_img_4_b,[]),title('Share 4'),subplot(235),imshow(E_img_5_b,[]),title('Share 5'),subplot(236),imshow(E_img_6_b,[]),title('Share 6');


%RGB için histagoram
%figure,subplot(231),hist(E_img_1_r),title('Share 1'),subplot(232),hist(E_img_2_r),title('Share 2'),subplot(233),hist(E_img_3_r),title('Share 3'),subplot(234),hist(E_img_4_r),title('Share 4'),subplot(235),hist(E_img_5_r),title('Share 5'),subplot(236),hist(E_img_6_r),title('Share 6');
%figure,subplot(231),hist(E_img_1_g),title('Share 1'),subplot(232),hist(E_img_2_g),title('Share 2'),subplot(233),hist(E_img_3_g),title('Share 3'),subplot(234),hist(E_img_4_g),title('Share 4'),subplot(235),hist(E_img_5_g),title('Share 5'),subplot(236),hist(E_img_6_g),title('Share 6');
%figure,subplot(231),hist(E_img_1_b),title('Share 1'),subplot(232),hist(E_img_2_b),title('Share 2'),subplot(233),hist(E_img_3_b),title('Share 3'),subplot(234),hist(E_img_4_b),title('Share 4'),subplot(235),hist(E_img_5_b),title('Share 5'),subplot(236),hist(E_img_6_b),title('Share 6');

% figure,subplot(231),histogram(E_img_1_r),title('Share 1'),subplot(232),histogram(E_img_2_r),title('Share 2'),subplot(233),histogram(E_img_3_r),title('Share 3'),subplot(234),histogram(E_img_4_r),title('Share 4'),subplot(235),histogram(E_img_5_r),title('Share 5'),subplot(236),histogram(E_img_6_r),title('Share 6');
% figure,subplot(231),histogram(E_img_1_g),title('Share 1'),subplot(232),histogram(E_img_2_g),title('Share 2'),subplot(233),histogram(E_img_3_g),title('Share 3'),subplot(234),histogram(E_img_4_g),title('Share 4'),subplot(235),histogram(E_img_5_g),title('Share 5'),subplot(236),histogram(E_img_6_g),title('Share 6');
% figure,subplot(231),histogram(E_img_1_b),title('Share 1'),subplot(232),histogram(E_img_2_b),title('Share 2'),subplot(233),histogram(E_img_3_b),title('Share 3'),subplot(234),histogram(E_img_4_b),title('Share 4'),subplot(235),histogram(E_img_5_b),title('Share 5'),subplot(236),histogram(E_img_6_b),title('Share 6');

end


% imshow(img,[]) double
% imshow(img) uint8
