close all;
clear all;

%Simulation de l'image observee: Prendre une image1 I et la convoler avec une Gaussienne
%pour obtenir J :=I*G (on pourra prendre le travail precedent sur la Gaussienne).
I=double(imread('lena.bmp'))/255;
[M,N,dim]=size(I);

sigma=10; %sigma=0.1

J=gaussianFilter(I,sigma);

% figure;
% imshow(real(J));
% title('Gaussian convolution');

DFT_J=fft2(J);

% We use directly the solution without the loop here%%%
sigma_2=sigma*sigma;
Nr = ifftshift((-fix(M/2):ceil(M/2)-1));
Nc = ifftshift((-fix(N/2):ceil(N/2)-1));
[Nc,Nr] = meshgrid(Nc,Nr);
dft_gauss_kernel=exp(-sigma_2*pi^2*((Nr/M).^2+(Nc/N).^2)/2);
I_deconvolution=ifft2(DFT_J./dft_gauss_kernel);
I_deconvolution=real(I_deconvolution);

figure;
imshow(I_deconvolution);
title('Deconvolution');

