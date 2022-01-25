function [CQM PSNR] = cqm(orig_img, dist_img)

%========================================================================
%
% Copyright (c) 2012 Turgut Ozal University
%               Ankara, TURKEY
% All Rights Reserved.
% 
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
%
% Authors : Yildiray Yalman, Ismail Erturk 
% Version : 1.0
% 
% The author is with Turgut Ozal University
% Department of Computer Engineering, Ankara, TURKEY
%
% Kindly report any suggestions or corrections to yyalman@turgutozal.edu.tr
% yalmanyildiray@yahoo.com
% 
%
%========================================================================
%
% This is an efficient implementation of the algorithm for calculating
% the Histogram based Image Quality Index (HQI) proposed by Yildiray Yalman 
% Please refer to the paper "A New Color Image Quality Measure Based on 
% YUV Transformation and PSNR for Human Vision System”, 
% by Yildiray Yalman,Ismail Erturk published in 
% Turkish Journal of Electrical Engineering & Computer Sciences,
% vol. 21, no 2, pp. 603-612, 2013.
% In order to run this function, you must have Matlab's
% Image Processing Toobox.
%
% Input : an original image and a test image 
% Output: an overall quality result (dB)
%
% Usage:
%
% 1. Load the original image and the distorted image
%    into two matrices
%   (say orig_img and dist_img)
%
% 2. Run this functions as seen below:
%
%   [CQM PSNR] = cqm(orig_img, dist_img);
%
% 3. See the results:
%
%   CQM        % Gives the proposed quality result (dB)
%   PSNR       % Gives the classical PSNR quality result (dB)
%
%========================================================================

if (nargin == 1 || nargin > 2)
   CQM = -Inf;
   return;
end

if (size(orig_img) ~= size(dist_img))
   CQM = -Inf;
   return;
end

[M N Z]=size(orig_img);

if (Z<3)
    CQM = -Inf;
    return;
end

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%         Classical PSNR Calculation       %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    psnr1=PeakSignaltoNoiseRatio(orig_img(:,:,1),dist_img(:,:,1),255); % PSNR for R channel
    psnr2=PeakSignaltoNoiseRatio(orig_img(:,:,2),dist_img(:,:,2),255); % PSNR for G channel
    psnr3=PeakSignaltoNoiseRatio(orig_img(:,:,3),dist_img(:,:,3),255); % PSNR for B channel

    PSNR=(psnr1+psnr2+psnr3)/3;
    
       
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%       Reversible YUV Transformation      %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    YUV_img1=zeros(M,N,Z);
    YUV_img2=zeros(M,N,Z);

    for i=1:1:M*N
        %%% Original Image Trasnformation  %%%
        % Y=(R+2*G+B)/4 
        YUV_img1(i)=floor((orig_img(i)+orig_img(M*N+i)*2+orig_img(2*M*N+i))/4);   
        % U=R-G
        YUV_img1(M*N+i)=orig_img(i)-orig_img(M*N+i);
        % V=B-G
        YUV_img1(2*M*N+i)=orig_img(2*M*N+i)-orig_img(M*N+i);          

        %%% Distorted Image Transformation  %%%
        % Y=(R+2*G+B)/4 
        YUV_img2(i)=floor((dist_img(i)+dist_img(M*N+i)*2+dist_img(2*M*N+i))/4);  
        % U=R-G
        YUV_img2(M*N+i)=dist_img(i)-dist_img(M*N+i);      
        % V=B-G
        YUV_img2(2*M*N+i)=dist_img(2*M*N+i)-dist_img(M*N+i); 
        
    end
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%               CQM Calculation            %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Y_psnr=PeakSignaltoNoiseRatio(YUV_img1(:,:,1),YUV_img2(:,:,1),255); % PSNR for Y channel
    U_psnr=PeakSignaltoNoiseRatio(YUV_img1(:,:,2),YUV_img2(:,:,2),255); % PSNR for U channel
    V_psnr=PeakSignaltoNoiseRatio(YUV_img1(:,:,3),YUV_img2(:,:,3),255); % PSNR for V channel

   
    CQM=(Y_psnr*0.9449)+(U_psnr+V_psnr)/2*0.0551;
