function [ T ] = ImageShuffling(img_sur, S , tip)

% Bit Manipulation Confusion

% P = imread('lena_gray_256.tif');
% P = rgb2gray(P);

% P = [1 2 ; 3 4];

% S = S1;
% S = S2;

[Q,W] = size(S);

q = ceil(log2(Q*W)); %256*256 i�in cevap = 16

% if max(img_sur(:))>1 %e�er resim binary de�ilse. ki gri seviyeli = 255
%     b_p = 8;
% else
%     b_p = 1;
% end

T = zeros(Q,W);
R = zeros(Q,W); %R joint edilen matris


%a=0;

switch tip 
    case 'encrypt'
% encrypt i�lemi
        for i = 1:Q
            for j = 1:W
                
                %a=a+1;
                %index_matrix = dec2bin(a,8); di�er y�ntem - index matris olu�turuluyor
                
                index_matrix = dec2bin((i-1)*W+j,q); %index matris olu�turuluyor
                %8 demek 8 bitlik yer ay�r demek. 8 biti a�arsa otomatik
                %geni�letiyor  
                
                img_sur_binary = dec2bin(img_sur(i,j),8); 
                %resmimizi 8 bitlik binarye �evirdik
                
                S_binary = dec2bin(S(i,j),8); 
                %kaotik matrisi 8 bitlik binarye �evirdik
                
                kaotik_index = strcat(S_binary,index_matrix);
                %kaotik matris ile index matrix birle�ti.
                
                joint = strcat(kaotik_index,img_sur_binary);
                %en sonunda hepsi birle�ti.
                
                R(i,j) = bin2dec(joint);
                %ve binary de�erleri decimal'e �evirdik.
     
            end
        end
        [R,I] = sort(R,2);
        [R,J] = sort(R,1); %decimal rakamlar� k���kten b�y��e do�ru s�ralan���
   
    %  BURADAK� I ve J matrislerini ters alma i�lemlerinde kullanaca��z.
    %  I matrisi yukar�dan a�a��ya (her s�tun ayn�) artan s�rada 1'den ba�l�yor. 
    %  R matrisi soldan sa�a (her sat�r ayn�) artan s�rada 1'den ba�l�yor.
    
    
%  bu k�s�m s�ralanm�� decimal de�erleri 
%   teker teker binary de�erlere �eviriyor
%   sonra da son 8 biti al�n�yor.
         
          for i = 1:Q
              for j = 1:W
                  t = dec2bin(R(i,j),8+q+8); %son 8 bit al�nacak
                  T(i,j) = bin2dec(t(1+8+q:end)); %son 8 bit al�nacak
              end
          end 
       
    case 'decrypt'
% decrypt i�lemi  
        C_t = R; % R decimal rakamlar. b�y�kten k����e olan.
        for i = 1:Q
            for j = 1:W
                
                index_matrix = dec2bin((i-1)*W+j,q);%index matris olu�turuluyor
                %8 demek 8 bitlik yer ay�r demek. 8 biti a�arsa otomatik
                %geni�letiyor 
                
                S_binary = dec2bin(S(i,j),8);        
                %kaotik matrisi 8 bitlik binary'e �evirdik
      
                kaotik_index = strcat(S_binary,index_matrix);
                %kaotik matris ile index matrix birle�ti.
                
                
                R(i,j) = bin2dec(kaotik_index); %decimale �evirdik
            end
        end
        
        [R,I] = sort(R,2); %row'a g�re k���kten b�y��e s�rala 
        [R,J] = sort(R,1); %column'a'a g�re k���kten b�y��e s�rala
        % sonu�ta b�y�kten k����e s�raland�
      
        
        
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