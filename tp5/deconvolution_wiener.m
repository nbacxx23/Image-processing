close all;
clear all;

I=double(imread('lena.bmp'))/255;
[M,N,dim]=size(I);

sigma=3.5; %sigma=0.1
bruit=normrnd(0,0.01,[M,N,dim]); %the white noise with sigma=0.01

J=gaussianFilter(I,sigma)+bruit;

DFT_J=fft2(J);
DFT_I=fft2(I);


% We use directly the solution without the loop here%%%
sigma_2=sigma*sigma;
Nr = ifftshift((-fix(M/2):ceil(M/2)-1));
Nc = ifftshift((-fix(N/2):ceil(N/2)-1));
[Nc,Nr] = meshgrid(Nc,Nr);
dft_gauss_kernel=exp(-sigma_2*pi^2*((Nr/M).^2+(Nc/N).^2)/2);
s_B=0.01^2; % sigma*sigma of the noise

%I_mean=mean(mean(DFT_J,1),2);
%s_X=mean(mean((DFT_J-I_mean).^2,1),2);
s_X=abs(DFT_I).^2;
wiener= dft_gauss_kernel.^2./(dft_gauss_kernel.^2.+(s_B./s_X))./dft_gauss_kernel.^2;
I_deconvolution=ifft2(DFT_J./wiener);
I_deconvolution=real(I_deconvolution);

figure;
imshow(I_deconvolution);
title('Wiener deconvolution with noise');