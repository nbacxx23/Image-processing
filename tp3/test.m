clear all;
close all;

%the zooming factor 
zoom_factor=2;

%read image
 I=double(imread('house.png'))/255;
%gaussien Filter of the image
I_G=gaussianFilter(I, 0.8*sqrt(zoom_factor^2-1));
%compare the undersampling with or without gaussien filter
I_O=octave(I_G,zoom_factor,1);
octave(I,zoom_factor,1);

%gaussiencbe->undersampling->laplacien
I_L=Laplacien(I_O,0.05,10);
%test the different values of sigma snd iterations
%  for eps=[0.05,0.1,0.3]
%      for iter=[5,10,30]
%          I_L=Laplacien(I,eps,iter);
%      end
%  end