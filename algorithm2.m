function [ C ] = algorithm2(img_sur, S , tip)

% Bit Manipulation Confusion

%P = imread('lena_gray_256.tif');
%P = rgb2gray(P);

%P = [1 2 ; 3 4];

%S = S1;
%S = S2;

[Q,W] = size(S);

q = ceil(log2(Q*W)); %256*256 i�in cevap = 16

if max(img_sur(:))>1 %e�er resim binary de�ilse. ki gri seviyeli = 255
    b_p = 8;
else
    b_p = 1;
end

C = zeros(Q,W);
T = C;
%a=0;
switch tip
    case 'encrypt'
        for i = 1:Q
            for j = 1:W
                
                index_matrix = dec2bin((i-1)*W+j,q); %index matris olu�turuluyor
                
%                 a=a+1;
%                 index_matrix = dec2bin(a,8); %index matris olu�turuluyor

                img_sur_binary = dec2bin(img_sur(i,j),b_p); 
                %resmimizi 8 bitlik binarye �evirdik
               
                S_binary = dec2bin(S(i,j),8); 
                %kaotik matrisi 8 bitlik binarye �evirdik
                
                joint = strcat(S_binary,index_matrix);
                %kaotik matris ile index matrix birle�ti.
                   
                joint = strcat(joint,img_sur_binary);
                %en sonunda hepsi birle�ti.
                
                T(i,j) = bin2dec(joint);
                %ve binary de�erleri decimal'e �evirdik.
            end
        end
        
        
        
        [T,I] = sort(T,2);
        [T,J] = sort(T,1); %decimal rakamlar� k���kten b�y��e do�ru s�ralan���
         
        
        for i = 1:Q
            for j = 1:W
                t = dec2bin(T(i,j),8+q+b_p);
                C(i,j) = bin2dec(t(1+8+q:end));
            end
        end 
 
        
    case 'decrypt'
        C_t = C;
        for i = 1:Q
            for j = 1:W
                
                index_matrix = dec2bin((i-1)*W+j,q);
%               a=a+1;
%               index_matrix = dec2bin(a,8); %index matris bu �ekilde de olabilir.                
               
                

                S_binary = dec2bin(S(i,j),8);%kaotik matrisi 8 bitlik binarye �evirdik
                temp_bin = strcat(S_binary,index_matrix);
                
                T(i,j) = bin2dec(temp_bin);
            end
        end
        
        [T,I] = sort(T,2); %row'a g�re k���kten b�y��e s�rala 
        [T,J] = sort(T,1); %column'a'a g�re k���kten b�y��e s�rala
        % sonu�ta b�y�kkten k����e s�raland�
        
        for i = 1:Q
            for j = 1:W
                C_t(J(i,j),j) = img_sur(i,j);
            end
        end
        
        for i = 1:Q
            for j = 1:W
                C(i,I(i,j)) = C_t(i,j);
            end
        end
        
end
end