I_rgb = imread('peppers.png');
inprof = iccread('sRGB.icm');
outprof = iccread('USSheetfedCoated.icc');
C = makecform('icc',inprof,outprof);
I_cmyk = applycform(I_rgb,C);

I_cmyk1 = applycform(I_rgb,C);

I_cmyk2 = applycform(I_rgb,C);


I_cmyk(:,:,2)=0;
I_cmyk(:,:,3)=0;
imwrite(I_cmyk ,'cyan.tif','tif');

I_cmyk1(:,:,1)=0;
I_cmyk1(:,:,3)=0;
imwrite(I_cmyk1 ,'magenta.tif','tif');

I_cmyk2(:,:,1)=0;
I_cmyk2(:,:,2)=0;
imwrite(I_cmyk2 ,'yellow.tif','tif');

