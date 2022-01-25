function [ T ] = ImageShuffling(img_sur, S , tip)

% Bit Manipulation Confusion

% P = imread('lena_gray_256.tif');
% P = rgb2gray(P);

% P = [1 2 ; 3 4];

% S = S1;
% S = S2;

[Q,W] = size(S);

q = ceil(log2(Q*W)); %256*256 için cevap = 16

% if max(img_sur(:))>1 %eðer resim binary deðilse. ki gri seviyeli = 255
%     b_p = 8;
% else
%     b_p = 1;
% end

T = zeros(Q,W);
R = zeros(Q,W); %R joint edilen matris


%a=0;

switch tip 
    case 'encrypt'
% encrypt iþlemi
        for i = 1:Q
            for j = 1:W
                
                %a=a+1;
                %index_matrix = dec2bin(a,8); diðer yöntem - index matris oluþturuluyor
                
                index_matrix = dec2bin((i-1)*W+j,q); %index matris oluþturuluyor
                %8 demek 8 bitlik yer ayýr demek. 8 biti aþarsa otomatik
                %geniþletiyor  
                
                img_sur_binary = dec2bin(img_sur(i,j),8); 
                %resmimizi 8 bitlik binarye çevirdik
                
                S_binary = dec2bin(S(i,j),8); 
                %kaotik matrisi 8 bitlik binarye çevirdik
                
                kaotik_index = strcat(S_binary,index_matrix);
                %kaotik matris ile index matrix birleþti.
                
                joint = strcat(kaotik_index,img_sur_binary);
                %en sonunda hepsi birleþti.
                
                R(i,j) = bin2dec(joint);
                %ve binary deðerleri decimal'e çevirdik.
     
            end
        end
        [R,I] = sort(R,2);
        [R,J] = sort(R,1); %decimal rakamlarý küçükten büyüðe doðru sýralanýþý
   
    %  BURADAKÝ I ve J matrislerini ters alma iþlemlerinde kullanacaðýz.
    %  I matrisi yukarýdan aþaðýya (her sütun ayný) artan sýrada 1'den baþlýyor. 
    %  R matrisi soldan saða (her satýr ayný) artan sýrada 1'den baþlýyor.
    
    
%  bu kýsým sýralanmýþ decimal deðerleri 
%   teker teker binary deðerlere çeviriyor
%   sonra da son 8 biti alýnýyor.
         
          for i = 1:Q
              for j = 1:W
                  t = dec2bin(R(i,j),8+q+8); %son 8 bit alýnacak
                  T(i,j) = bin2dec(t(1+8+q:end)); %son 8 bit alýnacak
              end
          end 
       
    case 'decrypt'
% decrypt iþlemi  
        C_t = R; % R decimal rakamlar. büyükten küçüðe olan.
        for i = 1:Q
            for j = 1:W
                
                index_matrix = dec2bin((i-1)*W+j,q);%index matris oluþturuluyor
                %8 demek 8 bitlik yer ayýr demek. 8 biti aþarsa otomatik
                %geniþletiyor 
                
                S_binary = dec2bin(S(i,j),8);        
                %kaotik matrisi 8 bitlik binary'e çevirdik
      
                kaotik_index = strcat(S_binary,index_matrix);
                %kaotik matris ile index matrix birleþti.
                
                
                R(i,j) = bin2dec(kaotik_index); %decimale çevirdik
            end
        end
        
        [R,I] = sort(R,2); %row'a göre küçükten büyüðe sýrala 
        [R,J] = sort(R,1); %column'a'a göre küçükten büyüðe sýrala
        % sonuçta büyükten küçüðe sýralandý
      
        
        
        for i = 1:Q
            for j = 1:W
                C_t(J(i,j),j) = img_sur(i,j);
            end
        end
        
        for i = 1:Q
            for j = 1:W
                T(i,I(i,j)) = C_t(i,j);
            end
        end
        
end
end