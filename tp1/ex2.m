%2) ?crire un programme mettant en oeuvre: le zoom par zero padding (TFD).

%Entr¨¦e: une image et le facteur de zoom (entier). 
%Sortie: l'image zoom¨¦e. Tester et critiquer la m¨¦thode 
%pour un zoom de 2 et/ou 4 par exemple.

%Hint: On prendra soin d'ajuster la 
%constante de normalisation ("1/N", voir slide 9 ¨¦quation(1) %
%et son ¨¦quivalent en 2D slide 13) en fonction de la nouvelle 
%taille de l'image apr¨¨s zoom.

clear all; close all;
%given a factor to zoom
factor=2;
%load the image
I=double(imread('ceiling.png'))/255;
[M,N,dim]=size(I);
DFR_zoom=double(zeros(factor*M,factor*N,dim));
%translation DFT
DFT_I=fft2(I);
%
DFR_zoom(1:floor(M/2),1:floor(N/2),:)=DFT_I(1:floor(M/2),1:floor(N/2),:);
DFR_zoom(end:-1:end-floor(M/2)+1,1:floor(N/2),:)=DFT_I(end:-1:end-floor(M/2)+1,1:floor(N/2),:);
DFR_zoom(1:floor(M/2),end:-1:end-floor(N/2)+1,:)=DFT_I(1:floor(M/2),end:-1:end-floor(N/2)+1,:);
DFR_zoom(end:-1:end-floor(M/2)+1,end:-1:end-floor(N/2)+1,:)=DFT_I(end:-1:end-floor(M/2)+1,end:-1:end-floor(N/2)+1,:);
%multipy the amplitude
I_zoom=real(ifft2(DFR_zoom))*factor^2;

figure;
imshow(I_zoom);
title('Zooming');

figure;
imshow(I);
title('Origine');

