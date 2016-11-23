%1) ?crire un programme mettant en oeuvre: la translation par TFD d'une image.

%Entr¨¦e image, coordonn¨¦es vecteur de translation. Sortie l'image translat¨¦e.
%Tester pour une translation ¨¤ coordonn¨¦es non enti¨¨res (unit¨¦ le pixel) de 
%votre choix.

%Hint: On se souviendra que lorsque l'ordinateur calcule une TFD on a: 
%Des fr¨¦quences positives k/N dans la premi¨¨re moiti¨¦ du vecteur fft(u) 
%rang¨¦es dans l'ordre croissant. La seconde moiti¨¦ correspond aux fr¨¦quences 
%n¨¦gatives (k-N)/N.  Pour une image c'est la m¨ºme chose pour les deux coordonn¨¦es.
%---------------------------------------------------------------------------
clear all; close all;

%choose tranlation pixels: Tx, Ty
Tx=200.8;Ty=400.3;

%read image
I=double(imread('ceiling.png'))/255;
%DFT tranlation of the image
DFT_I=fft2(I);
%the size of the image
[M,N,dim]=size(DFT_I);

%first half of M
for k=1:(floor(M/2))
    for l=1:N
        phase_M(k,l)=exp(2*1i*pi*(k-1)/M*Ty);
    end
end

%second half of M
for k=(floor(M/2)+1):M
    for l=1:N
        phase_M(k,l)=exp(2*1i*pi*(k-1-M)/M*Ty);
    end
end

%first half of N
for k=1:M
    for l=1:(floor(N/2))
        phase_N(k,l)=exp(2*1i*pi*(l-1)/N*Tx);
    end
end

%second half of N
for k=1:M
    for l=(floor(N/2)+1):N
        phase_N(k,l)=exp(2*1i*pi*(l-1-N)/N*Tx);
    end
end

%multiply the phase channel by channel
Trans_DFT(:,:,1)=DFT_I(:,:,1).*phase_M.*phase_N;
Trans_DFT(:,:,2)=DFT_I(:,:,2).*phase_M.*phase_N;
Trans_DFT(:,:,3)=DFT_I(:,:,3).*phase_M.*phase_N;

Trans_I=real(ifft2(Trans_DFT));


figure;
imshow(Trans_I);
title('Translation');

figure;
imshow(I);
title('Origine');
