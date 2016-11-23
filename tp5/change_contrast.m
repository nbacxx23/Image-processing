close all;
clear all;

%to change the contrast space from [min, max] to [0,1]
I=double(imread('castle.jpg'))/256;
I= mean(I,3);

Min=min(min(I));
Max=max(max(I));

I_change=(I-Min)./(Max-Min);

figure;
imshow(I);
title('Origin picture');

figure;
imshow(I_change);
title('Change the contrast');