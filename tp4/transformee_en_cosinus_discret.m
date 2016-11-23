% Discrete Cosine Transform 
clear all;
close all;
% define the zoom factor
zoom_factor=20;
I= double(imread('lena.bmp'))/255;
% we will zoom in part of the image
I = I(192:320,192:320);
[M,N] = size(I);
% use the method zero_padding
I_zoom = zeroPadding(I,zoom_factor);
% use the method dct
D = dct2(I);                                      
D1 = idct2(D,M*zoom_factor,N*zoom_factor);        
D1 = D1*zoom_factor;
figure;imshow(I);title('original image');
figure;imshow(I_zoom);title('zoom by zero_padding');
figure;imshow(D1);title('zoom by DCT');