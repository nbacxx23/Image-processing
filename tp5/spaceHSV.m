close all;
clear all;

% To compare the color space HSV

I=double(imread('house.png'))/255;

HSV=rgb2hsv(I);
HSV_1=HSV;
HSV_1(:,:,2)=HSV_1(:,:,2)/2;

HSV_2=HSV;
HSV_2(:,:,2)=HSV_2(:,:,2)*1.5;

I_1=hsv2rgb(HSV_1);
I_2=hsv2rgb(HSV_2);

figure;
imshow(I);
title('Origin picture');

figure;
imshow(I_1);
title('S diminuer 50%');

figure;
imshow(I_2);
title('S boost 50%');

