close all;
clear all;

% take two picture. Exchange the phases and remain the modules to tell
% which is more important to discriminate a picture.

I_1=double(imread('lena.bmp'))/255;
I_2=double(imread('boat512.gif'))/255;


%fourrier transform
DFT_1=fft2(I_1);
DFT_2=fft2(I_2);

%modules
R_1=abs(DFT_1);
R_2=abs(DFT_1);

%phases
Phase_1=angle(DFT_1);
Phase_2=angle(DFT_2);

%make the new pictures
Z_1 = R_1.*exp(i*Phase_2);
Z_2 = R_2.*exp(i*Phase_1);

%only take the real part to show
II_1=real(ifft2(Z_1));
II_2=real(ifft2(Z_2));

figure;
imshow(I_1);
title('Origine picture 1');

figure;
imshow(I_2);
title('Origine picture 2');

figure;
imshow(II_1);
title('module 1 with phase 2');

figure;
imshow(II_2);
title('module 2 with phase 1');


