%%Appliquer l'egalisation d'histogramme ? quelques images
clear all;
close all;
I = double(imread('castle.jpg'))/255;
I_1 = double(imread('ruins.jpg'))/255;
% for color image, histogram equalization should be applied respectively to
% three different channels
for i=1:3
    J(:,:,i) = histeq(I(:,:,i));
    J_1(:,:,i) = histeq(I_1(:,:,i));
end
figure;imshow(I);title('Original image castle');
figure;imshow(J);title('histogram euqlization castle');
figure;imshow(I_1);title('Original image ruins');
figure;imshow(J_1);title('histogram euqlization ruins');