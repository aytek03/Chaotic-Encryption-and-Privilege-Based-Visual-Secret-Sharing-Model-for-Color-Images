function [share1, share2, share3, share4, share5, share6] = dispatching(img, c0, c1, n)

%img = imread('barbara.png');
%SI = floydHalftone(img)

%tif 2 boyutlu, png 3 boyutlu

%img = imread('sti\lena_gray_256.tif');
%img = rgb2gray(img); %3 boyuttan 2ye düþürüyor. gerçek-renkli resmi gri tonlu resme çeviriyor. RGB = RED GREEN BLUE RENKLÝ GÖRÜNTÜ
%SI = im2bw(img);  %binary resme çeviriyoruz
%SI  = ~SI; % beyazlara siyah gibi davranýyor. logical not iþlemi. 

SI = jarvisHalftone(img); %Jarvis ile HALFTONE yaptýk
%SI = floydHalftone(img); %Floyd ile HALFTONE yaptýk

SI  = ~SI;
[W, H] = size (SI); % SI resminin width ve height (satýr sütun)

m = n*(n-1)*(n-1)/2; %sütun sayýsýn

%pay görüntülerin içini ilk önce 0 ile doldurduk.
share = logical(zeros(W, H, n));

%a = randperm(m); 

for i = 1:W 
    for j = 1:H
        a = round(rand*(m-1))+1; 
        
        if SI(i,j) == 1 %0
           for x = 1:n       
            
                share(i,j,x) = c0(x,a);
           
           end
            
        else
            for x = 1:n 
           
                share(i,j,x) = c1(x,a);
           
            end
             
        end
    end
end

share1 = share(:,:,1);
share2 = share(:,:,2);
share3 = share(:,:,3);
share4 = share(:,:,4);
share5 = share(:,:,5);
share6 = share(:,:,6);

share1 = logical (share1);
share2 = logical (share2);
share3 = logical (share3);
share4 = logical (share4);
share5 = logical (share5);
share6 = logical (share6);

figure,imshow(share1);
figure,imshow(share2);
figure,imshow(share3);
figure,imshow(share4);
figure,imshow(share5);
figure,imshow(share6);


share1 = double(share1);
share2 = double(share2);
share3 = double(share3);
share4 = double(share4);
share5 = double(share5);
share6 = double(share6);

%figure,imshow(share1 | share2 | share3 | share4 | share5 | share6 );

%figure,imshow(share1 | share2);
%figure,imshow(share1 | share2 | share3 );
%figure,imshow(share1 | share2 | share3 | share4 );
%figure,imshow(share1 | share2 | share3 | share4 | share5 );
%figure,imshow(share1 | share2 | share3 | share4 | share5 | share6 );



%figure,imhist(share1); %histogram
%figure,imhist(share2);
%figure,imhist(share3);
%figure,imhist(share4);
%figure,imhist(share5);
%figure,imhist(share6);
%figure,imhist(img);

%figure,imshow(share(:,:,1) | share(:,:,2));
%figure,imshow(share(:,:,1) | share(:,:,2) | share(:,:,3) );
%figure,imshow(share(:,:,1) | share(:,:,2) | share(:,:,3) | share(:,:,4) );
%figure,imshow(share(:,:,1) | share(:,:,2) | share(:,:,3) | share(:,:,4) | share(:,:,5) );
%figure,imshow(share(:,:,1) | share(:,:,2) | share(:,:,3) | share(:,:,4) | share(:,:,5) | share(:,:,6) );

%total_share = share;
%for g=2:n
%   total_share(:,:,1) = total_share(:,:,1) | share(:,:,g);
%   figure,imshow(total_share(:,:,1));
%end
end