function [share_r, share_g, share_b, total_share ] = main3_dec_sonuc()


[ share1_r, share2_r , share3_r , share4_r , share5_r , share6_r, share1_g, share2_g, share3_g , share4_g , share5_g , share6_g, share1_b, share2_b , share3_b , share4_b , share5_b , share6_b ] = main3();

share_r = share1_r | share2_r | share3_r | share4_r | share5_r | share6_r;
share_g = share1_g | share2_g | share3_g | share4_g | share5_g | share6_g;
share_b = share1_b | share2_b | share3_b | share4_b | share5_b | share6_b;

figure,imshow(share_r), figure,imshow(share_g), figure,imshow(share_b);

total_share(:,:,1) = share_r;
total_share(:,:,2) = share_g;
total_share(:,:,3) = share_b;

total_share = uint8 (total_share);

%Siyah kare için = 0, beyaz kare için =1
%Siyah kare için = 0, beyaz kare için =255

for i=1:256
    for j=1:256
        for s=1:3
            if total_share(i,j,s)== 1 %orjinali 1
                total_share(i,j,s) = 255;
            end
        end
    end
end
figure,imshow(total_share);
end

